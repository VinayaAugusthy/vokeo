import 'package:dartz/dartz.dart';
import 'package:vokeo/domain/auth/auth_failure.dart';

abstract class IAuthRepo {
  Future<Either<AuthFailure, Unit>> signUpWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<AuthFailure, Unit>> sinInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
