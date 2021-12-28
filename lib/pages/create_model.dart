import 'package:flutter/material.dart';

class CreateModel extends StatefulWidget {
  const CreateModel({Key? key}) : super(key: key);

  @override
  _CreateModelState createState() => _CreateModelState();
}

class _CreateModelState extends State<CreateModel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          SizedBox(
            height: 70,
            child: Center(
              child: Text(
                'Nouveau modèle',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Divider(thickness: 1),
          Expanded(
            child: Center(
              child: Text('Hello world'),
            ),
          ),
        ],
      ),
    );
  }
}
