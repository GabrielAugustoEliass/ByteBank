import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService extends GetxService {
  final TextEditingController controllerName = TextEditingController();

  RxList<String> contatos = <String>[].obs;

  salvarUsuario(String value) async {
    final prefs = await SharedPreferences.getInstance();
    contatos.add(value);
    prefs.setStringList('usuarios', contatos);
  }

  incrementarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final usuariosSalvos = prefs.getStringList('usuarios') ?? [];
    contatos = usuariosSalvos.obs;
    await prefs.setStringList('usuarios', contatos);
  }

  removerUsuarioDaLista(String usuario) async {
    final prefs = await SharedPreferences.getInstance();
    contatos.remove(usuario);
    await prefs.setStringList('usuarios', contatos);
  }
}
