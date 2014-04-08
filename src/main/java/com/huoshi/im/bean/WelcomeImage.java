package com.huoshi.im.bean;

import lombok.Data;

@Data
public class WelcomeImage {

    private String image;
    private String fromDateTime;
    private String toDateTime;
    private String desc;
    private String md5;
    private boolean longTerm;

    public WelcomeImage(String image, String fromDateTime, String toDateTime, String desc, String md5, boolean longTerm) {
        this.image = image;
        this.fromDateTime = fromDateTime;
        this.toDateTime = toDateTime;
        this.desc = desc;
        this.md5 = md5;
        this.longTerm = longTerm;
    }
}
