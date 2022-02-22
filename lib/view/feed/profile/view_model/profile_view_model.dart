import 'package:flutter/material.dart';
import 'package:instagram_clone/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store , BaseViewModel{

    
  @override
  void init() {}

  @override
  void setContext(BuildContext context) {}
  
}