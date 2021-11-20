package com.axjy.controller.common;

import com.axjy.pojo.generalCharge.ChargeRecord;
import com.axjy.pojo.sys.User;
import com.axjy.service.generalCharge.ChargeRecordService;
import com.axjy.utils.Constants;
import com.axjy.utils.Result;
import lombok.SneakyThrows;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRMapArrayDataSource;
import org.apache.ibatis.io.Resources;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Joe on 2021/10/27 下午 23:27
 */
@Controller
public class BaseController {



    @Resource
    private DataSource dataSource;
    @Resource
    private ChargeRecordService chargeRecordService;


    private JRDataSource createReportDataSource(){
        JRMapArrayDataSource dataSource;

        Map[] resportRows = initializeMapArray();

        dataSource= new JRMapArrayDataSource(resportRows);

        return dataSource;
    }

    private Map[] initializeMapArray(){
        HashMap[]reportRows = new HashMap[4];

        HashMap row1Map = new HashMap();

        row1Map.put("studentFeeDate","2011-11");

        row1Map.put("studentChargeGrooveName","sdfsd");

        row1Map.put("studentChargeUnivalence",22.0);
        row1Map.put("studentLittleAmount",22.0);

        reportRows[0]= row1Map;
        return reportRows;
    }

    @SneakyThrows
    @GetMapping("/exportFeePDF")
    public void exportFeePdf(Long id, HttpServletResponse response){
        JRDataSource dataSource = createReportDataSource();
        System.out.println(id);
        ChargeRecord record = chargeRecordService.selectById(id);
        try {
            Map<String,Object> params = new HashMap<>();
            params.put("studentGrooveName",record.getStudentName());
            params.put("studentClassName",record.getStudentClassName());
            params.put("studentFeeDate", record.getStudentFeeDate());
            params.put("totalAmount", "1000");
            response.setContentType("application/pdf");
            InputStream in = Resources.getResourceAsStream("jasper/FeeRecords.jasper");
            //引入外部.jasper的方式
            //1. 使用 PathMatchingResourcePatternResolver
            //2. 使用 new ClassPathResource("")
            //3. Resources.getResourceAsStream()
            ServletOutputStream outputStream = response.getOutputStream();
            JasperRunManager.runReportToPdfStream(in,outputStream,params, dataSource);
            outputStream.flush();
            outputStream.close();
            //
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JRException e) {
            e.printStackTrace();
        }

    }

    @SneakyThrows
    @GetMapping("/exportPDF")
    public void exportPdf(Integer gardenId, HttpServletResponse response, HttpSession session){
        User user = (User) session.getAttribute(Constants.USER_SESSION);
        Map<String,Object> params = new HashMap<>();
        params.put("gardenId",gardenId);
        params.put("userName",user.getUserName());
        params.put("date", LocalDate.now().toString());
        response.setContentType("application/pdf");
        InputStream in = Resources.getResourceAsStream("jasper/posList.jasper");
        //引入外部.jasper的方式
        //1. 使用 PathMatchingResourcePatternResolver
        //2. 使用 new ClassPathResource("")
        //3. Resources.getResourceAsStream()
        ServletOutputStream outputStream = response.getOutputStream();
        JasperRunManager.runReportToPdfStream(in,outputStream,params, dataSource.getConnection());
        outputStream.close();
    }
}
