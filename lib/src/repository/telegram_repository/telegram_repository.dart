import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jewellery_app/src/common/constants/app_keys.dart';

abstract interface class TelegramRepository {
  Future<bool> sendMessage({String message = ""});

  Future<bool> sendMedia({String? url, String message = ""});
}

class TelegramRepositoryImpl extends TelegramRepository {
  TelegramRepositoryImpl._() : _dio = Dio();
  late final Dio _dio;
  static final _instance = TelegramRepositoryImpl._();

  factory TelegramRepositoryImpl() => _instance;

  @override
  Future<bool> sendMessage({String message = ""}) async {
    String query =
        "https://api.telegram.org/bot${AppKeys.botToken}/sendMessage?chat_id=${AppKeys.adminId}&parse_mode=Markdown&text=$message";
    final result = await _dio.request(query);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> sendMedia({String? url, String message = ""}) async {
    String query =
        "https://api.telegram.org/bot${AppKeys.botToken}/sendPhoto?chat_id=${AppKeys.adminId}&caption=$message&photo=$url";
    final result = await _dio.request(query);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
    return true;
  }
}

// https://api.telegram.org/bot2041941989:AAHz1Pyk-nyTGG7852I1yqcmouJGFLR0Up8/sendPhoto?chat_id=475409665&caption="asda"&photo=https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png

// https://api.telegram.org/bot2041941989:AAHz1Pyk-nyTGG7852I1yqcmouJGFLR0Up8/sendMedia?chat_id=475409665&media=https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7TY6VqVGq6I4RFjuEUT9aIfBiNXa5fNSY4u_YL43I20bPGjg2gxixmNYKXM8ghVZQxIE&usqp=CAU
