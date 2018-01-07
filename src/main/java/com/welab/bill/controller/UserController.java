package com.welab.bill.controller;

import com.welab.bill.pojo.Tbuser;
import com.welab.bill.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @package: com.welab.bill.controller
 * @author: guoqing22
 * @date: 2017/11/24
 * @time: 16:19
 **/
@Controller
@RequestMapping("/bill")
public class UserController {
    @Resource
    private IUserService userService;
    private HttpServletRequest request;
    private Model model;

    /**
     * 注册
     *
     * @param user    接受用户信息 json
     * @param request
     * @return map json
     * @throws Exception
     */
    @RequestMapping("/register")
    @ResponseBody
    public Map<String, Object> register(@RequestBody Tbuser user,
                                        HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer username = user.getUsername();
        String password = user.getPassword();
        String name = user.getName();
        String sex = user.getSex();
        String info = user.getUserinfo();
        Date birthday = user.getBirthday();
        Double amount = user.getUseramount();
                if (userService.checkRegisterUsername(username)) {
            map.put("errormsg", "用户名重复");
        }
        if (!userService.checkRegisterUsername(username)) {
            if (birthday == null) {
                DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                birthday = format.parse("1970-01-01");
                user.setBirthday(birthday);
            }
            if (info == null) {
                info = "";
                user.setUserinfo(info);
            }
            if (amount == null) {
                amount = 0.00;
                user.setUseramount(amount);
            }
            if (userService.addUser(user)) {
                map.put("successmsg", "success");
            } else {
                map.put("errormsg", "注册失败，请稍后重试");
            }

        }

        return map;
    }

    /**
     * 登陆
     *
     * @param user    接收用户名和密码
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestBody Tbuser user,
                                     HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (user.getUsername() == null) {
            map.put("errormsg", "用户名不为空");
        } else if (user.getPassword() == null) {
            map.put("errormsg", "密码不为空");
        }
        user = userService.checkLogin(user.getUsername(), user.getPassword());
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "用户名或密码错误");
        }
        return map;
    }

    /**
     * 根据用户名查询用户信息
     *
     * @param user    用于接受用户名
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/getuserinfo")
    @ResponseBody
    public Map<String, Object> getUserInfo(@RequestBody Tbuser user,
                                           HttpServletRequest request) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (user.getUsername() == null) {
            map.put("errormsg", "用户名不为空");
        }
        user = userService.getUserByUserName(user.getUsername());
        if (user != null) {
            map.put("data", user);
        } else {
            map.put("data", "error");
        }
        return map;
    }


    @RequestMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        session.invalidate();
    }

    /**
     * index页面
     *
     * @return
     */
    @RequestMapping("/index")
    public String index() {
        return "index";
    }
}
