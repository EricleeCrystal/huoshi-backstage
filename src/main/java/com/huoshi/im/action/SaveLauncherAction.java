package com.huoshi.im.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.util.DateUtil;
import com.huoshi.im.util.EncryptUtil;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.LogUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.util.ValueUtil.RandomUtil;

/**
 * <pre>
 * 保存启动画面图片
 * 除了默认图片 其他图片不允许时间交叉
 * 
 * @author: Ericlee
 * @date:2014-04-13 17:59:59
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class SaveLauncherAction extends BaseAction {

    @Autowired
    private LauncherService launcherService;
    private Logger logger = LogUtil.getLogger();

    private int mode;
    @Setter
    private String title;
    /** 上传的文件名称 */
    @Setter
    private String source;
    @Setter
    private String revealDate;
    @Setter
    private int exceed;

    /** 上传的文件 */
    @Setter
    private File image;
    @Setter
    private String imageFileName;
    /** 请求的图片格式 */
    @Setter
    private String imageContentType;

    @Override
    public String execute() throws Exception {
        String imageDir = null;
        String root = EnvUtil.getRoot();
        if (EmptyUtil.isNotEmpty(root)) {
            imageDir = root + File.separator + "file" + File.separator + "image";
        } else {
            imageDir = ServletActionContext.getServletContext().getRealPath("/file/image");
        }

        /** 生成一个唯一的文件名称 (opId 时间 2位随机数) */
        StringBuilder sb = new StringBuilder();
        sb.append(getOpId()).append(DateUtil.DATETIME.now()).append(RandomUtil.random(2));
        String imageSaveName = EncryptUtil.md5(sb.toString());
        String suffix = ".jpg";
        int suffixIndex = imageFileName.lastIndexOf(".");
        if (suffixIndex > 0) {
            suffix = imageFileName.substring(suffixIndex);
        }
        imageSaveName += suffix;

        InputStream is = new FileInputStream(image);
        File destFile = new File(imageDir, imageSaveName);
        OutputStream os = new FileOutputStream(destFile);
        byte[] buf = new byte[1024];
        int len = 0;
        while ((len = is.read(buf)) != -1) {
            os.write(buf, 0, len);
        }
        is.close();
        os.close();
        logger.debug("save image {} in {}", imageSaveName, imageDir);
        launcherService.save(mode, title, source, imageSaveName, revealDate, exceed > 0 ? true : false, true, getOpId());
        return SUCCESS;
    }
}
