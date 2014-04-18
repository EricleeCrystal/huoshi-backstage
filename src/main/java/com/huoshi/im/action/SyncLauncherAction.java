package com.huoshi.im.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;

/**
 * 生成文件
 * 
 * @author: Ericlee
 * @date:2014-04-17 22:44:49
 */
@Service
public class SyncLauncherAction extends BaseAction {

    @Autowired
    private LauncherService launcherService;

    @Override
    public void process() throws Exception {
        super.process();
    }
}
