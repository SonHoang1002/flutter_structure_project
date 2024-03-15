import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: constant_identifier_names
enum DeviceType { Phone, Tablet }

class DevicePlatformCubit extends Cubit<DeviceType> {
  DevicePlatformCubit() : super(DeviceType.Phone);

  DeviceType get getPlatform => _getPlatform();

  DeviceType _getPlatform() {
    final data =
        MediaQueryData.fromView(PlatformDispatcher.instance.views.first);
    return data.size.shortestSide < 550 ? DeviceType.Phone : DeviceType.Tablet;
  }
  bool get isPhone => _getPlatform() == DeviceType.Phone;
}
