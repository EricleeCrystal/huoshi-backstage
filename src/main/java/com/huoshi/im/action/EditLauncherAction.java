package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Launcher;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.util.DateUtil;
import com.huoshi.im.util.EnvUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class EditLauncherAction extends BaseAction {

    @Autowired
    private LauncherService launcherService;
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
    private String image;
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
    @Setter
    @Getter
    private String msg;

    @Override
    public String execute() throws Exception {
        Launcher l = launcherService.queryById(seqId);
        if (EmptyUtil.isEmpty(l)) {
            return INPUT;
        } else {
            mode = mode == 0 ? l.getMode() : mode;
            title = EmptyUtil.isEmpty(title) ? l.getTitle() : title;
            source = EmptyUtil.isEmpty(source) ? l.getSource() : source;
            revealDate = EmptyUtil.isEmpty(revealDate) || !DateUtil.DATE.verifyDate(revealDate) ? l.getRevealDate() : revealDate;
            exceed = l.getExceed() ? 1 : 0;
            valid = l.getValid() ? 1 : 0;
            bgcolor = EmptyUtil.isEmpty(bgcolor) ? l.getBgcolor() : bgcolor;
            if (bgcolor.length() == 8) {
                bgcolor = bgcolor.substring(0, 6);
            }
            image = EnvUtil.getImageHost() + l.getImage();

        }
        return SUCCESS;
    }
}
