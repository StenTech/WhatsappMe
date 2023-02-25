// Genereating a static list of chats with a listview builder for exporting to a json file
/* 
map {
  avatar: 'assets/images/avatar{index}.jpg',
  name: {persone_name},
  message: {last_message},
  time: {time},
  isRead: {true/false},
  isGroup: {true/false},
  isPinned: {true/false},
  unreadMessageCount: {number_of_unread_messages},
}

randomly generate a list of 25 maps with the above structure and export it to a json file
random name
random last message
random time
random isRead
random isGroup
random isPinned
random unreadMessageCount
*/

List<Map<String, dynamic>> listChats = [
  {
    "avatar": 'assets/images/avatar1.jpg',
    "name": 'John Doe',
    "message": 'Hello, how are you?',
    "time": '10:00',
    "isRead": true,
    "isGroup": false,
    "isPinned": true,
    "unreadMessageCount": 0,
  },
  {
    "avatar": 'assets/images/avatar2.jpg',
    "name": "Sara Quinn",
    "message": "I'm fine, thanks",
    "time": '12:21',
    "isRead": false,
    "isGroup": false,
    "isPinned": true,
    "unreadMessageCount": 5,
  },
  {
    "avatar": 'assets/images/avatar3.jpg',
    "name": "Herbert Smith",
    "message": "where are you?",
    "time": '09:00',
    "isRead": false,
    "isGroup": false,
    "isPinned": true,
    "unreadMessageCount": 1,
  },
  {
    "avatar": 'assets/images/avatar4.jpg',
    "name": "Alexandra Usher",
    "message": "are you coming to the party?",
    "time": '12:21',
    "isRead": true,
    "isGroup": true,
    "isPinned": false,
    "unreadMessageCount": 2,
  },
  {
    "avatar": 'assets/images/avatar5.jpg',
    "name": "William Anderson",
    "message": "I'm fine, thanks",
    "time": '17:24',
    "isRead": true,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 6,
  },
  {
    "avatar": 'assets/images/avatar6.jpg',
    "name": "Yasmin Fawaz",
    "message": "I'm fine, thanks",
    "time": '12:21',
    "isRead": false,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 1,
  },
  {
    "avatar": 'assets/images/avatar7.jpg',
    "name": "Sara Quinn",
    "message": "very good",
    "time": '02:21',
    "isRead": true,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 1,
  },
  {
    "avatar": 'assets/images/avatar8.jpg',
    "name": "Sara Quinn",
    "message": "I'm fine, thanks",
    "time": '12:21',
    "isRead": false,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 0,
  },
  {
    "avatar": 'assets/images/avatar9.jpg',
    "name": "Sara Quinn",
    "message": "I Love you so much",
    "time": '12:21',
    "isRead": false,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 3,
  },
  {
    "avatar": 'assets/images/avatar10.jpg',
    "name": "Sara Quinn",
    "message": "Do you want to go to the cinema?",
    "time": '12:21',
    "isRead": false,
    "isGroup": false,
    "isPinned": false,
    "unreadMessageCount": 0,
  },
];
