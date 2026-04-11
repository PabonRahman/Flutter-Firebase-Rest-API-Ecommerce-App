import 'package:ecommerce/app/app_urls.dart';
import 'package:ecommerce/core/network_caller/network_caller.dart';
import 'package:ecommerce/features/auth/data/models/sign_up_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _signUpInProgress = false;
  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpModel model) async {
    bool isSuccess = false;

    _signUpInProgress = true;
    _errorMessage = null;
    update();

    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.signUpUrl,
      body: model.toJson(),
    );

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }

    _signUpInProgress = false;
    update();

    return isSuccess;
  }
}