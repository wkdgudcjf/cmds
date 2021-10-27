package com.cmds.web.mymapper;

import com.cmds.web.model.CmdsGroupInfo;
import com.cmds.web.model.Report;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ReportMapper {
    List<Report> selectReport(List<CmdsGroupInfo> groupInfoList);
    
    List<Report> selectReportLast(Map map);
    
    List<Report> selectReportTarget(@Param("farmKey") Integer parmKey, @Param("cmsKey") Integer cmsKey);

    void insertReport(Report report);
}

