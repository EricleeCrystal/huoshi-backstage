package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class CommentGridAction extends BaseAction {

    @Setter
    private int page;
    @Setter
    private int rows;

    @Override
    public void process() throws Exception {
    }
}
