class ApplicationConstants {
  static const EMAIL_REGEX =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';

  static const PASSWORD_REGEX =
      r'^(?=.*[a-z.!#$%&’*+/=?^_`{|}~-])(?=.*[A-Z.!#$%&’*+/=?^_`{|}~-])(?=.*\d)[\w!@#$%^&*?~()-.!#$%&’*+/=?^_`{|}~-]{8,}$';

  static const NOT_SPECIAL_REGEX = r'^[a-z0-9_.-]*$';

  static const CONFIRMATION_REGEX = r'[0-9]';

  static const PHONE_NUMBER_REGEX =
      r'(([\+]90?)|([0]?))([ ]?)((\([0-9]{3}\))|([0-9]{3}))([ ]?)([0-9]{3})(\s*[\-]?)([0-9]{2})(\s*[\-]?)([0-9]{2})';

  static const NAME_SURNAME_REGEX_EN = r'^[a-zA-Z ]*$'; // EN

  static const NAME_SURNAME_REGEX = r'^[A-Za-z_ğüşıöçĞÜŞİÖÇ ]*$'; // TR

  static const DATE_REGEX =
      r'^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$';

  static const TIME24_REGEX = r'^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$';
}
