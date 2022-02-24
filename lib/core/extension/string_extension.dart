import 'package:instagram_clone/core/constants/app/application_constants.dart';

extension StringExtension on String {
  String? get isValidEmail =>
      contains(RegExp(ApplicationConstants.EMAIL_REGEX)) && isNotEmpty
          ? null
          : 'Geçerli bir e-posta giriniz!';

  String? get isValidPassword => contains(
              RegExp(ApplicationConstants.PASSWORD_REGEX)) &&
          isNotEmpty
      ? null
      : 'Şifre en az 8 karakter olmalı. En az bir büyük karakter ve en az bir rakam içermelidir.';

  String? isValidConfimationCode(String? code) =>
      contains(RegExp(ApplicationConstants.CONFIRMATION_REGEX)) &&
              isNotEmpty &&
              length == 6 &&
              this == code
          ? null
          : 'Confirmation code is wrong';

  String? get isValidPhoneNumber =>
      contains(RegExp(ApplicationConstants.PHONE_NUMBER_REGEX)) &&
              isNotEmpty &&
              length == 17
          ? null
          : 'Phone number format is wrong';
}
