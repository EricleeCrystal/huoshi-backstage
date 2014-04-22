package com.huoshi.im.action;

import lombok.Getter;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.UserService;
import com.huoshi.im.vo.Page;
import com.huoshi.im.vo.UserVo;

@SuppressWarnings("serial")
@Service
@Scope("protype")
public class UserAction extends BaseAction {

    @Autowired
    private UserService userService;

    /** 默认页 */
    private static int defaultPageNo = 1;
    /** 默认页大小 */
    private static int defaultPageSize = 12;

    @Setter
    private int pageNo;
    @Setter
    private int pageSize;
    @Getter
    @Setter
    private int sort;
    @Getter
    private Page<UserVo> page;

    /**
     * 因为数据较多 所以采用传统的分页方式
     */
    @Override
    public String execute() throws Exception {
        switch (sort) {
        case 0:// 全部账号
            page = userService.queryUserByPage(pageNo, pageSize);
            break;
        case 1:// 内部账号
            page = userService.queryInnerUserByPage(pageNo, pageSize);
            break;
        case 2:// 外部账号
            page = userService.queryOutterUserByPage(pageNo, pageSize);
            break;
        default:
            break;
        }
        return SUCCESS;
    }

    @Override
    public void validate() {
        if (pageNo <= 0) {
            pageNo = defaultPageNo;
        }
        if (pageSize <= 0) {
            pageSize = defaultPageSize;
        }
        if (sort < 0 || sort > 2) {
            sort = 0;
        }
        super.validate();
    }
}
