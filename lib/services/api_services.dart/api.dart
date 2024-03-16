import 'package:assignment/services/api_services.dart/dio_config.dart';
import 'package:assignment/utils/app_utils.dart';


class Api {
  Api._();

  static final instance = Api._();

  final _dio = DioConfig.instance.getInstance();

  Future<dynamic> getTodos({String query = "", required int page,required int limit}) async {
    try {
      late final dynamic response;
      if(query == ""){

       response = await _dio.get('${AppUtils.baseUri}/todos?_page=$page&_limit=$limit');
      }else{
       response = await _dio.get('${AppUtils.baseUri}/todos?_limit=$limit&title=$query');
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  
}
