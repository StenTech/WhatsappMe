import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//import local files
import 'pages/chats/list_chats.dart';
import 'pages/chats/chat_page.dart';

void main() {
  runApp(const MyApp());
}

// ignore: non_constant_identifier_names

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'clone WhatsApp',
      theme: ThemeData(
        // whatsApp theme
        primaryColor: const Color(0xff075e54),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'WhatsApp'),
        '/chat': (context) => const ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      //home: const MyHomePage(title: 'WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(widget.title),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  // stroke width: 0.5 photo_camera_outlined icon
                  Icons.photo_camera_outlined,
                  color: Colors.white,
                  weight: 0.5,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.groups),
                ),
                Tab(
                  text: 'Chats',
                ),
                Tab(
                  text: 'Status',
                ),
                Tab(
                  text: 'Calls',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Groups'),
              ),
              Chats(),
              Center(
                child: Text('Status'),
              ),
              Center(
                child: Text('Calls'),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).primaryColor,
            mini: true,
            child: const Icon(
              Icons.message,
              size: 20,
            ),
          )),
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ListTile(
        leading: Icon(
          Icons.archive_outlined,
          color: Theme.of(context).primaryColor,
        ),
        title: const Text('Archived'),
        onTap: () {},
      ),
      ...listChats
          .map((e) => ListTile(
                leading: GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print(e['name']);
                      }
                    },
                    child: CircleAvatar(
                      backgroundImage: AssetImage(e['avatar']),
                    )),
                title: Text(e['name']),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        e['isRead'] == true
                            ? const Icon(
                                Icons.done_all,
                                size: 15,
                                color: Colors.blue,
                              )
                            : const Icon(
                                Icons.done,
                                size: 15,
                                color: Colors.grey,
                              ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(e['message']),
                      ],
                    ),
                    //const Spacer(),
                    Row(children: [
                      e['isPinned'] == true
                          ? const Icon(
                              Icons.push_pin,
                              size: 15,
                              color: Colors.grey,
                            )
                          : const SizedBox(),
                    ])
                  ],
                ),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(e['time'], style: const TextStyle(fontSize: 9)),
                    const SizedBox(
                      height: 10,
                    ),
                    e['unreadMessageCount'] > 0
                        ? CircleAvatar(
                            radius: 7,
                            backgroundColor: Colors.green,
                            child: Center(
                              child: Text(
                                e['unreadMessageCount'].toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 9),
                              ),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/chat", arguments: e);
                },
              ))
          .toList(),
    ]);
  }
}

/*
Widget RadioI() {
    // Initialiste an empty list.
    List<Widget> radioList = List.empty(growable: true);

    for (int j = 0; j < 5; j++) {
      radioList.add(
        RadioListTile(
          value: j,
          groupValue: val1,
          onChanged: (value) {
            change1(value as int);
          },
          title: Text('Radio ${j + 1}'),
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      );
    }
    return Column(
      children: radioList,
    );
  }

  Widget checkBox() {
    List<Widget> checkList = List.empty(growable: true);

    for (int i = 0; i < 5; i++) {
      checkList.add(
        CheckboxListTile(
          value: checked[i],
          onChanged: (value) {
            setState(() {
              checked[i] = value!;
            });
          },
          title: Text('Checkbox ${i + 1}'),
        ),
      );
    }

    return Column(
      children: checkList,
    );
  }*/