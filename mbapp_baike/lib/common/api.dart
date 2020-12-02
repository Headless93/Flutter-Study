
class Api {

  static const String BASE_URL = "https://contact-api.molbase.cn";

  static const String TEST_URL = "http://dev-contact-api.molbase.cn";

  static getBaseUrl(){
    return TEST_URL;
  }
  //首页banner
  static const String BANNER = "banner/json";

  //首页文章列表
  static const String ARTICLE_LIST = "article/list/";

  //体系数据
  static const String TREE = "tree/json";

  //导航数据
  static const String NAVI = "navi/json";

  //项目分类
  static const String PROJECT = "project/tree/json";

  //项目列表数据
  static const String PROJECT_LIST = "project/list/";

  //登录
  static const String LOGIN = "user/login";



  //短信登录
  static const String PHONE_LOGIN = "/v2/login/register";

 //密码登录
  static const String PASSWORD_LOGIN = "/v2/login/common_login";

//忘记密码
  static const String FORGET_PASSWORD = "/v2/login/password";
  

  //注册
  static const String REGISTER = "user/register";

  //退出登录
  static const String LOGOUT = "user/logout/json";

 //验证码
  static const String VerifyCode = "/v2/login/send_code";

  //搜索
  static const String QUERY = "article/query/0/json";

  //收藏文章列表
  static const String COLLECT_LIST = "lg/collect/list/";

  //收藏站内文章
  static const String COLLECT = "lg/collect/";

  //取消收藏-文章列表
  static const String UN_COLLECT_ORIGIN_ID = "lg/uncollect_originId/";

  //取消收藏-收藏页面
  static const String UN_COLLECT = "lg/uncollect/";

  static const String LOGIN_BAIKE = "/v2/loginBaike/common_login";
  //搜索热词
  static const String HOT_KEY = "/1.0/cms/recommend_products";
  //化合物基本信息
  static const String COMPOUND_INFO = "/1.0/compound/info";
  //化合物百科详情
  static const String COMPOUND_BAIKE_INFO = "/1.0/compound/baike/info";

  //百科搜索 get
  static const String BAIKE_SEARCH = "/1.0/compound/baike/search";
  //化合物百科 关注 取消关注
  static const String FAVORITES_BAIKE = "/1.0/favorites/baike";
  //化合物百科 关注列表
  static const String FAVORITES_BAIKE_LIST = "/1.0/favorites/baike";
  //化合物百科 是否关注
  static const String FAVORITES_BAIKE_STATUS = "/1.0/favorites/baike/status";
  //首页 大家都在看
  static const String HOME_BAIKE_ALLSEE = "/1.0/cms/allSeeBaike";
}