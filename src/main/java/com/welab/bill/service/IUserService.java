package com.welab.bill.service;

import com.welab.bill.pojo.Tbdeposittype;
import com.welab.bill.pojo.Tbuser;

import java.util.List;
import java.util.Map;

/**
 * @package: com.welab.bill.service
 * @author: guoqing22
 * @date: 2017/11/24
 * @time: 15:36
 **/
public interface IUserService {
    /**
     * 通过用户名显示用户信息
     * @param username 用户名
     * @return
     */
    public Tbuser getUserByUserName(Integer username);
    /**
     *验证登录
     * @param username 用户名
     * @param password 密码
     * @return
     */
    public Tbuser checkLogin(Integer username, String password);

    /**
     * 注册用户名重复验证
     * @param username 用户名
     * @return
     */
    public boolean checkRegisterUsername(Integer username);

    /**
     * 注册
     * @param user
     * @return
     */
    public boolean addUser(Tbuser user);



}
