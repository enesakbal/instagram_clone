import 'dart:math';

import 'package:instagram_clone/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/navigation/navigation_constants.dart';
import 'package:instagram_clone/core/init/navigation/navigation_service.dart';

import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel {
  @override
  void init() {
    visibility = true;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool hasPressed = false;

  @observable
  bool visibility = true;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController phoneNumberController =
      TextEditingController(text: '+90 123 321 23 45');

  @observable
  TextEditingController phoneConfirmationCodeController =
      TextEditingController();

  @observable
  String code = '';

  @observable
  List<String> shortCuts = [
    '@gmail.com',
    '@hotmail.com',
    '@outlook.com',
    '@yahoo.com'
  ];

  @action
  Future nextStepPhone({required String phoneNumber}) async {
    hasPressed = true;
    await Future.delayed(Duration(seconds: 0));
    hasPressed = false;

    await Future.delayed(Duration(milliseconds: 100));

    await NavigationService.instance.navPush(
        path: NavigationConstants.REGISTER_PHONE_VERIFICATION,
        object: phoneNumber);
  }

  @action
  Future nextStepEmail({required String email}) async {
    hasPressed = true;
    await Future.delayed(Duration(seconds: 1));
    hasPressed = false;
    await NavigationService.instance.navPush(
        path: NavigationConstants.REGISTER_EMAIL_VERIFICATION, object: email);
  }

  @action
  Future codeGenerate() async {
    visibility = true;
    code = '';
    for (var i = 0; i < 6; i++) {
      code += Random().nextInt(10).toString();
    }
    print(code);
    await Future.delayed(Duration(seconds: 3));
    visibility = false;
  }
}
