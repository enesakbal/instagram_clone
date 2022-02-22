import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:instagram_clone/core/base/state/base_state.dart';
import 'package:instagram_clone/core/components/buttons/custom_button.dart';
import 'package:instagram_clone/core/components/text_fields/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';
import 'package:instagram_clone/core/base/view/base_view.dart';
import 'package:instagram_clone/view/auth/login/view_model/login_view_model.dart';
import '../../../../core/extension/string_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel viewModel;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onPageBuilder: (context, model) => _buildScaffold(),
        onModelReady: (model) {
          model.init();
          model.setContext(context);
          viewModel = model;
        });
  }

  Widget _buildScaffold() {
    return Scaffold(
      body: _gesturedBody(),
    );
  }

  Widget _gesturedBody() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: _buildSingleChildScrollView(),
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    );
  }

  Widget _buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Container(
        width: 100.w,
        height: 100.h,
        //color: Colors.grey.shade200,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 5.h),
        //padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        child: _buildForm(),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
        key: formKey,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _logo(),
                SizedBox(height: 7.5.h),
                _emailTextField(),
                SizedBox(height: 2.h),
                _passwordTextField(),
                SizedBox(height: 1.h),
                _forgotPassword(),
                SizedBox(height: 5.h),
                _loginButton(),
                SizedBox(height: 4.h),
                _facebookButton(),
                SizedBox(height: 3.h),
                _divider(),
                SizedBox(height: 2.5.h),
                _signUp(),
              ],
            ),
            _facebookText(),
          ],
        ));
  }

  Container _logo() {
    return Container(
      height: 12.5.h,
      width: 12.5.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo/Instagram-logo.png'),
          fit: BoxFit.cover,
          scale: 1,
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return CustomTextFormField(
      textEditingController: TextEditingController(),
      hintText: 'Phone number, username or email',
      validator: (value) => value!.isValidEmail,
    );
  }

  Widget _passwordTextField() {
    return CustomTextFormField(
      textEditingController: TextEditingController(),
      hintText: 'Password',
      validator: (value) => value!.isValidPassword,
      isObscure: true,
    );
  }

  Widget _forgotPassword() {
    return Align(
        alignment: Alignment.centerRight,
        child: CustomButton(
          width: 30.w,
          height: 2.h,
          buttonColor: Colors.transparent,
          overlayColor: Colors.transparent,
          text: 'Forgot Password',
          textStyle: TextStyle(color: Colors.blue),
          onPress: () {},
        ));
  }

  Widget _loginButton() {
    return Observer(builder: (_) {
      return CustomButton(
        height: 5.h,
        text: 'Log In',
        textStyle: TextStyle(color: Colors.white),
        hasPressed: viewModel.hasPressed,
        onPress: () async {
          if (formKey.currentState!.validate()) {
            await viewModel.login();
          }
          print('burda');
        },
      );
    });
  }

  Widget _facebookButton() {
    return CustomButton(
      width: 60.w,
      onPress: () {},
      buttonColor: Colors.transparent,
      overlayColor: Colors.grey.shade200,
      hasIcon: true,
      iconPath: 'assets/logo/facebook-logo.png',
      text: 'Continue with Facebook',
    );
  }

  Widget _divider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            flex: 2,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
            )),
        Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'OR',
                style: TextStyle(color: Colors.grey),
              ),
            )),
        Expanded(
            flex: 2,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 0,
            ))
      ],
    );
  }

  Widget _signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        CustomButton(
          onPress: () => viewModel.toRegister(),
          width: 20.w,
          text: 'Sign Up',
          textStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400),
          buttonColor: Colors.transparent,
          overlayColor: Colors.transparent,
        )
      ],
    );
  }

  Widget _facebookText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('from', style: TextStyle(color: Colors.grey)),
          SizedBox(height: 0.5.h),
          Text(
            'FACEBOOK',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
