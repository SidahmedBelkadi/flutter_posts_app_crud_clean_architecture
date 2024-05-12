import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/core/theme/app_theme.dart';
import 'package:posts_app/core/theme/app_themes.dart';
import 'package:posts_app/core/theme/theme_cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Future<void> getCurrentTheme() async {
    final int themeIndex = await ThemeCacheHelper.getCachedThemeIndex();

    final theme = AppTheme.values.firstWhere((appTheme) => appTheme.index == themeIndex);

    emit(ThemeLoaded(themeData: appThemeData[theme]!));
  }

  Future<void> changeTheme({required int index}) async {
    await ThemeCacheHelper.cacheThemeIndex(index);
    emit(ThemeLoaded(themeData: appThemeData[AppTheme.values[index]]!));
  }
}
