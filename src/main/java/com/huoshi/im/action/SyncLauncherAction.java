package com.huoshi.im.action;

import java.io.File;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

/**
 * 同步产生app需要的启动加载图片
 * 
 * @author: Ericlee
 * @date:2014-04-20 13:42:45
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class SyncLauncherAction extends BaseAction {

    // private static final String destPathname = "/";

    @Autowired
    private LauncherService launcherService;

    @Override
    public void process() throws Exception {
        String pathname = "";
        String root = EnvUtil.getRoot();
        if (EmptyUtil.isNotEmpty(root)) {
            pathname = root + File.separator + "file" + File.separator + "launcher.js";
        } else {
            pathname = ServletActionContext.getServletContext().getRealPath("/file/launcher.js");
        }

        String msg = JsonUtil.toRtnMsgJson("创建app启动同步文件成功");
        if (!launcherService.sync(pathname)) {
            msg = JsonUtil.toErrorRtnMsgJson("创建app启动同步文件失败");
        }
        write(msg);
    }
}
