import 'package:flutter/material.dart';

class VCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subtitle;
  final String amount;
  final bool isPositive;

  const VCard(
      {super.key,
      required this.icon,
      required this.amount,
      required this.subtitle,
      required this.title,
      required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(85, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.grey[200], child: Icon(Icons.history)),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(subtitle,
              style: TextStyle(color: const Color.fromARGB(255, 70, 70, 70))),
          trailing: Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isPositive ? Colors.green : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
