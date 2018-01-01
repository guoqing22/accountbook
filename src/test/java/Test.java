import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.service.IBillService;
import com.welab.bill.service.impl.BillServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import javax.annotation.Resource;
import java.util.List;

/**
 * @package: PACKAGE_NAME
 * @author: qing
 * @date: 2017/12/13
 * @time: 20:03
 **/
public class Test {
    /*@Resource
            private  IBillService billService;
    int pageNo = 2;
    int pageSize = 10;
    PageHelper.startPage(pageNo, pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
    List<Tbbill> list = billService.finAll() ;
    PageInfo page = new PageInfo(list);
    System.out.println(page.toString());*/
}
