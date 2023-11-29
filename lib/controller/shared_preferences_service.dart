import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final TextEditingController controllerName = TextEditingController();

  List<String> contatos = [];

  Future<void> salvarUsuario(String value) async {
    final prefs = await SharedPreferences.getInstance();
    contatos.add(value);
    prefs.setStringList('usuarios', contatos);
  }

  Future<void> incrementarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final usuariosSalvos = prefs.getStringList('usuarios') ?? [];
    contatos = usuariosSalvos;
    await prefs.setStringList('usuarios', contatos);
  }
}
