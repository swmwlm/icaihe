package com.robotsafebox.web.api;

import com.robotsafebox.base.json.JsonResult;
import com.robotsafebox.entity.HardwareReportLog;
import com.robotsafebox.entity.demo1.Seckill;
import com.robotsafebox.framework.model.Pager;
import com.robotsafebox.framework.properties.Constant;
import com.robotsafebox.framework.sms.ihuyi.IHYSmsSendUtils;
import com.robotsafebox.service.HardwareReportLogService;
import com.robotsafebox.service.demo1.SeckillService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
//@RequestMapping("/api/v1")  // url:  /模块/资源/{id}细分
@RequestMapping(Constant.API_HEAD_URL)  // url:  /模块/资源/{id}细分
@Scope("prototype")
//【demo测试类】
public class UserController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private SeckillService seckillService;

    @Resource
    private HardwareReportLogService hardwareReportLogService;


    @RequestMapping(value = "/demo", method = RequestMethod.GET, produces = {Constant.CONTENT_TYPE_JSON})
    @ResponseBody
    public JsonResult demo() {
        JsonResult jsonResult = new JsonResult();
        try {
            Pager pager = new Pager();
            pager.setPageSize(5);
            List<Seckill> list = seckillService.getSeckillListByPager(pager);
            pager.setResults(list);
            jsonResult.setData(pager);
            jsonResult.setMessage("获取数据成功！");
            jsonResult.setStateSuccess();
        } catch (Exception ex) {
            ex.printStackTrace();
            jsonResult.setMessage(Constant.EXCEPTION_MESSAGE);
        }
        return jsonResult;
    }

    @RequestMapping(value = "/log", method = RequestMethod.GET, produces = {Constant.CONTENT_TYPE_JSON})
    @ResponseBody
    public JsonResult log() {
        JsonResult jsonResult = new JsonResult();
        try {
            List<HardwareReportLog> logList = hardwareReportLogService.getHardwareReportLogList();
            jsonResult.setData(logList);
            jsonResult.setMessage("获取数据成功！");
            jsonResult.setStateSuccess();
        } catch (Exception ex) {
            ex.printStackTrace();
            jsonResult.setMessage(Constant.EXCEPTION_MESSAGE);
        }
        return jsonResult;
    }

    @RequestMapping(value = "/demo/sendSms", method = RequestMethod.GET, produces = {Constant.CONTENT_TYPE_JSON})
    @ResponseBody
    public JsonResult sendSms() {
        JsonResult jsonResult = new JsonResult();
        try {
            String s = IHYSmsSendUtils.sendSms("phonexxx", "codexxx", "");
            jsonResult.setData(s);
            jsonResult.setMessage("发送短信成功！");
            jsonResult.setStateSuccess();
        } catch (Exception ex) {
            ex.printStackTrace();
            jsonResult.setMessage(Constant.EXCEPTION_MESSAGE);
        }
        return jsonResult;
    }

}