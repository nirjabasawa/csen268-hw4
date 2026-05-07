import 'package:flutter_bloc/flutter_bloc.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(NotLoggedIn()) {
    on<LoginRequested>((event, emit) {
      emit(LoggedIn());
    });

    on<LogoutRequested>((event, emit) {
      emit(NotLoggedIn());
    });
  }
}
