import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/dependecy_injection/service_locator.dart' as service_locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ----- Initialize Service Locator
  await service_locator.init();

  // ----- Register Bloc Observer
  Bloc.observer = AppBlocObserver();

  runApp(const PostsApp());
}
