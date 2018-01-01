package com.welab.bill.service.impl;

import com.welab.bill.dao.TbbillMapper;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.service.IBillService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @package: com.welab.bill.service.impl
 * @author: qing
 * @date: 2017/12/13
 * @time: 21:12
 **/
@Service("billservice")
public class BillServiceImpl implements IBillService {

    @Resource
    private TbbillMapper billMapper;

    @Override
    public boolean insertBill(Tbbill bill) {
        int num = billMapper.insertSelective(bill);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean updateBill(Tbbill bill) {
        int num = billMapper.updateByPrimaryKey(bill);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public boolean deleteBill(String billId) {
        int num = billMapper.deleteByPrimaryKey(billId);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Tbbill> selectBill(Date startdate,Date enddate) {
        List<Tbbill> list = new ArrayList<>();
        list = billMapper.selectByBillDate(startdate,enddate);
        return list;
    }
    @Override
    public List<Tbbill> findAll() {
        List<Tbbill> list = new ArrayList<>();
        list = billMapper.findAll();
        return list;
    }

    @Override
    public Tbbill selectByBillId(String billid) {
        Tbbill bill = billMapper.selectByPrimaryKey(billid);
        return bill;
    }

}
