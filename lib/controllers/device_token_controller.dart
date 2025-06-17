import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app_constant.dart';

class DeviceTokenController extends GetxController{
  String? deviceToken;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
@override
  void onInit(){
  super.onInit();
  getDeviceToken();
}
Future<void> getDeviceToken()async{
  try{
 String? token = await firebaseMessaging.getToken();
 if(token!=null){
   deviceToken = token;
   update();
 }
  }catch(e){
    Get.snackbar(
      "Error",
      "$e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppConstant.appSecondaryColor,
      colorText: AppConstant.appTextColor,
    );
  }
}
}