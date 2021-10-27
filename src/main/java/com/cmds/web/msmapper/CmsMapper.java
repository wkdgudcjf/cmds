package com.cmds.web.msmapper;

import com.cmds.web.config.MssqlDatasourceSelector;
import com.cmds.web.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@MssqlDatasourceSelector.Cms
@Mapper
public interface CmsMapper {

    List<Integer> selectFarmKeyList();

    List<Integer> selectCmsKeyList(Integer farmKey);

    Integer selectTurbineIoDevice(@Param("farmKey") Integer parmKey, @Param("cmsKey") Integer cmsKey);

    List<IoDevice> selectTurbineIoDeviceList(List<Turbine> turbineList);

    List<DriveTrainVibration> selectDriveTrainVibrationList(@Param("farmKey") Integer parmKey, @Param("cmsKey") Integer cmsKey);

    List<Channel> selectChannelList(@Param("farmKey") Integer parmKey, @Param("cmsKey") Integer cmsKey);

    List<Unit> selectUnitList(
            @Param("farmKey") Integer parmKey,
            @Param("cmsKey") Integer cmsKey,
            @Param("chNo") Integer chNo,
            @Param("chType") Integer chType
    );

    List<StageBin> selectStageBinList(
            @Param("farmKey") Integer parmKey,
            @Param("cmsKey") Integer cmsKey,
            @Param("chNo") Integer chNo,
            @Param("chType") Integer chType,
            @Param("unitNo") Integer unitNo,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate,
            @Param("number") Integer number
    );

}

