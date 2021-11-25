import 'package:get/get.dart';
import 'package:ecommerce_freak/src/authentication/Auth.dart';

import 'package:ecommerce_freak/src/controllers/userController.dart';

class BaseController {
  final userC = Get.put(UserController());
  final authC = Get.put(AuthenticateC());
  // final productC = Get.put(ProductsController());
}
