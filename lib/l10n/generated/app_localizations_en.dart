import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get flag => '🇬🇧';

  @override
  String get languages => 'Languages';

  @override
  String get languageName => 'English';

  @override
  String get fonts => 'Fonts';

  @override
  String get serverErrorMessage => 'Server error occurred';

  @override
  String get errorInternetConnection => 'Internet Connection Error';

  @override
  String get theme => 'Theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get oops => 'Ooops...';

  @override
  String get somethingWentWrong => 'Something went wrong. Try again later or update the screen';

  @override
  String get digitalWorkaround => 'Digital workaround for';

  @override
  String get constructionCompanies => 'Construction Companies';

  @override
  String get weakPassword => 'The password provided is too weak.';

  @override
  String get emailAlreadyInUse => 'The account already exists for that email.';

  @override
  String get userNotFound => 'No user found for that email.';

  @override
  String get wrongPassword => 'Wrong password provided for that user.';

  @override
  String get noneAuthException => 'Undefined exception';

  @override
  String get signInGoogle => 'Sign In with Google';

  @override
  String get signInAnonymously => 'Sign In Anonymously';

  @override
  String get logOut => 'Log Out';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter email';

  @override
  String get username => 'Username';

  @override
  String get usernameHint => 'Enter Username';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter password';

  @override
  String get ok => 'OK';
}
