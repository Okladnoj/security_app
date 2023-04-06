import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get flag => '🇷🇺';

  @override
  String get languages => 'Языки';

  @override
  String get languageName => 'Русский';

  @override
  String get fonts => 'Шрифты';

  @override
  String get serverErrorMessage => 'Ошибка сервера';

  @override
  String get errorInternetConnection => 'Ошибка соединения';

  @override
  String get theme => 'Тема';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Темная';

  @override
  String get oops => 'Упс...';

  @override
  String get somethingWentWrong => 'Что-то пошло не так, попробуйте обновить экран';

  @override
  String get digitalWorkaround => 'Digital workaround for';

  @override
  String get constructionCompanies => 'Construction Companies';

  @override
  String get weakPassword => 'Предоставленный пароль слишком слаб.';

  @override
  String get emailAlreadyInUse => 'Учетная запись для этого адреса электронной почты уже существует.';

  @override
  String get userNotFound => 'Пользователь для этого адреса электронной почты не найден.';

  @override
  String get wrongPassword => 'Для этого пользователя указан неверный пароль.';

  @override
  String get noneAuthException => 'Неопределенное исключение';

  @override
  String get signInGoogle => 'Войти через Google';

  @override
  String get signInAnonymously => 'Войти Анонимно';

  @override
  String get logOut => 'Выйти';

  @override
  String get email => 'Эл. почта';

  @override
  String get emailHint => 'Введите почту';

  @override
  String get username => 'Никнейм';

  @override
  String get usernameHint => 'Введите никнейм';

  @override
  String get password => 'Пароль';

  @override
  String get passwordHint => 'Введите пароль';

  @override
  String get ok => 'Хорошо';
}
