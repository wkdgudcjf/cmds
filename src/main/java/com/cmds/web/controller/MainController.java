package com.cmds.web.controller;

import com.cmds.web.model.*;
import com.cmds.web.msmapper.CmdsMapper;
import com.cmds.web.msmapper.CmsMapper;
import com.cmds.web.msmapper.IWindMapper;
import com.cmds.web.mymapper.GroupMapper;
import com.cmds.web.mymapper.ReportMapper;
import com.cmds.web.mymapper.UserMapper;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@Controller
public class MainController {

	@Autowired
	private CmdsMapper cmdsMapper;

	@Autowired
	private CmsMapper cmsMapper;

	@Autowired
	private IWindMapper iWindMapper;

	@Autowired
	private ReportMapper reportMapper;

	@Autowired
   	private GroupMapper groupMapper;
	
	private final String[] directionList = new String[]{
			"N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"
	};

	@Secured("ROLE_USER")
	@RequestMapping({"/", "/index"})
	public ModelAndView index(CmdsUser cmdsUser) {
		
		List<CmdsGroupInfo> groupInfoList = groupMapper.selectGroupInfo(cmdsUser.getGroupID());
		
		List<Turbine> turbineList;
        if(groupInfoList.size() == 0)
        {
        	turbineList = new ArrayList<Turbine>();
        }
        else
        {
        	turbineList = cmdsMapper.selectTurbineList(groupInfoList);
    		for (Turbine turbine : turbineList) {
    			Integer ioDevice = cmsMapper.selectTurbineIoDevice(turbine.getFarmKey(), turbine.getCmsKey());
    			String unitName = iWindMapper.selectUnitName(ioDevice);
    			turbine.setUnitName(unitName);
    		}
        }

		final ModelAndView modelAndView	= new ModelAndView("index");
		modelAndView.addObject("turbineList", turbineList);
		cmdsUser.setMain(false);
		modelAndView.addObject("user", cmdsUser);
		return modelAndView;
	}

	@Secured("ROLE_USER")
	@RequestMapping({"/api/indexLoadData"})
	public ResponseEntity<List<Turbine>> indexLoadData(CmdsUser cmdsUser) {
		
		List<CmdsGroupInfo> groupInfoList = groupMapper.selectGroupInfo(cmdsUser.getGroupID());
		
		List<Turbine> turbineList;
        if(groupInfoList.size() == 0)
        {
        	turbineList = new ArrayList<Turbine>();
        }
        else
        {
        	turbineList = cmdsMapper.selectTurbineList(groupInfoList);
			final List<IoDevice> ioDeviceList = cmsMapper.selectTurbineIoDeviceList(turbineList);
			final Map<Integer, UnitName> unitNameMap = iWindMapper.selectUnitNameList(ioDeviceList);
    		for (Turbine turbine : turbineList) {
				ioDeviceList
					.stream()
					.filter(
						ioDevice ->
							turbine.getCmsKey() == (int) ioDevice.getCmsKey()
							&& turbine.getFarmKey() == (int) ioDevice.getFarmKey()
					)
					.findFirst()
					.map(ioDevice -> unitNameMap.get(ioDevice.getIoDevice()))
					.ifPresent(unitName -> turbine.setUnitName(unitName.getUnitName()));
    		}
        }
        return new ResponseEntity<>(turbineList, HttpStatus.OK);
	}
	
