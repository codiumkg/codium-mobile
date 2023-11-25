import 'package:codium/repositories/home/abstract_home_repository.dart';
import 'package:codium/repositories/models/group_data_model.dart';
import 'package:codium/repositories/models/section_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.groupRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHome) {
        try {
          emit(HomeLoading());
          final group = await groupRepository.group();
          final sections = await groupRepository.section();
          emit(HomeSuccess(group: group, sections: sections));
        } catch (e) {
          emit(HomeFailure(error: e));
        }
      }
    });
  }

  final AbstractGroupRepository groupRepository;
}
