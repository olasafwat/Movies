import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/MoivesModel.dart';
import '../network/endpoint.dart';
import 'package:http/http.dart' as http;

class GetTopRate with ChangeNotifier {
  List<MoivesModel> MoviesList = [];
  bool loading = true;
  bool error = true;

  GetTopRate() {
    getMovieTopRateMovie().then((value) {
      notifyListeners();
    });
  }

  getMovieTopRateMovie() async {
    MoviesList.clear();
    MoviesList = [];

    try {
      var url = Uri.parse("${BASE_URL}${GET_TOP_RATED}${API_QUERY}");
      print(url);
      var response = await http.get(url);
      var responsebody = jsonDecode(response.body)["results"];
      print(responsebody);
      for (var i in responsebody) {
        MoviesList.add(MoivesModel.fromMap(i));
      }

      loading = false;
      error = false;
    }

    catch (e) {
      print(e);
      loading = false;
      error = true;
    }
  }
}
