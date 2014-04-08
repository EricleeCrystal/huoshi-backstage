package com.huoshi.im.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.util.LogUtil;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class AddWiAction extends BaseAction {

    private Logger logger = LogUtil.getLogger();
    @Setter
    private String title;
    @Setter
    private File image;
    @Setter
    private String imageFileName;
    @Setter
    private String imageContentType;
    @Setter
    private String desc;
    @Setter
    private boolean expire;
    @Setter
    private String effectiveTime;
    @Setter
    private String expireTime;

    @Override
    public void process() throws Exception {
        String root = ServletActionContext.getServletContext().getRealPath("/file");
        logger.debug("root dir" + root);
        InputStream is = new FileInputStream(image);
        File destFile = new File(root, imageFileName);
        OutputStream os = new FileOutputStream(destFile);
        byte[] buf = new byte[100];
        int len = 0;
        while ((len = is.read(buf)) != -1) {
            os.write(buf, 0, len);
        }
        is.close();
        os.close();
        write("上传成功");
    }
    
    

}
