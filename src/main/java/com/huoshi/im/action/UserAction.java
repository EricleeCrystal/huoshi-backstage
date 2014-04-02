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
    private Page<UserVo> page;

    /**
     * 因为数据较多 所以采用传统的分页方式
     */
    @Override
    public String execute() throws Exception {
        page = userService.queryUserByPage(pageNo, pageSize);
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
        super.validate();
    }
}
