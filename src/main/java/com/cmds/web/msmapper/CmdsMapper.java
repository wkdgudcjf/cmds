package com.cmds.web.msmapper;

import com.cmds.web.config.MssqlDatasourceSelector;
import com.cmds.web.model.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@MssqlDatasourceSelector.Cmds
@Mapper
public interface CmdsMapper {

    List<Turbine> selectTurbineList(List<CmdsGroupInfo> groupInfoList);

    Turbine selectTurbine(@Param("farmKey") Integer parmKey, @Param("cmsKey") Integer cmsKey);

}

