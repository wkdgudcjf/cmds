package com.cmds.web.mymapper;

import com.cmds.web.model.CmdsUser;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    CmdsUser selectUser(String email);
    
    List<CmdsUser> selectAllUser();
    
    void updateUserToAuth(CmdsUser cmdsUser);
    
    void insertUser(CmdsUser cmdsUser);
    
    void updateUser(CmdsUser cmdsUser);
}

