package com.cmds.web.mymapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.cmds.web.model.CmdsLevel;

@Mapper
public interface LevelMapper {
    List<CmdsLevel> selectLevel();
}

