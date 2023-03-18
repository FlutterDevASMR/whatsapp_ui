import 'package:flutter/material.dart';
import 'dart:math';

import 'package:whatsapp_ui/utils/constants.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: lightGreen,
        child: Icon(Icons.add_call),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) => CallItemWidget(name: 'name$index'),
        separatorBuilder: (context, index) => Divider(
          height: 0,
          thickness: 1,
        ),
      ),
    );
  }
}

class CallItemWidget extends StatelessWidget {
  CallItemWidget({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    bool booleanResult1 = Random().nextBool();
    bool booleanResult2 = Random().nextBool();
    bool booleanResult3 = Random().nextBool();
    return ListTile(
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
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
                  Row(
                    children: [
                      Icon(
                        booleanResult2 ? Icons.call_made : Icons.call_received,
                        color: booleanResult3 ? Colors.green : Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Yesterday, 10:30',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Icon(
              booleanResult1 ? Icons.call : Icons.videocam,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
