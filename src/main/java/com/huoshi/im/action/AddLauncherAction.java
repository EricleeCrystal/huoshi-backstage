package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 * <pre>
 * 跳转至启动添加页面
 * 320×240 屏幕分辨率的手机使用壁纸分辨率为480x320
 * 480×320 屏幕分辨率的手机使用壁纸分辨率为640x480
 * 800×480 屏幕分辨率的手机使用壁纸分辨率为960x800
 * 854×480 屏幕分辨率的手机使用壁纸分辨率为960x854
 * 960×540 屏幕分辨率的手机使用壁纸分辨率为1080x960
 * 1280*720屏幕分辨率的手机使用壁纸分辨率为1440*1280
 * 1920*1080屏幕分辨率的手机使用壁纸分辨率为2160*1920
 * 
 * 使用一张图 1280*720
 * @author: Ericlee
 * @date:2014-04-13 18:47:59
 */
@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class AddLauncherAction extends BaseAction {

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
    @Setter
    @Getter
    private String msg;

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
