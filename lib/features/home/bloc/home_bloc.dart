import 'package:codium/repositories/home/abstract_home_repository.dart';
import 'package:codium/repositories/home/home.dart';
import 'package:codium/repositories/models/group_data_model.dart';
import 'package:codium/repositories/models/main_progress_data_model.dart';
import 'package:codium/repositories/models/section_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHome) {
        try {
          emit(HomeLoading());
          final group = await homeRepository.group();
          final sections = await homeRepository.section();
          final mainProgress = await homeRepository.mainProgress();
          emit(HomeSuccess(
              group: group, sections: sections, mainProgress: mainProgress));
        } catch (e) {
          emit(HomeFailure(error: e));
        }
      }
    });
  }

  final AbstractHomeRepository homeRepository;
}
