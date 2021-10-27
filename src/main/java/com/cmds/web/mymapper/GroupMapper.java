package com.cmds.web.mymapper;

import com.cmds.web.model.CmdsGroup;
import com.cmds.web.model.CmdsGroupInfo;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GroupMapper {
    List<CmdsGroup> selectGroup();
    
    List<CmdsGroupInfo> selectGroupInfo(Integer groupID);
    
    void insertGroup(String groupName);
    
    void insertGroupInfo(CmdsGroupInfo cmdsGroupInfo);
    
    CmdsGroupInfo selectGroupInfoCheck(CmdsGroupInfo cmdsGroupInfo);
    
    void deleteGroup(Integer groupID);

	void deleteGroupInfo(Integer groupInfoID);
}

