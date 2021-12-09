import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_freak/src/helpers/getFileName.dart';
import 'package:ecommerce_freak/src/pages/bottomBarHome.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProductsController extends GetxController {
  //
  final _firestore = FirebaseFirestore.instance;

  //
  final _firebaseStorage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  //
  final isLoading = RxBool(false);

  //

  final productTitle = RxString('');
  final productPrice = RxString('');
  final productDiscount = RxString('');
  final productCatagory = RxString('');
  final productSize = RxString('');
  final productImageUrl = RxString('');
  final productdescription = RxString('');

// get firebase data

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts()  {
    return _firestore.collection('allProducts').snapshots();
  }

// add firebase products

  addProducts(BuildContext context) async {
    try {
      final products = await _firestore.collection('allProducts').add({
        'productTitle': productTitle.value,
        'productPrice': productPrice.value,
        'productDiscount': productDiscount.value,
        'productCategory': productCatagory.value,
        'productSize': null,
        'productImageUrl': null,
        'productDescription': productdescription.value,
      });

      if (products.path.isNotEmpty) {
        Get.snackbar('Product Added', 'Successfull');

        print(products);
        Get.offAll(BottomBarHome());
      }
    } catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: e.toString(),
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
  //

  saveProductImage(String photoUrl) async {
    try {
      await _firestore
          .collection('allProducts')
          .doc(_auth.currentUser?.uid)
          .update({'productImageUrl': photoUrl});
    } catch (e) {
      print(e);
    }
  }

  pickProductImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      isLoading.value = true;
      final userImage = File(pickedImage!.path);

      final taskSnapshot = await _firebaseStorage
          .ref('products/allProductsImage/${getFileName(path: pickedImage.path)}')
          .putFile(userImage);

      if (taskSnapshot.state == TaskState.success) {
        final photoUrl = await taskSnapshot.ref.getDownloadURL();
        Get.snackbar('Image Upload', 'Successfull');
        print(photoUrl);
        saveProductImage(photoUrl);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }

  //
  pickImageFromCamera() async {
//
  }

  //

  //

}

//

const listProduct = [
  {
    'id': '1',
    'title': 'Nike Air Max',
    'price': '150.00',
    'discount': '30%',
    'discountPrice': '300.00',
    'image': 'assets/img/shoes1.png',
  },
  {
    'id': '2',
    'title': 'Cannon 600d',
    'price': '250.00',
    'discount': '50%',
    'discountPrice': '600.00',
    'image': 'assets/img/shoes2.png',
  },
  {
    'id': '3',
    'title': 'Cannon 600d',
    'price': '250.00',
    'discount': '50%',
    'discountPrice': '600.00',
    'image': 'assets/img/shoes2.png',
  },
  {
    'id': '4',
    'title': 'Nike Air Max',
    'price': '150.00',
    'discount': '30%',
    'discountPrice': '300.00',
    'image': 'assets/img/shoes1.png',
  },
];
