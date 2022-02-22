import 'package:flutter/material.dart';
import 'package:instagram_clone/core/base/model/base_view_model.dart';
import 'package:instagram_clone/core/constants/navigation/navigation_constants.dart';
import 'package:instagram_clone/core/init/navigation/navigation_service.dart';
import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool hasPressed = false;

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @action
  void toRegister() => NavigationService.instance
      .navPush(path: NavigationConstants.REGISTER_VIEW);

  @action
  Future login() async {
    hasPressed = true;
    await Future.delayed(Duration(seconds: 2));
    hasPressed = false;
  }
}
