import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/constants.dart';

import '../screens/calls_screen.dart';
import '../screens/camera_screen.dart';
import '../screens/chats_screen.dart';
import '../screens/status_screen.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        title: Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(width: 10),
        ],
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(child: Icon(Icons.camera_alt)),
            Tab(child: Text('CHATS')),
            Tab(child: Text('STATUS')),
            Tab(child: Text('CALLS')),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          CameraScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}
