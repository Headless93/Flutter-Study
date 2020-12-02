import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) {
//    final token = AppConfig.userTools.getUserToken();
//    if (token != null && token.length > 0) {
//      options.headers.putIfAbsent('Authorization', () => 'Bearer' + ' ' + token);
//    }
//    if (options.uri.path.indexOf('api/user/advice/Imgs') > 0 || options.uri.path.indexOf('api/user/uploadUserHeader') > 0) { // 上传图片
//      options.headers.putIfAbsent('Content-Type', () => 'multipart/form-data');
//      print('上传图片');
//    } else {
//    }
    options.headers.putIfAbsent('Content-Type', () => 'application/json;charset=UTF-8');
    options.contentType='application/json;charset=UTF-8';
    options.headers.addAll({
      "deviceId": "123444",
      "requestId": "ddfsgg",
      });

    return super.onRequest(options);
  }
}