import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:style/features/Auth/data/Repo/Auth_Repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  
  final AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    var result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) {
        
        emit(LoginFailure(errorMessage: failure.errormessage));
      },
      (response) {
       
        emit(LoginSucces());
      },
    );
  }
}
