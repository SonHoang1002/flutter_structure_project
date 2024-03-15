import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_project/material_with_them.dart';
import 'package:flutter_structure_project/providers/blocs/device_platform_bloc.dart';
import 'package:flutter_structure_project/providers/blocs/theme_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
  // check dark mode
  Brightness themeMode =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool darkMode = themeMode == Brightness.dark;
  redoSystemStyle(darkMode);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: ((context) => ThemeBloc())),
        BlocProvider<DevicePlatformCubit>(
            create: ((context) => DevicePlatformCubit())),
      ],
      child: const MaterialWithTheme(),
    );
  }
}

Future<void> redoSystemStyle(bool darkMode) async {
  if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
    final bool edgeToEdge = androidInfo.version.sdkInt >= 29;
    // The commented out check below isn't required anymore since https://github.com/flutter/engine/pull/28616 is merged
    // if (edgeToEdge)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: darkMode ? Brightness.dark : Brightness.light,
      statusBarIconBrightness: darkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: edgeToEdge
          ? Colors.transparent
          : darkMode
              ? Colors.black
              : Colors.transparent,
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarIconBrightness:
          darkMode ? Brightness.light : Brightness.dark,
    ));
  } else {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}
