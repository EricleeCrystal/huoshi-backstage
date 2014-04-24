package com.huoshi.im.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.util.JsonUtil;

/**
 * 把评论的点赞数同步到排序字段
 * 
 * @author: Ericlee
 * @date:2014-03-31 21:28:43
 */
@SuppressWarnings("serial")
@Service
public class SyncCommentVoteAction extends BaseAction {

    @Autowired
    private CommentService commentService;

    @Override
    public void process() throws Exception {
        int result = commentService.syncVote();
        write(JsonUtil.toRtnMsgJson("result", result));
    }
}
