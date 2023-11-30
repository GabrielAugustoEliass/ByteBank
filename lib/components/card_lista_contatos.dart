import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/shared_preferences_service.dart';

class CardListaContatos extends StatefulWidget {
  final SharedPreferencesService prefs;
  const CardListaContatos({Key? key, required this.prefs}) : super(key: key);

  @override
  State<CardListaContatos> createState() => _CardListaContatosState();
}

class _CardListaContatosState extends State<CardListaContatos> {
  @override
  Widget build(BuildContext context) {
    return widget.prefs.contatos.isEmpty
        ? const Center(
            child: Text(
              'A sua lista de contatos esta vázia',
              style: TextStyle(fontSize: 19),
            ),
          )
        : Obx(
            () => ListView.builder(
              itemCount: widget.prefs.contatos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 10, left: 10, top: 7, bottom: 5),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          widget.prefs.removerUsuarioDaLista(
                              widget.prefs.contatos[index]);
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                      leading: const CircleAvatar(
                        backgroundImage: AssetImage(
                          'images/personimage.png',
                        ),
                      ),
                      title: Text(
                        widget.prefs.contatos[index],
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
