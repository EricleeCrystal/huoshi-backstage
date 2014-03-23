package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.BookService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.util.ValueUtil.EmptyUtil;
import com.huoshi.im.vo.SectionVo;

@SuppressWarnings("serial")
@Service
@Scope("prototye")
public class ModifySectionAction extends BaseAction {

    @Setter
    private int sid;
    @Setter
    private String section;
    @Setter
    private String note;

    @Autowired
    private BookService bookService;

    @Override
    public void process() throws Exception {
        if (EmptyUtil.isEmpty(section)) {
            write(JsonUtil.toErrorRtnMsgJson("经文内容不能为空 请重新操作"));
            return;
        }
        SectionVo s = bookService.modifySection(sid, section, note);
        write(JsonUtil.toRtnMsgJson(s));
        super.process();
    }
}
