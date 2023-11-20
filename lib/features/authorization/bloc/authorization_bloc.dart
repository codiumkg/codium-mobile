import 'package:codium/repositories/authorization/abstract_authorization_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';
part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc(this.authorizationRepository)
      : super(AuthorizationInitial()) {
    on<LoadAuthorization>((event, emit) async {
      emit(AuthorizationLoading());
      final Authorization = authorizationRepository.login(
        event.username,
        event.password,
      );
      emit(AuthorizationSuccess());
    });
  }

  final AbstractAuthorizationRepository authorizationRepository;
}
