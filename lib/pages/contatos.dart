import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  final TextEditingController controllerName = TextEditingController();

  List<String> contatos = [];

  Future<void> salvarUsuario(String value) async {
    final prefs = await SharedPreferences.getInstance();
    contatos.add(value);
    prefs.setStringList('usuarios', contatos);
    setState(() {});
  }

  Future<void> incrementarUsuario() async {
    final prefs = await SharedPreferences.getInstance();
    final usuariosSalvos = prefs.getStringList('usuarios') ?? [];
    setState(() {
      contatos = usuariosSalvos;
    });
    await prefs.setStringList('usuarios', contatos);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      incrementarUsuario();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: TextFormField(
                controller: controllerName,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                ),
              ),
              content: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                ),
                onPressed: () async {
                  salvarUsuario(controllerName.text);
                  Get.back();
                },
                child: const Text('Salvar'),
              ),
            ),
          );
        },
        child: const Icon(Icons.person_add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, top: 7, bottom: 5),
            child: Card(
              elevation: 3,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/personimage.png',
                  ),
                ),
                title: Text(
                  contatos[index],
                  style: const TextStyle(fontSize: 19),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
