package com.welab.bill.service;

import com.welab.bill.pojo.Tbdeposittype;
import com.welab.bill.pojo.Tbdrawtype;

import java.util.List;

/**
 * @package: com.welab.bill.service
 * @author: qing
 * @date: 2017/12/31
 * @time: 23:29
 **/
public interface ITypeService {
    /**
     * 查询所有收入选项
     * @return
     */
    public List<Tbdrawtype> listDrawType();

    /**
     * 查询所有支出选项
     * @return
     */
    public List<Tbdeposittype> listDepositType();

}
