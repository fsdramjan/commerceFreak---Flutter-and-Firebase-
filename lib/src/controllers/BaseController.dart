import 'package:get/get.dart';
import 'package:image_upload_firebase/src/authentication/Auth.dart';

import 'package:image_upload_firebase/src/controllers/userController.dart';

class BaseController {
  final userC = Get.put(UserController());
  final authC = Get.put(AuthenticateC());
  // final productC = Get.put(ProductsController());
}
