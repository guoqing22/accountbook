package com.welab.bill.dao;

import com.welab.bill.pojo.Tbbill;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TbbillMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String billid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    int insert(Tbbill record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    int insertSelective(Tbbill record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    Tbbill selectByPrimaryKey(String billid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(Tbbill record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbbill
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(Tbbill record);

    List<Tbbill> selectByBillDate(@Param("start_date") Date start_date,@Param("end_date") Date end_date);

}