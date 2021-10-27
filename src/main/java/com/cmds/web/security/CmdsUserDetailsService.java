package com.cmds.web.security;

import com.cmds.web.model.CmdsUser;
import com.cmds.web.mymapper.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CmdsUserDetailsService implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        CmdsUser cmdsUser = userMapper.selectUser(username);
        if (cmdsUser == null) {
            throw new UsernameNotFoundException("존재하지 않는 사용자입니다.");
        }
        return new CmdsUserDetails(cmdsUser);
    }
}
