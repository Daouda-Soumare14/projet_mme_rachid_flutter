import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'size_config.dart';

class Utils {
  static const double TABLET_BREAKPOINT = 600.0;

  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static bool isPortrait(BuildContext context) {
    return SizeConfig.orientation == Orientation.portrait;
  }

  static Future<bool> isTablet(BuildContext context) async {
    try {
      if (Platform.isIOS) {
        return _isIosTablet();
      }
      if (Platform.isAndroid) {
        return _isAndroidTablet(context);
      }
      return _isTabletByScreenSize(context);
    } catch (e) {
      debugPrint("Error lors de la detection de la tablette: $e");
      return _isTabletByScreenSize(context);
    }
  }

  /// pour ios on verifi juste si le model contient le mot ipad
  /// c'est fiable car ipple a une nomenclature clair
  static Future<bool> _isIosTablet() async {
    final iosInfos = await _deviceInfoPlugin.iosInfo;
    return iosInfos.model.toLowerCase().contains("ipad");
  }

  /// pour android on utilise 3 criteres
  /// - on verifie si l'ecran deppasse 600db
  /// - on verifie si l'appareil supporte le 64 bit (commun sur la plupart des tablets modernes)
  /// - on verifie si l'ecran fait plus de 7 pouces en diagonal
  static Future<bool> _isAndroidTablet(BuildContext context) async {
    final androidInfos = await _deviceInfoPlugin.androidInfo;
    bool hasTasbletCharacteristics =
        androidInfos.supported64BitAbis.isNotEmpty ?? false;

    bool isTabletByScreen = _isTabletByScreenSize(context);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double diagonalInches =
        _calculateScreenDiagonal(screenWidth, screenHeight, context);
    bool isLargeScreen = diagonalInches > 7.0;

    return isTabletByScreen && hasTasbletCharacteristics && isLargeScreen;
  }

  static double _calculateScreenDiagonal(
      double width, double height, BuildContext context) {
    var pixelRatio = MediaQuery.of(context).devicePixelRatio;
    var phycicalWidth = width * pixelRatio;
    var phycicalHeight = height * pixelRatio;
    var diagonalPixel = _pythagores(phycicalWidth, phycicalHeight);

    return diagonalPixel / (160 * pixelRatio);
  }

  static double _pythagores(double width, double height) {
    return math.sqrt(width * width + height * height);
  }

  static bool _isTabletByScreenSize(BuildContext context) {
    final shortestSize = MediaQuery.of(context).size.shortestSide;
    return shortestSize > TABLET_BREAKPOINT;
  }
}
