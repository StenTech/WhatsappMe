import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
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
              return Row(
                mainAxisAlignment: messages[index]['emitter'] == 'me'
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Message(
                    content: messages[index]['content'],
                    date: messages[index]['time'],
                    me: messages[index]['emitter'],
                  ),
                ],
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
        //alignment: me == 'me' ? Alignment.centerRight : Alignment.centerLeft,
        //width: 10,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ChatBubble(
          elevation: 0.5,
          //alignment: Alignment.centerLeft,
          backGroundColor: me == 'me' ? Colors.green[200] : Colors.white70,
          clipper: me == 'me'
              ? ChatBubbleClipper1(type: BubbleType.sendBubble)
              : ChatBubbleClipper1(type: BubbleType.receiverBubble),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              //me == 'me' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  content,
                  style: const TextStyle(height: 1.5, fontSize: 15),
                  //style: const TextStyle(color: Colors.white),
                  //softWrap: true,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
