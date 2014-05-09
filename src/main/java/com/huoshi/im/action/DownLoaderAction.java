package com.huoshi.im.action;

import lombok.Setter;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.DownLoadService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.LogUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class DownLoaderAction extends BaseAction {

    @Autowired
    private DownLoadService downLoadService;
    private Logger logger = LogUtil.getLogger("downLoader");

    @Setter
    private String version;

    @Override
    public void process() throws Exception {
        if (EmptyUtil.isEmpty(version)) {
            version = "1.0";
        }
        logger.debug("host:[{}] download [{}] once", getRemoteAddr(), version);
        downLoadService.inc();
        write(JsonUtil.toRtnOKJson());
    }
}
