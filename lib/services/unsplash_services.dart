import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wallpaper/model/unsplash_model.dart';
import 'package:wallpaper/utilities/constants.dart';
import 'package:http/http.dart'as http;


class UnsplashServices {

  //for get unsplash api data
  Future<List<UnSplashModel>?> fetchImages(BuildContext context) async {
  
   try {
    final url = Uri.parse('$unsplashApiUrl?client_id=${dotenv.env['APIKEY']}');
     final response = await http.get(url);
     if(response.statusCode == 200) {
      print(response.body);
      return unSplashModelFromJson(response.body);
     }else{
      throw Exception('Failed to load fetch images');
     }
   } catch (e) {

   print(e);
   throw Exception('Failed to load fetch images');
   }
   
}
}