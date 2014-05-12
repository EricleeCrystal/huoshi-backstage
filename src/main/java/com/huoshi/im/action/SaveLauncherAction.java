package com.huoshi.im.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import lombok.Getter;
import lombok.Setter;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.util.DateUtil;
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

    @Setter
    @Getter
    private int mode;
    @Setter
    @Getter
    private String title;
    @Setter
    @Getter
    private String source;
    @Setter
    @Getter
    private String revealDate;
    @Setter
    @Getter
    private int exceed;
    @Setter
    @Getter
    private String bgcolor;
    @Getter
    private String msg;

    /** 上传的文件 */
    @Setter
    @Getter
    private File image;
    /** 上传的文件名称 */
    @Setter
    @Getter
    private String imageFileName;
    /** 请求的图片格式 */
    @Setter
    @Getter
    private String imageContentType;

    @Override
    public String execute() throws Exception {
        if (reject(GET)) {
            return INPUT;
        }
        if (EmptyUtil.isEmpty(title) || EmptyUtil.isEmpty(image) || EmptyUtil.isEmpty(revealDate) || EmptyUtil.isEmpty(bgcolor)) {
            msg = "内容不完整";
            return INPUT;
        }
        // 校验颜色合法性
        bgcolor = bgcolor.trim();
        if (bgcolor.length() != 6) {
            msg = "背景色需要6位   0-F 字符";
        } else {// 判断是否有非法数字
            try {
                Long.valueOf(bgcolor, 16);
            } catch (Exception e) {
                msg = "背景色不合法 6位   0-F 字符";
            }
        }
        if (EmptyUtil.isNotEmpty(msg)) {
            return INPUT;
        }
        if (!DateUtil.DATE.verifyDate(revealDate)) {
            msg = "日期不正确";
            return INPUT;
        }

        bgcolor += "ff";
        String imageDir = null;
        String root = EnvUtil.getRoot();
        if (EmptyUtil.isNotEmpty(root)) {
            imageDir = root + File.separator + "file" + File.separator + "image";
        } else {
            imageDir = ServletActionContext.getServletContext().getRealPath("/file/image");
        }
        /** 生成一个唯一的文件名称 (opId 时间 2位随机数) */
        StringBuilder sb = new StringBuilder();
        sb.append(DateUtil.DATETIMESTR.now()).append(getOpId()).append(RandomUtil.random(2));
        String imageSaveName = sb.toString();
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
        launcherService.save(mode, title, source, imageSaveName, bgcolor, revealDate, exceed > 0 ? true : false, true, getOpId());
        return SUCCESS;
    }
}
