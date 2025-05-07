import 'package:flutter/material.dart';

class AppColors {
  // Cores principais
  static const primary = Color(0xFF7199a6); // Azul principal
  // static const primary = Color(0xFF5ebf78); // Azul principal
  static const accent = Color(0xFF42A5F5); // Azul para destaque
  static const secondary = Color(0xFF0288D1); // Azul secundário para uso geral

  // Cores de fundo
  static const backgroundLight = Color(0xFFF3F4F6); // mais suave que branco
  static const backgroundDark =
      Color(0xFF1E1E1E); // mais confortável que preto puro

  // Cores de texto
  static const text = Color(0xFF212121); // Texto escuro
  static const textLight = Colors.white70; // Texto claro para tema escuro
  static const textDark = Color(0xFF121212); // Texto escuro para tema claro
  static const textSecondary =
      Color(0xFF757575); // Texto secundário, menos importante

  // Cores de bordas e divisores
  static const divider = Color(0xFFBDBDBD); // Cor de divisores entre elementos
  static const border = Color(0xFFDDDDDD); // Cor para bordas de inputs, etc.

  // Cores de estados (erro, sucesso, alerta)
  static const error = Colors.red; // Cor para mensagens de erro
  static const success = Colors.green; // Cor para mensagens de sucesso
  static const warning = Colors.orange; // Cor para mensagens de alerta
  static const info = Colors.blueAccent; // Cor para informações gerais

  // Outras cores
  static const shadow = Color(0x66000000); // Sombra suave
  static const iconColor = Color(0xFF8A8A8A); // Cor dos ícones
  static const buttonText = Colors.black; // Cor do texto dos botões
  static const disabled = Color(0xFFBDBDBD); // Cor para elementos desativados
}
