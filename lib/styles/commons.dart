import 'package:flutter/material.dart';

abstract class Commons {
  /// colores
  static const primaryColor = Colors.deepPurple;
  static const secondaryColor = Color(0xFFFFC107);
  static const primaryTextColor = Color(0xFF000000);
  static const secondaryTextColor = Color(0xFF000000);
  static const backgroundColor = Color(0xFFF5F5F5);
  ///
  static const Color dividerColor = Color(0xFFBDBDBD);
  static const Color errorColor = Color(0xFFB71C1C);
  static const Color successColor = Color(0xFF00C569);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF00BCD4);
  static const Color lightColor = Color(0xFFF5F5F5);
  static const Color darkColor = Color(0xFF212121);
  static const Color darkerColor = Color(0xFF000000);
  static const Color darkestColor = Color(0xFF000000);
  static const Color lightestColor = Color(0xFFFFFFFF);
  static const Color deactivatedColor = Color(0xFF9E9E9E);
  static const Color borderColor = Color(0xFFE0E0E0);
  static const Color borderDarkColor = Color(0xFFBDBDBD);
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color chipBackgroundColor = Color(0xFFFFC107);
  static const Color chipDeleteIconColor = Color(0xFF000000);
  static const Color chipTextColor = Color(0xFF000000);
  static const Color dialogBackgroundColor = Color(0xFFFFFFFF);
  static const Color dialogStrokeColor = Color(0xFF757575);
  static const Color dialogTextColor = Color(0xFF212121);
  static const Color dialogTitleBackgroundColor = Color(0xFFE0E0E0);
  static const Color dialogTitleTextColor = Color(0xFF000000);
  static const Color snackbarBackgroundColor = Color(0xFFFFFFFF);
  static const Color snackbarTextColor = Color(0xFF000000);

  /// Tipografias
  static const fontPrincipal = 'Ubuntu';
  static const fontSecondary = 'Iceberg';
  /// estilo de textos
  static const textTitle = TextStyle(color: primaryTextColor, fontFamily: 'Iceberg', fontSize: 60);
  static const textSubTitle = TextStyle(color: secondaryTextColor, fontSize: 15);
  static const textButtons = TextStyle(color: primaryTextColor, fontSize: 15);
  /// estilos de botones
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: const EdgeInsets.all(10.0),
        minimumSize: const Size(280.0, 55.0),
        side: const BorderSide(width: 2.0, color: secondaryColor),
      );
}