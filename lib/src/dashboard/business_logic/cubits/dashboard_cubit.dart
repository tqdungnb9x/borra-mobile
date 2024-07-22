import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_cubit.freezed.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  void onPageChange(int page) {
    try {
      emit(state.copyWith(currentPage: DashboardNav.values[page]));
    } catch (e) {
      emit(state.copyWith(currentPage: DashboardNav.home));
    }
  }
}
