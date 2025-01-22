package com.qingxinsaas.common.core.context;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 获取当前线程变量中的数据源信息
 *
 * @author wwj
 */
public class SourceContextHolder {
    public static final Logger log = LoggerFactory.getLogger(SourceContextHolder.class);

    /**
     * 使用ThreadLocal维护变量，ThreadLocal为每个使用该变量的线程提供独立的变量副本，
     * 所以每一个线程都可以独立地改变自己的副本，而不会影响其它线程所对应的副本。
     */
    private static final ThreadLocal<Long> THREAD_LOCAL = new ThreadLocal<>();

    /**
     * 设置数据源的变量
     */
    public static void setDataSourceType(Long dsType) {
        log.info("切换到{}数据源", dsType);
        THREAD_LOCAL.set(dsType);
    }

    /**
     * 获得数据源的变量
     */
    public static Long getDataSourceType() {
        return THREAD_LOCAL.get();
    }

    /**
     * 清空数据源变量
     */
    public static void clearDataSourceType() {
        THREAD_LOCAL.remove();
    }
}
