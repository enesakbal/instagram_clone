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

  final _$nextStepPhoneONEAsyncAction =
      AsyncAction('_RegisterViewModelBase.nextStepPhoneONE');

  @override
  Future<dynamic> nextStepPhoneONE() {
    return _$nextStepPhoneONEAsyncAction.run(() => super.nextStepPhoneONE());
  }

  @override
  String toString() {
    return '''
hasPressed: ${hasPressed}
    ''';
  }
}
