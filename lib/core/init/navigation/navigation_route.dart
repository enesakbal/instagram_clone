import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/navigation/navigation_constants.dart';
import 'package:instagram_clone/view/auth/register/view/email_verification_view.dart';
import 'package:instagram_clone/view/auth/register/view/phone_verification_view.dart';
import 'package:instagram_clone/view/auth/register/view/register_view.dart';

import '../../../view/auth/login/view/login_view.dart';

import 'navigation_animation.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return defaultNavigate(LoginView());

      case NavigationConstants.REGISTER_VIEW:
        return defaultNavigate(RegisterView());

      case NavigationConstants.REGISTER_PHONE_VERIFICATION:
        return defaultNavigate(PhoneVerificationView(
          phoneNumber: args.arguments as String,
        ));

      case NavigationConstants.REGISTER_EMAIL_VERIFICATION:
        return defaultNavigate(EmailVerificationView(
          email: args.arguments as String,
        ));
      default:
        return defaultNavigate(
          Scaffold(
            body: Center(
              child: Text('Burda OLMAMALI'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute defaultNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  MaterialPageRoute leftToRightNavigate(Widget widget) {
    return LeftToRight(
      builder: (context) => widget,
    );
  }

  MaterialPageRoute rightToLeftNavigate(Widget widget) {
    return RightToLeft(
      builder: (context) => widget,
    );
  }

  MaterialPageRoute fadeRouteNavigateInstant(Widget widget) {
    return FadeRouteInstant(
      builder: (context) => widget,
    );
  }

  MaterialPageRoute fadeRouteNavigateDelay(Widget widget) {
    return FadeRouteWithDelay(
      builder: (context) => widget,
    );
  }
}