	public ResponseEntity<List<CmdsGroupInfo>> selectGroup(@RequestParam("groupID") Integer groupID , CmdsUser cmdsUser) {
		 return new ResponseEntity<>(groupMapper.selectGroupInfo(groupID), HttpStatus.OK);
	}
	@Secured("ROLE_USER")
	@RequestMapping("/page/wind-info")
	public ModelAndView windInfo(
			@RequestParam("farmKey") Integer farmKey,
			@RequestParam("cmsKey") Integer cmsKey,
			CmdsUser cmdsUser
	) {
		final Turbine turbine = cmdsMapper.selectTurbine(farmKey, cmsKey);
		final Integer ioDevice = cmsMapper.selectTurbineIoDevice(farmKey, cmsKey);
		final List<WindTurbineGenerator> windTurbineGeneratorList = iWindMapper.selectWindTurbineGeneratorList(ioDevice);
		final List<DriveTrainVibration> driveTrainVibrationList = cmsMapper.selectDriveTrainVibrationList(farmKey, cmsKey);
		final List<Report> reportList = reportMapper.selectReportTarget(farmKey, cmsKey);

		String unitName = iWindMapper.selectUnitName(ioDevice);
		cmdsUser.setMain(true);
		cmdsUser.setFarmKey(farmKey);
		cmdsUser.setCmsKey(cmsKey);
		
		final ModelAndView modelAndView = new ModelAndView("page/wind-info");
		modelAndView.addObject("user", cmdsUser);
		modelAndView.addObject("turbine", turbine);
		modelAndView.addObject("unitName", unitName);
		modelAndView.addObject("windTurbineGeneratorList", windTurbineGeneratorList);
		modelAndView.addObject("driveTrainVibrationList", driveTrainVibrationList);
		modelAndView.addObject("reportList", reportList);
		return modelAndView;
	}
	
