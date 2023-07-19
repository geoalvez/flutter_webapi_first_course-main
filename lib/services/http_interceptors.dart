import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {

  Logger logger = Logger();
  // @override
  // Future<BaseRequest> interceptRequest({required BaseRequest data}) async {
  //   print(data.toString());
  //   return data;
  // }
  //
  // @override
  // Future<BaseResponse> interceptResponse({required BaseResponse data}) async {
  //   print(data.toString());
  //   return data;
  // }

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    Request data =  request as Request;

    logger.v("Requisicao para ${data.url}\nCabecalhos ${data.headers}\n Corpo ${data.body}");
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    Response data =  response as Response;
    if (data.statusCode~/ 100 == 2){
      logger.i("Resposta --> Cabecalho ${data.headers}\nStatus da Resposta ${data.statusCode}\n Corpo ${data.body}");

    }else {
      logger.e("Resposta --> Cabecalho ${data.headers}\nStatus da Resposta ${data.statusCode}\n Corpo ${data.body}");
    }
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    return true;
  }
}