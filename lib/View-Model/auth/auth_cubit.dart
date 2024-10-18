import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    try {
      emit(AuthLoading());
      if (email.isEmpty) {
        emit(AuthFailed(message: 'Please enter your email'));
        return;
      }

      if (password.isEmpty) {
        emit(AuthFailed(message: 'Please enter your password'));
        return;
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailed(message: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailed(message: 'Wrong password provided'));
      } else {
        emit(AuthFailed(message: 'Email or password is incorrect'));
      }
    } catch (e) {
      emit(AuthFailed(message: 'An unexpected error occurred'));
    }
  }

  void register(String email,String password)async{
    try {
      emit(AuthLoading());
      if (email.isEmpty) {
        emit(AuthFailed(message: 'Please enter your email'));
        return;
      }

      if (password.isEmpty) {
        emit(AuthFailed(message: 'Please enter your password'));
        return;
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailed(message: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(AuthFailed(message: 'The account already exists for that email'));
      }
      else {
        emit(AuthFailed(message: 'Email or password is incorrect'));
      }
    } catch (e) {
      emit(AuthFailed(message: 'An unexpected error occurred'));
    }
  }

}
