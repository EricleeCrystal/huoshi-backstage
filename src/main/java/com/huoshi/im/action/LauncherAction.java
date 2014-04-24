package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.LauncherService;
import com.huoshi.im.vo.LauncherVo;
import com.huoshi.im.vo.Page;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class LauncherAction extends BaseAction {

    /** 0 全部 1 失效的 2 有效的 */
    @Setter
    @Getter
    private int sort;
    @Setter
    private int pageSize;
    @Setter
    private int pageNo;

    @Getter
    private Page<LauncherVo> page;
    @Autowired
    private LauncherService launcherService;

    @Override
    public String execute() throws Exception {
        page = launcherService.queryByPage(pageNo, pageSize, sort);
        return SUCCESS;
    }

    @Override
    public void validate() {
        if (sort < 0 || sort > 2) {
            sort = 0;
        }
        pageSize = pageSize <= 0 ? 12 : pageSize;
        pageNo = pageNo <= 0 ? 1 : pageNo;
        super.validate();
    }
}
