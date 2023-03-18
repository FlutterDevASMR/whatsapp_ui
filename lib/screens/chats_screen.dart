import 'package:flutter/material.dart';
import 'package:whatsapp_ui/screens/mesaage_screen.dart';
import 'package:whatsapp_ui/utils/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: lightGreen,
        child: Icon(Icons.chat),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) => ChatItemWidget(
          name: 'name$index',
        ),
        separatorBuilder: (context, index) => Divider(
          height: 0,
          thickness: 1,
        ),
      ),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  ChatItemWidget({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessageScreen(name: name),
          ),
        );
      },
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                radius: 30,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hey Im using whatsapp',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '10:30',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
