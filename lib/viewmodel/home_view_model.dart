import 'dart:io';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper/model/unsplash_model.dart';
import 'package:wallpaper/services/unsplash_services.dart';
import 'package:wallpaper/utilities/constants.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:http/http.dart' as http;


class HomeViewModel extends ChangeNotifier{

  HomeStatus _homestatus = HomeStatus.loading;
 
  HomeStatus get homeStatus => _homestatus;


  int _selectedIndex = 2;
  
  int get selectedIndex =>_selectedIndex;

  void changeHomeStatus(HomeStatus status) {
  
    _homestatus = status;
   
    notifyListeners();
  }


  void changeSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
 
  
  //for unsplash services given data check and give the new state
  Future<List<UnSplashModel>?> fetchImage(BuildContext context) async {
    var images;
    _homestatus=HomeStatus.loading;
    try{
     images = await  UnsplashServices().fetchImages(context);
    }
   catch(e){
   
    _homestatus=HomeStatus.error;
   }

   if(images==null){
     _homestatus=HomeStatus.error;
   }
   else {
    _homestatus=HomeStatus.loaded;
   }

   return images;
  }
  
  //for save the network image to mobile
  void download(String url,context) async {
     try {

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;


        final directory = await getApplicationDocumentsDirectory();
        final filePath = path.join(directory.path, 'downloaded_image.jpg');
        final file = File(filePath);

        await file.writeAsBytes(bytes);
 
        final assetEntity = await PhotoManager.editor.saveImage(
          file.readAsBytesSync(),
          filename: 'downloaded_image.jpg', 
        );

        if (assetEntity != null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading successfull'),));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading successfull'),));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading successfull'),));
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}