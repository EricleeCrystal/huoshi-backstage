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
import com.huoshi.im.po.Launcher;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.util.DateUtil;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.LogUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.util.ValueUtil.RandomUtil;

/**
 * <pre>
 * 修改启动文件
 * 
 * @author: Ericlee
 * @date:2014-04-13 17:59:59
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class ModifyLauncherAction extends BaseAction {

    @Autowired
    private LauncherService launcherService;
    private Logger logger = LogUtil.getLogger();

    @Setter
    @Getter
    private int sort;
    @Setter
    @Getter
    private int pageNo;
    @Setter
    @Getter
    private int pageSize;
    @Setter
    @Getter
    private int seqId;
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
    private int valid;
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
        Launcher l = launcherService.queryById(seqId);
        if (EmptyUtil.isEmpty(l)) {
            return SUCCESS;
        }
        if (EmptyUtil.isEmpty(title) || EmptyUtil.isEmpty(revealDate) || EmptyUtil.isEmpty(bgcolor)) {
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

        bgcolor = "0x" + bgcolor + "ff";

        String imageSaveName = "";
        // 使用原图
        if (EmptyUtil.isNotEmpty(image)) {
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
            imageSaveName = sb.toString();
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
            logger.debug("modify launcher save image {} in {}", imageSaveName, imageDir);
        } else {
            imageSaveName = l.getImage();
        }
        launcherService.modify(l, mode, title, source, imageSaveName, bgcolor, revealDate, exceed > 0 ? true : false, valid > 0 ? true : false, getOpId());
        return SUCCESS;
    }
}
