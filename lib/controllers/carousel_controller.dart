import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BannerController extends GetxController{
  RxList<String> bannerUrls = RxList<String>([]);



  @override
  void onInit(){
    super.onInit();
    fetchBannerUrls();
  }
 Future<void> fetchBannerUrls()async{
    try{
      QuerySnapshot bannersSnapshot = await FirebaseFirestore.instance.collection("banners").get();
      if(bannersSnapshot.docs.isNotEmpty){
        bannerUrls.value= bannersSnapshot.docs.map((doc) =>doc["imageUrl"] as String ,).toList();
      }
    }catch(e){
print(e);
    }

  }
}