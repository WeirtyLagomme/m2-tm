import 'package:flutter/material.dart';

class CreateSeance extends StatefulWidget {
  const CreateSeance({Key? key}) : super(key: key);

  @override
  _CreateSeanceState createState() => _CreateSeanceState();
}

class _CreateSeanceState extends State<CreateSeance> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                'Nouvelle séance',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: Center(
              child: Text('Nouvelle séance'),
            ),
          ),
        ],
      ),
    );
  }
}
