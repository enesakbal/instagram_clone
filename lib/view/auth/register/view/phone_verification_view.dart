import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

import 'package:instagram_clone/core/extension/string_extension.dart';
import 'package:instagram_clone/core/components/buttons/custom_button.dart';
import 'package:instagram_clone/core/components/text_fields/custom_text_form_field.dart';
import 'package:instagram_clone/core/base/state/base_state.dart';
import 'package:instagram_clone/core/base/view/base_view.dart';
import 'package:instagram_clone/view/auth/register/view_model/register_view_model.dart';

class PhoneVerificationView extends StatefulWidget {
  PhoneVerificationView({Key? key, this.phoneNumber = ''}) : super(key: key);

  final String phoneNumber;

  @override
  _PhoneVerificationViewState createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends BaseState<PhoneVerificationView> {
  late RegisterViewModel viewModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        viewModel: RegisterViewModel(),
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
      appBar: _appbar(),
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
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        width: 100.w,
        height: 90.h,
        color: Colors.grey.shade200,
        //padding:
        //padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        child: _buildForm(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Register',
        style: TextStyle(color: Colors.black),
      ),
      toolbarHeight: 5.h,
      leading: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 5.w, right: 5.w, top: 2.5.h, bottom: 15.h),
            child: Column(
              children: [
                _texts(),
                SizedBox(height: 3.h),
                _codeTextField(),
                SizedBox(height: 5.h),
                _nextButton(),
              ],
            ),
          ),
          Observer(builder: (context) {
            return viewModel.visibility
                ? SafeArea(child: _bottomInfo())
                : SizedBox(
                    height: 0,
                    width: 0,
                  );
          })
        ],
      ),
    );
  }

//TODO CONFIRMATION SAYFALARINA VALIDATOR EKLE.
//TODO BIR TANE CODE GENERATOR YAZ
//TODO ANASAYFAYA GEÇİŞ YAP
// ELINE SAĞLIK MÜHENDİS ADAMMMMM
  Widget _texts() {
    return Column(
      children: [
        Text(
          'Enter Confirmation Code\n',
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 2.h),
        Text(
          'Enter the code we sent to ${widget.phoneNumber}.',
          maxLines: 2,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(height: 0.25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPress: () {
                Navigator.maybePop(context);
              },
              text: 'Change Number',
              buttonColor: Colors.transparent,
              overlayColor: Colors.transparent,
              textStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              width: 30.w,
              height: 2.h,
            ),
            Text('or',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                )),
            CustomButton(
              onPress: () async {
                viewModel.visibility = true;
                _bottomInfo();
              },
              text: 'Resend SMS',
              buttonColor: Colors.transparent,
              overlayColor: Colors.transparent,
              textStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              width: 25.w,
              height: 2.h,
            ),
          ],
        )
      ],
    );
  }

  Widget _codeTextField() {
    return CustomTextFormField(
      textEditingController: viewModel.phoneConfirmationCodeController,
      validator: (value) => value!.isValidConfimationCode(viewModel.code),
      hintText: 'Confirmation Code',
      hintStyle: TextStyle(color: Colors.grey),
    );
  }

  Widget _nextButton() {
    return CustomButton(
      onPress: () {
        formKey.currentState!.validate();
        print(viewModel.code);
      },
      text: 'Next',
      buttonColor: Colors.blue,
      textStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
      height: 5.5.h,
    );
  }

  Widget _bottomInfo() {
    return FutureBuilder(
      builder: (contexts, snaps) {
        return AnimatedOpacity(
          opacity: viewModel.visibility ? 1 : 0,
          duration: Duration(milliseconds: 250),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 6.h,
              width: 100.w,
              color: Colors.black,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Observer(builder: (_) {
                    return Text(
                      'We sent the confirmation code to your number ending with ${widget.phoneNumber}  (Code : ${viewModel.code})',
                      style: TextStyle(color: Colors.white),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
      future: viewModel.codeGenerate(),
    );
  }
}
