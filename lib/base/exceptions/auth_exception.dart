import '../../l10n/localization_helper.dart';
import 'base_exception.dart';

enum AuthExceptionType {
  weakPassword,
  emailAlreadyInUse,
  userNotFound,
  wrongPassword,
  none;

  String localize(AppLocalizations localize) {
    switch (this) {
      case AuthExceptionType.weakPassword:
        return localize.weakPassword;
      case AuthExceptionType.emailAlreadyInUse:
        return localize.emailAlreadyInUse;
      case AuthExceptionType.userNotFound:
        return localize.userNotFound;
      case AuthExceptionType.wrongPassword:
        return localize.wrongPassword;
      case AuthExceptionType.none:
        return localize.noneAuthException;
    }
  }
}

class AuthException implements BaseException {
  final AuthExceptionType exceptionType;

  const AuthException({
    required this.exceptionType,
  });

  @override
  String toString() {
    return exceptionType.localize(getLocaleLocalizations());
  }
}
