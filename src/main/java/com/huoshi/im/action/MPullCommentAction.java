package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.huoshi.im.service.CommentService;

/**
 * <pre>
 * 手机端拉取评论
 * 按照评论点赞数倒叙排序
 * 用户如果有评论 则将该用户的最新一条评论放在首位
 * @author: Ericlee
 * @date:2014-03-31 23:14:27
 */
@SuppressWarnings("serial")
@Service
public class MPullCommentAction extends BaseAction {

    @Autowired
    private CommentService commentService;
    /** 默认书编号 */
    private static int defaultBookId = 1;
    /** 默认章编号 */
    private static int defaultChapterNo = 1;
    /** 默认页数 */
    private static final int defaultPageNo = 1;
    /** 默认页大小 */
    private static final int defaultPageSize = 12;
    /** 默认请求的userId */
    private static final int defaultUserId = 0;

    @Setter
    private int bookId;
    @Setter
    private int chapterNo;
    @Setter
    private int pageNo;
    @Setter
    private int pageSize;
    @Setter
    private int userId;

    @Override
    public void process() throws Exception {
        write(commentService.queryPageByChapter(bookId, chapterNo, pageNo, pageSize, userId));
    }

    @Override
    public void validate() {
        bookId = bookId < defaultBookId ? defaultBookId : bookId;
        chapterNo = chapterNo < defaultChapterNo ? defaultChapterNo : chapterNo;
        pageNo = pageNo < defaultPageNo ? defaultPageNo : pageNo;
        pageSize = pageSize < defaultPageSize ? defaultPageSize : pageSize;
        userId = userId <= defaultUserId ? defaultUserId : userId;
        super.validate();
    }
}
