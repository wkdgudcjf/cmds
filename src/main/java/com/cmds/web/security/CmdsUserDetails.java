package com.cmds.web.security;

import com.cmds.web.model.CmdsUser;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

public class CmdsUserDetails extends User {

    private CmdsUser cmdsUser;

    public CmdsUserDetails(CmdsUser cmdsUser) {
        super(cmdsUser.getEmail(), cmdsUser.getPassword(), AuthorityUtils.createAuthorityList("ROLE_USER"));
        this.cmdsUser = cmdsUser;
    }

    public CmdsUser getCmdsUser() {
        return cmdsUser;
    }
}
