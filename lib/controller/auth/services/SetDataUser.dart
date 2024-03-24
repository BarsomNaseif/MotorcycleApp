import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:motorcycle_app/controller/auth/signup_controller.dart';
import 'package:motorcycle_app/data/model/users_model.dart';

class FireStoreUser {
  //FireStoreUser() {}
  SignUpController _controller = Get.put(SignUpController());
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(users_model userModel) async {
    return await _userCollectionRef.doc(userModel.id).set(userModel.toJson());
  }

  //UserCredential ? users;
  void saveUser() async {
    User? users = FirebaseAuth.instance.currentUser;
    var username = _controller.username.text;
    String pic =
        'https://firebasestorage.googleapis.com/v0/b/motrocycal.appspot.com/o/basic%2Fuseraccount.jpeg?alt=media&token=9f877368-5e1d-4099-bb76-65e97e978e51';
    users_model _user = users_model(
        phone: _controller.phone.text.trim(),
        id: users?.uid,
        email: users?.email,
        username: users?.displayName == null ? username : users?.displayName,
        verifyOTP: _controller.otp,
        pic: users?.photoURL == null ? pic : users?.photoURL,
        passward: _controller.password.text);
    await addUserToFireStore(_user);
    // setuser(_user);
  }

  // Future<DocumentSnapshot> getCurrentUser(String uid) async {
  //   return await _userCollectionRef.doc(uid).get();
  // }

  // Future<DocumentSnapshot> get(String uid) async {
  //   return await _userCollectionRef.doc(uid).get();
  // }

  void deleteDocument(String uid) async {
    try {
      // Provide the path to the document you want to delete
      // String documentPath = 'User';
      await _userCollectionRef.doc(uid).delete();
      // Document is successfully deleted
    } catch (e) {
      // Handle document deletion errors
      print('Document Deletion Error: $e');
    }
  }
}
