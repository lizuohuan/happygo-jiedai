package com.magic.weijd.util;

/**
 * 微信公众号端
 * Created by Eric Xie on 2017/3/21 0021.
 */
public class WeChatConfig {

    public static final String SESSION_WX_USER = "weijd_wx_user";

    public static final String ACCESS_TOKEN= "weijd_access_token";

    public static final String TICKET= "weijd_ticket";

    public static String appId = "wxf82e7f586da7084b"; //正式

    public static String secret = "68ee3ea93534118e90a1306e749c3ebf";

    public static String mchId = "1494236412";


    public static final String SIGN_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

    public static final String payKey = "3e6677cfca6644fab81494b360243cfd";


//    public static String appId = "wx8d7693a361f74b8d"; //李
//
//    public static String secret = "69caf329e1eed8ef1b3e7066eabc0f89";
//
//    public static String mchId = "1494236412";

//    public static String appId = "wx6c852451915d2149"; //2李
//
//    public static String secret = "76ee023565c0d6ac7a6a5042e66b7332";

//    public static String appId = "wxbedd99a7446ac215"; //袁
//
//    public static String secret = "703bec139b0790535f2cd0c19d1d4d17";

    /** 发送模板消息的POST请求 */
    public static String template_http = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=";

    public static String order_info_http = "/wechat/page/borrowingDetail/";

    /** 我的主页 */
    public static String my_http = "/jiedai/wechat/page/index";

    /** 意见反馈 */
    public static String feedback_http = "/jiedai/wechat/page/feedback";

    /** 联系我们 */
    public static String contact_us_http = "/jiedai/wechat/page/contactUs";

    /** 微订单状态提醒 */
    public static String template_order_status = "t2c0mfhH9KHaFpTLw-4ykHl_BPC4WQFNP4MGLsUWjIM";

    /** 延期申请通知 */
    public static String template_order_delay_apply = "trvAlwBDDnmHYSfYJVCzg5rTMoyjjoneCZ8wP2cAw6U";

    /** 还款申请通知 */
    public static String template_order_repay_apply = "8D8FofQHdhUgdEesOkwoRpt6PNDttbFHBLoP53PmWDI";

    /** 审核结果通知 */
    public static String template_order_apply_result = "ZA02mnqSqoeGS9QBhg2_79Cx-Z1vEUG5KUSxeJv1mpw";

    /** 申请通过提醒 */
    public static String template_order_apply_pass_result = "owJH1I04raHjc7uOTLBHFw_36xF58YCOBFD492wxsP4";


    /** 创建微信公众号首页菜单的url */
    public static String create_menu_http = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";

    /** 获取微信公众号首页菜单的url */
    public static String get_menu_http = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token=";

    /** 删除微信公众号首页菜单的url */
    public static String delete_menu_http = "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=";

}
