part of 'auth_cubit.dart';


abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthFailed extends AuthState {
  String message;
  AuthFailed({required this.message});
}


