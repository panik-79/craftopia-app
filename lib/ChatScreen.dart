import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String enterpriseName = "Cool Shades Inc.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat with $enterpriseName',
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle more actions here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildMessageBubble(
                  "Hello! How can I help you today?",
                  isSentByMe: false,
                ),
                _buildMessageBubble(
                  "I want to know more about the sunglasses.",
                  isSentByMe: true,
                ),
                _buildMessageBubble(
                  "Sure! We have various options available.",
                  isSentByMe: false,
                ),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String message, {required bool isSentByMe}) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.deepOrangeAccent : Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo, color: Colors.deepPurpleAccent),
            onPressed: () {
              // Handle photo upload
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.deepPurpleAccent),
            onPressed: () {
              // Handle file attachment
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.deepOrangeAccent),
            onPressed: () {
              // Handle message send
            },
          ),
        ],
      ),
    );
  }
}