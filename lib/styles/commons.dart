import 'package:flutter/material.dart';

abstract class Commons {
  /// colores
  static const primaryColor = Colors.deepPurple;
  static const secondaryColor = Color(0xFFFFC107);
  static const primaryTextColor = Color(0xFF000000);
  static const secondaryTextColor = Colors.white;
  static const backgroundColor = Color(0xFFF5F5F5);

  /// Tipografias
  static const fontPrincipal = 'Ubuntu';
  static const fontSecondary = 'Iceberg';
  /// estilo de textos
  static const textTitle = TextStyle(color: primaryTextColor, fontFamily: 'Iceberg', fontSize: 60);
  static const textSubTitle = TextStyle(color: secondaryTextColor, fontSize: 15);
  static const textCard = TextStyle(color: primaryTextColor, fontSize: 15);
  static const textButtons = TextStyle(color: primaryTextColor, fontSize: 15);
  static const textButtonsFocus = TextStyle(color: secondaryTextColor, fontSize: 16, fontWeight: FontWeight.bold,);
  /// estilos de botones
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        primary: Colors.transparent,
        padding: const EdgeInsets.all(10.0),
        minimumSize: const Size(280.0, 55.0),
        side: const BorderSide(width: 2.0, color: secondaryColor),
      );
}