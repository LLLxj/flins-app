import 'package:huoshan_app/utils/request_method.dart';

class Home {
  static deseaseList (data) async {
    return sendRequest('/scohmed/recommend/pagequery',  Method.post, data);
  }
}