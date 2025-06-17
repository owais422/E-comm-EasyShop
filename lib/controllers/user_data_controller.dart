import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserDataController extends GetxController{
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uId)async{
final QuerySnapshot userData = await firebaseFirestore.collection("users").where("uId",isEqualTo: uId).get();
return userData.docs;
  }
}















