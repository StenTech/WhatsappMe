import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:gotest/discussion.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> datas =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          titleSpacing: 0,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(datas['avatar']),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print('ChatPage: ${datas['name']}');
                    }
                    /*Navigator.pushNamed(context, '/discussion',
                      arguments: {'name': datas['name']});*/
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Le nom de l'utilisateur
                      Text(
                        datas['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Le statut de connexion de l'utilisateur
                      const Text(
                        'En ligne',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(7),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Message(
                content: messages[index]['content'],
                date: messages[index]['time'],
                me: messages[index]['emitter'],
              );
            },
            itemCount: messages.length,
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tapez un message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attach_file),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_alt),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.content,
    required this.date,
    required this.me,
  });

  final String content;
  final String date;
  final String me;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 0.3,
        color: me == 'me' ? Colors.green[100] : Colors.white,
        shape: me == 'me'
            ? RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                side: BorderSide(
                  color: Colors.grey[300] as Color,
                  width: 0.0,
                ),
              )
            : RoundedRectangleBorder(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                side: BorderSide(
                  color: Colors.grey[300] as Color,
                  width: 1.0,
                ),
              ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(fontSize: 16.0),
                  softWrap: true,
                ),
                const SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
