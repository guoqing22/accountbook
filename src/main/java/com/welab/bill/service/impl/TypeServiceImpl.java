package com.welab.bill.service.impl;

import com.welab.bill.dao.TbdeposittypeMapper;
import com.welab.bill.dao.TbdrawtypeMapper;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.pojo.Tbdeposittype;
import com.welab.bill.pojo.Tbdrawtype;
import com.welab.bill.service.ITypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @package: com.welab.bill.service.impl
 * @author: qing
 * @date: 2018/1/1
 * @time: 11:39
 **/
@Service("typeservice")
public class TypeServiceImpl implements ITypeService{
    @Resource
    private TbdrawtypeMapper drawtypeMapper;
    private TbdeposittypeMapper deposittypeMapper;

    @Override
    public List<Tbdrawtype> listDrawType() {
        List<Tbdrawtype> drawtype = drawtypeMapper.getAll();
        return drawtype;
    }

    @Override
    public List<Tbdeposittype> listDepositType() {
        List<Tbdeposittype> deposittype = deposittypeMapper.getAll();
        return deposittype;
    }
}