import 'package:flutter/material.dart';
import 'package:instagram_clone/view/auth/login/view/login_view.dart';
import 'package:sizer/sizer.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() {
  runApp(Sizer(builder: (context, type, orientation) {
    return MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: LoginView(),
    );
  }
}
