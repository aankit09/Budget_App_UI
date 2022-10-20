import 'package:budget_app/theme/colors.dart';
import 'package:flutter/material.dart';

class TransferMoney extends StatefulWidget {
  const TransferMoney({super.key});

  @override
  State<TransferMoney> createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: const Text(
        'Loading',
        style: TextStyle(color: black),
      )),
    );
  }
}
