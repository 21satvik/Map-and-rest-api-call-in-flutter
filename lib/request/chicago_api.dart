import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:innostack/main.dart';

import '../helpers/dio_exceptions.dart';

List<String> artistTitle = [];
List<String> title = [];
List<String> origin = [];
List<String> image = [];

Future getData() async {
  String url = 'https://api.artic.edu/api/v1/artworks?page=1&limit=10';

  try {
    Response response = await Dio().get(url.toString());
    for (int i = 0; i < 10; i++) {
      artistTitle.add(response.data['data'][i]['artist_title'].toString());
      title.add(response.data['data'][i]['title'].toString());
      origin.add(response.data['data'][i]['place_of_origin'].toString());
    }
    sharedPreferences.setStringList('artist_title', artistTitle);
    sharedPreferences.setStringList('title', title);
    sharedPreferences.setStringList('origin', origin);
    return artistTitle;
  } on DioError catch (e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    debugPrint(errorMessage);
  }
}
