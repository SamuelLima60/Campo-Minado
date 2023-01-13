import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function()? onReiniciar;

  const ResultadoWidget({
    this.venceu,
    this.onReiniciar,
    Key? key,
  }) : super(key: key);

  Color _pegarCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _pegarIcone() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu!) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _pegarCor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onReiniciar,
              icon: Icon(
                _pegarIcone(),
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
