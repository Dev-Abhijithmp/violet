import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:violet/models/searchresmodel.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    controller.addListener(() {
      if (controller.text == "") {
        notifyListeners();
      }
    });
  }

  List<Searchres> res = [];
  TextEditingController controller = TextEditingController();
  Future<List<Searchres>> getSearchresults(
      String query, BuildContext context) async {
    res = [];
    final dio = Dio();

    String _uri =
        "http://bookingappcore-env.eba-xmeutmkw.ap-south-1.elasticbeanstalk.com/search?keyword=";

    try {
      var response = await dio.get(_uri + query);
      // print("status code");
      // print(response.statusCode);

      // print(response.data);
      if (response.statusCode == 200) {
        print("in 200");
        var json = response.data;
        for (var element in json) {
          res.add(Searchres.fromJson(element));
        }
      }
      notifyListeners();
      return res;
    } catch (e) {
      throw Exception("ERROR : $e");
    }
  }
}
