import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce_freak/src/helpers/getFileName.dart';

class UserController extends GetxController {
  //
  final _firestore = FirebaseFirestore.instance;

  //
  final _firebaseStorage = FirebaseStorage.instance;
  //
  final _auth = FirebaseAuth.instance;
  //
  final isLoading = RxBool(false);
  //
  Stream<DocumentSnapshot<Map<String, dynamic>>> getCurrentUserData() {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .snapshots();
  }

  saveUserProfileImage(String photoUrl) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .update({'profileImage': photoUrl});
    } catch (e) {
      print(e);
    }
  }

  pickProfileImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      isLoading.value = true;
      final userImage = File(pickedImage!.path);

      final taskSnapshot = await _firebaseStorage
          .ref('user/profile/${getFileName(path: pickedImage.path)}')
          .putFile(userImage);

      if (taskSnapshot.state == TaskState.success) {
        final photoUrl = await taskSnapshot.ref.getDownloadURL();
        print(photoUrl);
        saveUserProfileImage(photoUrl);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  saveUserCoverImage(String photoUrl) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .update({'coverImage': photoUrl});
    } catch (e) {
      print(e);
    }
  }

  pickCoverImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      isLoading.value = true;
      final userImage = File(pickedImage!.path);

      final taskSnapshot = await _firebaseStorage
          .ref('user/cover/${getFileName(path: pickedImage.path)}')
          .putFile(userImage);

      if (taskSnapshot.state == TaskState.success) {
        final photoUrl = await taskSnapshot.ref.getDownloadURL();
        print(photoUrl);
        saveUserCoverImage(photoUrl);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}
