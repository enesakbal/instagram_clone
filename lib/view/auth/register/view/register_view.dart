import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:instagram_clone/core/base/state/base_state.dart';
import 'package:instagram_clone/core/base/view/base_view.dart';
import 'package:instagram_clone/core/components/buttons/custom_button.dart';
import 'package:instagram_clone/core/components/text_fields/custom_text_form_field.dart';
import 'package:instagram_clone/view/auth/register/view_model/register_view_model.dart';
import 'package:instagram_clone/core/extension/string_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:sizer/sizer.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView>
    with TickerProviderStateMixin {
  late RegisterViewModel viewModel;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> shortCuts = [
    '@gmail.com',
    '@hotmail.com',
    '@outlook.com',
    '@yahoo.com'
  ];

  late TabController controller;
  @override
  Widget build(BuildContext context) {
    controller = TabController(length: 2, vsync: this);

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
        height: 100.h,
        color: Colors.grey.shade200,
        padding:
            EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h, bottom: 15.h),
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
        children: [_tabBar(), _facebookButton()],
      ),
    );
  }

  Widget _facebookButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CustomButton(
        height: 5.h,
        onPress: () {},
        buttonColor: Colors.blue,
        hasIcon: true,
        iconPath: 'assets/logo/facebook-logo.png',
        iconColor: Colors.white,
        text: 'Sign up with Facebook',
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      height: 35.h,
      width: 100.w,
      color: Colors.transparent,
      child: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorWeight: 1,
            tabs: [
              Tab(
                child: Text('PHONE'),
              ),
              Tab(
                child: Text('E-MAIL'),
              )
            ],
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: controller,
              children: [
                _phoneTab(),
                _emailTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            textEditingController: TextEditingController(),
            validator: (value) {},
            hintText: 'Phone Number',
            inputFormatter: [
              MaskTextInputFormatter(
                mask: '+90 (###) ###-##-##',
                filter: {'#': RegExp(r'[0-9]')},
                initialText: '+90 (123) 456-78-90',
              )
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            'You may receive SMS updates from Instagram and can opt out at any time.',
            style: TextStyle(),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5.h,
          ),
          Observer(builder: (_) {
            return CustomButton(
              onPress: () async {
                await viewModel.nextStepPhoneONE();
              },
              height: 6.h,
              hasPressed: viewModel.hasPressed,
              text: 'Next',
              textStyle: TextStyle(color: Colors.white, fontSize: 13.sp),
              buttonColor: Colors.blue,
            );
          })
        ],
      ),
    );
  }

  Widget _emailTab() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextFormField(
            textEditingController: TextEditingController(),
            validator: (value) {
              return value!.isValidEmail;
            },
            hintText: 'Email Adress',
          ),
          SizedBox(height: 2.h),
          Container(
            width: 100.w,
            height: 3.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: shortCuts.length,
                itemBuilder: (context, index) {
                  return Center(child: _emailShortCut(shortCuts[index]));
                }),
          ),
          SizedBox(
            height: 5.h,
          ),
          Observer(builder: (_) {
            return CustomButton(
              onPress: () async {
                if (formKey.currentState!.validate()) {
                  await viewModel.nextStepPhoneONE();
                }
              },
              height: 6.h,
              hasPressed: viewModel.hasPressed,
              text: 'Next',
              textStyle: TextStyle(color: Colors.white, fontSize: 13.sp),
              buttonColor: Colors.blue,
            );
          })
        ],
      ),
    );
  }

  //TODO
  //emailShortCut adı altında atımic bir widget yaz
  //dilersen view içerisinde _widgets adlı klasör açıp ona yazabilirsin
  //şimdiden kolay gelsin
  Widget _emailShortCut(String text) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.2.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