	@Secured("ROLE_USER")
	@RequestMapping({"/api/windInfoLoadData"})
	public ResponseEntity<Map> windInfoLoadData(CmdsUser cmdsUser) {
		Integer farmKey = cmdsUser.getFarmKey();
		Integer cmsKey = cmdsUser.getCmsKey();
		
		final Turbine turbine = cmdsMapper.selectTurbine(farmKey, cmsKey);
		final Integer ioDevice = cmsMapper.selectTurbineIoDevice(farmKey, cmsKey);
		final List<WindTurbineGenerator> windTurbineGeneratorList = iWindMapper.selectWindTurbineGeneratorList(ioDevice);
		final List<DriveTrainVibration> driveTrainVibrationList = cmsMapper.selectDriveTrainVibrationList(farmKey, cmsKey);
		final List<Report> reportList = reportMapper.selectReportTarget(farmKey, cmsKey);
			
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("wto", turbine);
		map.put("wtg", windTurbineGeneratorList);
		map.put("dtv", driveTrainVibrationList);
		map.put("his", reportList);
		
        return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@Secured("ROLE_USER")
	@RequestMapping("/page/turbine-info")
	public ModelAndView turbineInfo(
			@RequestParam("farmKey") Integer farmKey,
			@RequestParam("cmsKey") Integer cmsKey,
			@RequestParam(value = "startDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date startDate,
			@RequestParam(value = "endDate", required = false) @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date endDate,
			CmdsUser cmdsUser
	) {
		if (startDate == null || endDate == null) {
			startDate = DateUtils.addMonths(new Date(), -1);
			endDate = new Date();
		}

		final Integer ioDevice = cmsMapper.selectTurbineIoDevice(farmKey, cmsKey);
		final List<TurbineScada> turbineScadaList = iWindMapper.selectTurbine10MScada(
			ioDevice,
			DateFormatUtils.format(startDate, "yyyyMMdd000000"),
			DateFormatUtils.format(endDate, "yyyyMMdd235959")
		);

		final Map<String, List<Double>> windRoseGraphMap = this.calculateWindRoseGraphMap(turbineScadaList);

		final List<TurbinePowerCurveConfig> turbinePowerCurveConfigList = iWindMapper.selectTurbinePowerCurveConfigList(ioDevice);
		final Map<String, List<Double>> turbinePowerCurveGraphMap = this.calculateTurbinePowerCurveGraph(turbinePowerCurveConfigList);

		final List<Channel> channelList = cmsMapper.selectChannelList(farmKey, cmsKey);
		
		String unitName = iWindMapper.selectUnitName(ioDevice);
		cmdsUser.setMain(true);
		cmdsUser.setFarmKey(farmKey);
		cmdsUser.setCmsKey(cmsKey);

		final ModelAndView modelAndView = new ModelAndView("page/turbine-info");
		modelAndView.addObject("unitName", unitName);
		modelAndView.addObject("farmKey", farmKey);
		modelAndView.addObject("cmsKey", cmsKey);
		modelAndView.addObject("user", cmdsUser);
		modelAndView.addObject("startDate", startDate);
		modelAndView.addObject("endDate", endDate);
		modelAndView.addObject("windRoseGraphMap", windRoseGraphMap);
		modelAndView.addObject("turbineScadaList", turbineScadaList);
        modelAndView.addObject("turbinePowerCurveGraphMap", turbinePowerCurveGraphMap);
        modelAndView.addObject("channelList", channelList);
		return modelAndView;
	}

	@RequestMapping(value = "/api/unitList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public @ResponseBody List<Unit> unitList(
			@RequestParam("farmKey") Integer farmKey,
			@RequestParam("cmsKey") Integer cmsKey,
			@RequestParam("chNo") Integer chNo,
			@RequestParam("chType") Integer chType,
			CmdsUser cmdsUser
	) throws IllegalAccessException {
		if (cmdsUser == null) {
			throw new IllegalAccessException();
		}

		return cmsMapper.selectUnitList(farmKey, cmsKey, chNo, chType);
	}

	@RequestMapping(value = "/api/cmsTrend", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody Map<String, List<StageBin>> cmdsTrend(
        @RequestParam("farmKey") Integer farmKey,
        @RequestParam("cmsKey") Integer cmsKey,
        @RequestParam("chNo") Integer chNo,
		@RequestParam("chType") Integer chType,
        @RequestParam("unitNo") Integer unitNo,
        @RequestParam("startDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date startDate,
        @RequestParam("endDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date endDate,
		CmdsUser cmdsUser
    ) throws IllegalAccessException {
		if (cmdsUser == null) {
			throw new IllegalAccessException();
		}

        Map<String, List<StageBin>> result = new HashMap<>();
        for (int i = 0; i < 6; i++) {
            final List<StageBin> stageBinList = cmsMapper.selectStageBinList(
                    farmKey,
                    cmsKey,
                    chNo,
                    chType,
                    unitNo,
                    DateFormatUtils.format(startDate, "yyyyMMdd000000"),
                    DateFormatUtils.format(endDate, "yyyyMMdd235959"),
                    i
            );
            result.put("stageBin" + i, stageBinList);
        }
        return result;
    }

    @RequestMapping(value = "/api/turbineStats", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody Map<String, Object> turbineStats(
            @RequestParam("farmKey") Integer farmKey,
            @RequestParam("cmsKey") Integer cmsKey,
            @RequestParam("dateType") DateType dateType,
			CmdsUser cmdsUser
    ) throws IllegalAccessException {
		if (cmdsUser == null) {
			throw new IllegalAccessException();
		}

        final Integer ioDevice = cmsMapper.selectTurbineIoDevice(farmKey, cmsKey);
        Date startDate = new Date();
		Date endDate = new Date();
        if (dateType == DateType.HOUR) {
			startDate = DateUtils.truncate(DateUtils.addDays(startDate, -1), Calendar.HOUR_OF_DAY);
			endDate = DateUtils.addDays(startDate, 1);
			endDate = DateUtils.addHours(endDate, -1);
		} else if (dateType == DateType.DAY) {
			startDate = DateUtils.truncate(DateUtils.addMonths(startDate, -1), Calendar.DAY_OF_MONTH);
			endDate = DateUtils.addMonths(startDate, 1);
			endDate = DateUtils.addDays(endDate, -1);
		} else if (dateType == DateType.MONTH) {
			startDate = DateUtils.truncate(DateUtils.addYears(startDate, -1), Calendar.MONTH);
			endDate = DateUtils.addYears(startDate, 1);
			endDate = DateUtils.addMonths(endDate, -1);
		}

        final Map<String, Object> response = new HashMap<>();
        response.put("startDate", startDate.getTime());
		response.put("endDate", endDate.getTime());
		response.put("data", iWindMapper.selectTurbineStatsList(
				ioDevice,
				dateType,
				DateFormatUtils.format(startDate, "yyyyMMddHHmmss"),
				DateFormatUtils.format(endDate, "yyyyMMddHHmmss")
		));
        return response;
    }

    /**
     * 뷰에서 그래프 그리기 적합한 형태로 변환
     * 방향 : 바람 세기별 퍼센트 (6개)
     * @param turbineScadaList
     * @return
     */
	private Map<String, List<Double>> calculateWindRoseGraphMap(final List<TurbineScada> turbineScadaList) {
		final Map<String, List<Double>> windRoseGraphMap = new HashMap<>();

		// 초기화
		for (String direction : directionList) {
			final List<Double> zeroList = new ArrayList<>();
			for (int i = 0; i < 6; i++) {
				zeroList.add(0.0);
			}
			windRoseGraphMap.put(direction, zeroList);
		}

		// turbineScadaList가 없는 경우 계산하지 않음
		if (CollectionUtils.isEmpty(turbineScadaList)) {
			return windRoseGraphMap;
		}

		// 각 방향, 속도별로 카운트
		for (TurbineScada turbineScada : turbineScadaList) {
			final String windDirection = calculateDirection(turbineScada.getWindDirection());
			final int windSpeedRange = calculateWindSpeedRage(turbineScada.getWindSpeed());
			final double count = windRoseGraphMap.get(windDirection).get(windSpeedRange);
			windRoseGraphMap.get(windDirection).set(windSpeedRange, count + 1);
		}

		// 개수로 나누어 % 계산
		for (String direction : directionList) {
			for (int i = 0; i < 6; i++) {
				final double count = windRoseGraphMap.get(direction).get(i);
				windRoseGraphMap.get(direction).set(i, count / turbineScadaList.size());
			}
		}

		return windRoseGraphMap;
	}

	public String calculateDirection(Double windDrection) {
		double rounded = (double) Math.round(windDrection * 100) / 100;
		double floor = Math.floor((rounded + 11.25) / 22.5);
		int direction = (int) floor % 16;
		return directionList[direction];
	}

	private int calculateWindSpeedRage(Double windSpeed) {
		if (windSpeed < 1.54) return 0;
		if (windSpeed < 3.09) return 1;
		if (windSpeed < 5.14) return 2;
		if (windSpeed < 8.23) return 3;
		if (windSpeed < 10.80) return 4;
		return 5;
	}

    /**
     * 뷰에서 그래프 만들기 적합한 형태로 변환
     * 레벨 : 데이터 리스트(250개)
     * @param turbinePowerCurveConfigList
     * @return
     */
	private Map<String, List<Double>> calculateTurbinePowerCurveGraph(final List<TurbinePowerCurveConfig> turbinePowerCurveConfigList) {
	    final Map<String, List<Double>> turbinePowerCurveGraph = new HashMap<>();
        for (TurbinePowerCurveConfig turbinePowerCurveConfig : turbinePowerCurveConfigList) {
            final String[] stringList = turbinePowerCurveConfig.getData().split(",");
            final List<Double> doubleList = new ArrayList<>();
            for (String data : stringList) {
                doubleList.add(Double.parseDouble(data));
            }
            turbinePowerCurveGraph.put(turbinePowerCurveConfig.getLevel(), doubleList);
        }
        return turbinePowerCurveGraph;
    }

    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    @ExceptionHandler(IllegalAccessException.class)
    public void handleUnauthorizedException() {
	}
}