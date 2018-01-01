package com.welab.bill.service.impl;

import com.welab.bill.dao.TbuserMapper;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.pojo.Tbuser;
import com.welab.bill.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @package: com.welab.bill.service.impl
 * @author: guoqing22
 * @date: 2017/11/24
 * @time: 15:44
 **/
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private TbuserMapper userMapper;

    @Override
    public Tbuser getUserByUserName(Integer username) {
        Tbuser user = userMapper.selectByPrimaryKey(username);
        return user;
    }


    @Override
    public Tbuser checkLogin(Integer username, String password) {
        Tbuser user = userMapper.selectByPrimaryKey(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    @Override
    public boolean checkRegisterUsername(Integer username) {
        Tbuser user = userMapper.selectByPrimaryKey(username);
        if (user == null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public boolean addUser(Tbuser user) {
        int num = userMapper.insert(user);
        if (num == 0) {
            return false;
        } else {
            return true;
        }
    }


}
