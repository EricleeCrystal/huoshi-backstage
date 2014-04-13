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
        return super.execute();
    }

    @Override
    public void validate() {
        sort = sort < 0 ? 0 : sort;
        sort = sort > 2 ? 0 : sort;
        pageSize = pageSize <= 0 ? 12 : pageSize;
        pageNo = pageNo <= 0 ? 1 : pageNo;
        super.validate();
    }
}
