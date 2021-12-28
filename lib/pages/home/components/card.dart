import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import '../../../theme/custom.dart';
import '../../../models/user.dart';

class HomeCard extends StatefulWidget {
  HomeCard({
    Key? key,
    required this.user,
    required this.title,
  }) : super(key: key);

  final String title;
  final User user;

  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {

  bool isFavorite = false;
  bool isLiked = false;

  String favorites = '${Random().nextInt(5)}.${Random().nextInt(10)}/5';
  String likes = '${Random().nextInt(1000)}k';
  String comments = '${Random().nextInt(1000)}k';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CustomTheme.darkTheme.primaryColorLight,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.user.pictureUrl),
            ),
            title: Row(
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  '@${widget.user.username}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('d/M/y H:m').format(DateTime.now()),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            subtitle: const Text(
              'A créé un nouveau modèle',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Card(
            color: CustomTheme.darkTheme.backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: CustomTheme.darkTheme.primaryColorLight,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text(
                    'Séance push',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    DateFormat('d MMMM y').format(DateTime.now()),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.zero,
                    onSelected: (value) => {},
                    itemBuilder: (context) => <PopupMenuItem<String>>[
                      const PopupMenuItem<String>(
                        value: 'save-model',
                        child: Text('Enregistrer dans vos modèles'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'create-model-from-model',
                        child: Text('Créer un modèle à partir de celui-ci'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'start-seance-from-model',
                        child:
                            Text('Démarrer une séance à partir de ce modèle'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                    color: isFavorite ? Colors.amber : Colors.grey,
                    icon: Icon(isFavorite ? Icons.star_outlined : Icons.star_border),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  Text(
                    favorites,
                    style: TextStyle(
                      color: isFavorite ? Colors.amber : Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: isLiked ? Colors.pink : Colors.grey,
                    icon: Icon(isLiked ? Icons.favorite_outlined : Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                  Text(
                    likes,
                    style: TextStyle(
                      color: isLiked ? Colors.pink : Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: Colors.grey,
                    icon: const Icon(Icons.comment_outlined),
                    onPressed: () {},
                  ),
                  Text(
                    comments,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
