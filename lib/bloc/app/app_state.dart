part of 'app_cubit.dart';

@immutable
class AppState extends BaseState {
  final bool login;
  final UserModel profile;
  final List<TemplateModel> templates;
  final List<TemplateModel> searched;

  const AppState({
    super.status,
    super.message,
    this.login = false,
    this.profile = const UserModel(),
    this.templates = const [],
    this.searched = const [],
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      login,
      profile,
      templates,
      searched,
    ];
  }

  AppState copyWith({
    StateStatus? status,
    String? message,
    bool? login,
    UserModel? profile,
    List<TemplateModel>? templates,
    List<TemplateModel>? searched,
  }) {
    return AppState(
      status: status ?? super.status,
      message: message ?? super.message,
      login: login ?? this.login,
      profile: profile ?? this.profile,
      templates: templates ?? this.templates,
      searched: searched ?? this.searched,
    );
  }
}
