import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/responsive.dart';
import '../location_screen/delivery_tracking_screen.dart';
import '../ordering_screens/cart_history_screen.dart';
import '../ordering_screens/favorites_screen.dart';
import '../ordering_screens/home_screen.dart';
import '../profile_screens/profile_screen.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedIndex = 2;

  void onItemTapped(int index) {
    Widget nextScreen;

    switch (index) {
      case 0:
        nextScreen = HomeScreen();
        break;
      case 1:
        nextScreen = FavoritesScreen();
        break;
      case 3:
        nextScreen = DeliveryTrackingScreen();
        break;
      case 4:
        nextScreen = ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );

    setState(() {
      selectedIndex = index;
    });
  }

  final List<ChatMessage> _messages = [
    ChatMessage(text: 'Hello chatGPT, how are you today?', isUserMessage: true),
    ChatMessage(
      text: 'Hello, I\'m fine. How can I help you?',
      isUserMessage: false,
    ),
    ChatMessage(
      text: 'What is the best programming language?',
      isUserMessage: true,
    ),
    ChatMessage(
      text:
          'There are many programming languages in the market that are used in designing and building websites, various applications and other tasks. All these languages are popular in their place and in the way they are used, and many programmers learn and use them.',
      isUserMessage: false,
    ),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF391713),
          iconSize: responsiveHeight(context, 20),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DeliveryTrackingScreen()),
            );
          },
        ),
        title: Text(
          'Chat',
          style: GoogleFonts.inter(
            fontSize: responsiveHeight(context, 20),
            fontWeight: FontWeight.w600,
            color: Color(0xFF391713),
            letterSpacing: 0.0,
            height: 1.0,
          ),
        ),
        titleSpacing: 0.0,
        toolbarHeight: kToolbarHeight,
        leadingWidth: responsiveWidth(context, 40),
      ),
      body: Column(
        children: [
          Divider(color: Color(0xFFECECEC), thickness: 1),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageItem(_messages[index]);
              },
            ),
          ),
          _buildMessageInputArea(),
          SizedBox(height: responsiveHeight(context, 40)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        materialTapTargetSize: MaterialTapTargetSize.padded,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartHistoryScreen()),
          );
        },
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: responsiveHeight(context, 24),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: Color(0xFFDBF4D1),
        child: Padding(
          padding: EdgeInsets.only(bottom: responsiveHeight(context, 10)),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: Color(0XFF25AE4B),
            unselectedItemColor: Color(0XFF484C52),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_rounded),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes),
                label: 'Track',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(ChatMessage message) {
    return Align(
      alignment:
          message.isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUserMessage ? Color(0xFF25AE4B) : Color(0xFFEEEEEE),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft:
                message.isUserMessage
                    ? Radius.circular(25)
                    : Radius.circular(0),
            bottomRight:
                message.isUserMessage
                    ? Radius.circular(0)
                    : Radius.circular(25),
          ),
        ),
        child: Text(
          message.text,
          style: GoogleFonts.nunito(
            fontSize: responsiveHeight(context, 13),
            fontWeight: FontWeight.w700,
            height: 1.3,
            letterSpacing: 0.0,
            color:
                message.isUserMessage
                    ? Color(0xFFFFFFFF)
                    : Color(
                      0xFF505050,
                    ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInputArea() {
    return Container(
      width: responsiveWidth(context, 333),
      height: responsiveHeight(context, 56),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            offset: Offset(5, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Write your message',
                hintStyle: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  height: 1.0,
                  color: Color(0xFF9E9E9E),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 10)),
          CircleAvatar(
            radius: responsiveHeight(context, 20),
            backgroundColor: Color(0xFFFFFFFF),
            child: IconButton(
              icon: Icon(Icons.send, color: Color(0xFF25AE4B)),
              onPressed: () {
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}
