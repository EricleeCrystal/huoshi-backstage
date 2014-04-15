package com.huoshi.im.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;

@Service
public class SyncLauncherAction extends BaseAction {

    @Autowired
    private LauncherService launcherService;

    @Override
    public void process() throws Exception {
        super.process();
    }
}
