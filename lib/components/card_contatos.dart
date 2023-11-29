import 'package:bytebank/pages/contatos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardContatos extends StatelessWidget {
  const CardContatos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(const Contatos());
        },
        child: Container(
          width: 130,
          height: 95,
          decoration: BoxDecoration(
            color: Colors.green[900],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                Text(
                  'Contatos',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
