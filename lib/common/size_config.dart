import 'package:flutter/material.dart';

import 'utils.dart';

class SizeConfig {
  // pourquoi cette taille

  /*
  reference suivant les dimenssion de l'iphone x/xs
  */
  static const double DESIGN_WIDTH = 375.0;
  static const double DESIGN_HIGHT = 812.0;

  // late pour dire que ces infos seront en retard donc asynchrone
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static late Orientation orientation;
  static bool isTablet = false;
  static bool isDarkMode = false;

  ///  case pour stocher les calculs de pourcentage
  /// ces maps evitent de recalculer les meme pourventage
  /// plusieurs fois
  static final Map<int, double> _widthPourcentage = {};
  static final Map<int, double> _heightPourcentage = {};

  static void init(BuildContext context) async {
    // permet de recuperer les infos de l'appareil
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    pixelRatio = _mediaQueryData.devicePixelRatio;
    isDarkMode = _mediaQueryData.platformBrightness == Brightness.dark;

    isTablet = await Utils.isTablet(context);
    print("screenWidth:  $screenWidth");
    print("screenHeight:  $screenHeight");
    print("orientation:  $orientation");
    print("pixelRatio:  $pixelRatio");
    print("isDarkMode:  $isDarkMode");
    print("isTablet:  $isTablet");
  }

  static double getProportionateScreenHeight(double inputHeight) {
    return (inputHeight / DESIGN_HIGHT) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    return (inputWidth / DESIGN_HIGHT) * screenWidth;
  }
}
