part of 'dashboard_cubit.dart';

enum DashboardNav {
  home,
  category,
  tag3,
  tag4,
  like,
  account,
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(DashboardNav.home) DashboardNav currentPage,
  }) = _DashboardState;
}
