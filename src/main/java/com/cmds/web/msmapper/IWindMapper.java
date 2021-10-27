package com.cmds.web.msmapper;

import com.cmds.web.config.MssqlDatasourceSelector;
import com.cmds.web.model.*;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@MssqlDatasourceSelector.IWind
@Mapper
public interface IWindMapper {

    String selectUnitName(Integer ioDevice);

    @MapKey("ioDevice")
    Map<Integer, UnitName> selectUnitNameList(List<IoDevice> ioDeviceList);

    List<WindTurbineGenerator> selectWindTurbineGeneratorList(Integer ioDevice);

    List<TurbineScada> selectTurbine10MScada(
            @Param("ioDevice") Integer ioDevice,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate
    );

    List<TurbinePowerCurveConfig> selectTurbinePowerCurveConfigList(Integer ioDevice);

    List<TurbineStats> selectTurbineStatsList(
            @Param("ioDevice") Integer ioDevice,
            @Param("dateType") DateType dateType,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate
    );

}

