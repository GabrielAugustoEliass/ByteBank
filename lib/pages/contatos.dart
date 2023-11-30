import 'package:bytebank/controller/shared_preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/card_lista_contatos.dart';

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final SharedPreferencesService _prefs = Get.put(SharedPreferencesService());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _prefs.incrementarUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          showAddUsuario(context);
        },
        child: const Icon(Icons.person_add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Contatos'),
      ),
      body: CardListaContatos(
        prefs: _prefs,
      ),
    );
  }

  Future<dynamic> showAddUsuario(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Form(
        key: _formKey,
        child: AlertDialog(
          title: const Text('Adicionar um usuário'),
          content: TextFormField(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Por favor. Insira um nome para o usuário';
              } else {
                return null;
              }
            },
            controller: _prefs.controllerName,
            decoration: const InputDecoration(
              labelText: 'Nome Completo',
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                  ),
                  onPressed: () async {
                    Get.back();
                  },
                  child: const Text('Não'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        _prefs.salvarUsuario(_prefs.controllerName.text);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green[900],
                          content: Text('Usuário: ${_prefs.contatos} salvo'),
                        ),
                      );
                      _prefs.controllerName.clear();
                      Get.back();
                    } else {
                      return;
                    }
                  },
                  child: const Text('Salvar'),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
