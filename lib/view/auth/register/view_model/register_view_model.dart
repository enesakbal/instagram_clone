import 'package:instagram_clone/core/base/model/base_view_model.dart';
import'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store, BaseViewModel{
    @override
  void init() {
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  bool hasPressed = false;

  @action
  Future nextStepPhoneONE() async {
    hasPressed = true;
    await Future.delayed(Duration(seconds: 2));
    hasPressed = false;
  }

}