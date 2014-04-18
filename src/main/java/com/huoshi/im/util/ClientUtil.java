package com.huoshi.im.util;

import javax.servlet.http.HttpServletRequest;
import com.huoshi.im.util.ValueUtil.EmptyUtil;

/**
 * 获取客户端相关的信息
 * 
 * @author LiBin
 * @date 2014-4-8 下午5:00:49
 */
public class ClientUtil {

    /**
     * 如果通过nginx来反向代理 通过request.getRemoteAddr()获取的是nginx的地址 因此需要nginx来透传客户端ip
     * 
     * @param request
     * @return
     */
    public static String getClientAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (EmptyUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
        }
        if (EmptyUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (EmptyUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (EmptyUtil.isEmpty(ip) || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }
}
