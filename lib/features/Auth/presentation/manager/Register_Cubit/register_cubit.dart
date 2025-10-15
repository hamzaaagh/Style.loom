import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/features/Auth/data/Repo/Auth_Repo_Imp.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authrepo) : super(RegisterInitial());
  final AuthRepoImp authrepo;
  Future<void> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    emit(RegisterLoading());
    var result = await authrepo.register(
      email: email,
      password: password,
      firstname: firstname,
      lastname: lastname,
    );
    result.fold(
      (failure) {
        print('Login failed: ${failure.errormessage}');
        emit(RegisterFailure(errorMessage: failure.errormessage));
      },
      (response) {
        print('Login success: ${response.data}');
        emit(RegisterSucces());
      },
    );
  }
}
