import 'package:flutter/material.dart';
import 'package:lab/models/exercise.dart';

import '../../theme/custom.dart';
import '../../mocks/exercises.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _queryController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Exercise> matchingExercises = exercises;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.darkTheme.backgroundColor,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: TextField(
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  controller: _queryController,
                  onChanged: (String text) {
                    setState(() {
                      matchingExercises = exercises
                          .where(
                            (ex) => ex.name
                                .toLowerCase()
                                .contains(_queryController.text.toLowerCase()),
                          )
                          .toList();
                    });
                  },
                  decoration: const InputDecoration(
                    fillColor: Color(0xff1C2C48),
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Rechercher un exercice',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  focusNode: _focusNode,
                ),
              ),
              IconTheme(
                data: IconThemeData(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 450,
                  child: ListView.builder(
                    itemCount: matchingExercises.length,
                    itemBuilder: (context, i) {
                      Exercise ex = matchingExercises[i];
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Image.asset('assets/${ex.img}.png'),
                              title: Text(ex.name),
                              subtitle: Text('${ex.duration} min'),
                              trailing: TextButton(
                                child: const Text('TUTORIEL VIDEO'),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
