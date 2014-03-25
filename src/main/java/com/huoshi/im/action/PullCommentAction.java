package com.huoshi.im.action;

import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import com.huoshi.im.po.Chapter;
import com.huoshi.im.service.BookService;
import com.huoshi.im.service.CommentService;
import com.huoshi.im.util.JsonUtil;
import com.huoshi.im.vo.CommentVo;
import com.huoshi.im.vo.Page;

@SuppressWarnings("serial")
@Service
@Scope("prototype")
public class PullCommentAction extends BaseAction {

    @Autowired
    private CommentService commentService;
    @Autowired
    private BookService bookService;

    private static int defaultChapterId = 1;
    private static int defaultPageNo = 1;
    private static int defaultPageSize = 12;
    @Setter
    private int chapterId;
    @Setter
    private int pageNo;
    @Setter
    private int cid;
    @Setter
    private int pageSize;

    private int refId;

    @Override
    public void process() throws Exception {
        Chapter chapter = bookService.queryChapterById(chapterId);
        Page<CommentVo> page = commentService.queryVoPageByChapter(chapter, pageNo, pageSize, cid);
        String result = JsonUtil.toRtnMsgJson(page);
        System.out.println("refId = " + refId);
        if (refId == 1) {// 表示后台请求

        } else if (refId == 0) {// 移动app请求
            result = "var data = " + result;
        }
        write(result);
    }

    @Override
    public void validate() {
        chapterId = chapterId < defaultChapterId ? defaultChapterId : chapterId;
        pageNo = pageNo < defaultPageNo ? defaultPageNo : pageNo;
        pageSize = pageSize < defaultPageSize ? defaultPageSize : pageSize;
        if (cid > 0) {
            pageNo = 0;
        }
        cid = cid < 0 ? 0 : cid;
        super.validate();
    }
}
