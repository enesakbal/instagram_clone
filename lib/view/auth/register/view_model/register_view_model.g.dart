// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  final _$hasPressedAtom = Atom(name: '_RegisterViewModelBase.hasPressed');

  @override
  bool get hasPressed {
    _$hasPressedAtom.reportRead();
    return super.hasPressed;
  }

  @override
  set hasPressed(bool value) {
    _$hasPressedAtom.reportWrite(value, super.hasPressed, () {
      super.hasPressed = value;
    });
  }

  final _$visibilityAtom = Atom(name: '_RegisterViewModelBase.visibility');

  @override
  bool get visibility {
    _$visibilityAtom.reportRead();
    return super.visibility;
  }

  @override
  set visibility(bool value) {
    _$visibilityAtom.reportWrite(value, super.visibility, () {
      super.visibility = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_RegisterViewModelBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_RegisterViewModelBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$phoneNumberControllerAtom =
      Atom(name: '_RegisterViewModelBase.phoneNumberController');

  @override
  TextEditingController get phoneNumberController {
    _$phoneNumberControllerAtom.reportRead();
    return super.phoneNumberController;
  }

  @override
  set phoneNumberController(TextEditingController value) {
    _$phoneNumberControllerAtom.reportWrite(value, super.phoneNumberController,
        () {
      super.phoneNumberController = value;
    });
  }

  final _$phoneConfirmationCodeControllerAtom =
      Atom(name: '_RegisterViewModelBase.phoneConfirmationCodeController');

  @override
  TextEditingController get phoneConfirmationCodeController {
    _$phoneConfirmationCodeControllerAtom.reportRead();
    return super.phoneConfirmationCodeController;
  }

  @override
  set phoneConfirmationCodeController(TextEditingController value) {
    _$phoneConfirmationCodeControllerAtom
        .reportWrite(value, super.phoneConfirmationCodeController, () {
      super.phoneConfirmationCodeController = value;
    });
  }

  final _$codeAtom = Atom(name: '_RegisterViewModelBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$shortCutsAtom = Atom(name: '_RegisterViewModelBase.shortCuts');

  @override
  List<String> get shortCuts {
    _$shortCutsAtom.reportRead();
    return super.shortCuts;
  }

  @override
  set shortCuts(List<String> value) {
    _$shortCutsAtom.reportWrite(value, super.shortCuts, () {
      super.shortCuts = value;
    });
  }

  final _$nextStepPhoneAsyncAction =
      AsyncAction('_RegisterViewModelBase.nextStepPhone');

  @override
  Future<dynamic> nextStepPhone({required String phoneNumber}) {
    return _$nextStepPhoneAsyncAction
        .run(() => super.nextStepPhone(phoneNumber: phoneNumber));
  }

  final _$nextStepEmailAsyncAction =
      AsyncAction('_RegisterViewModelBase.nextStepEmail');

  @override
  Future<dynamic> nextStepEmail({required String email}) {
    return _$nextStepEmailAsyncAction
        .run(() => super.nextStepEmail(email: email));
  }

  final _$codeGenerateAsyncAction =
      AsyncAction('_RegisterViewModelBase.codeGenerate');

  @override
  Future<dynamic> codeGenerate() {
    return _$codeGenerateAsyncAction.run(() => super.codeGenerate());
  }

  @override
  String toString() {
    return '''
hasPressed: ${hasPressed},
visibility: ${visibility},
emailController: ${emailController},
passwordController: ${passwordController},
phoneNumberController: ${phoneNumberController},
phoneConfirmationCodeController: ${phoneConfirmationCodeController},
code: ${code},
shortCuts: ${shortCuts}
    ''';
  }
}
