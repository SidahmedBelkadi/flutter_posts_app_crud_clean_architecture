part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class ThemeLoaded extends ThemeState {
  final ThemeData themeData;

  const ThemeLoaded({required this.themeData});

  @override
  List<Object> get props => [themeData];
}
