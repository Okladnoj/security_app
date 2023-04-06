part of 'auth_cubit.dart';

@immutable
class AuthState extends BaseState {
  final bool auth;

  const AuthState({
    super.status,
    super.message,
    this.auth = false,
  });

  @override
  List<Object?> get props {
    return [
      ...super.props,
      auth,
    ];
  }

  AuthState copyWith({
    StateStatus? status,
    String? message,
    bool? auth,
  }) {
    return AuthState(
      status: status ?? super.status,
      message: message ?? super.message,
      auth: auth ?? this.auth,
    );
  }
}
