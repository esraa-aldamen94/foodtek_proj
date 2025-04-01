import 'package:flutter/material.dart';
import 'package:foodtek_project/helper/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

import '../location_screen/delivery_tracking_screen.dart';
import '../ordering_screens/cart_history_screen.dart';
import '../ordering_screens/favorites_screen.dart';
import '../ordering_screens/home_screen.dart';
import '../profile_screens/profile_screen.dart';
import 'order_done_successfully_screen.dart';

class AddCardScreen extends StatefulWidget {
  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController nameTextEditingController =
      TextEditingController();

  final TextEditingController cardNumberTextEditingController =
      TextEditingController();

  final TextEditingController expiryTextEditingController =
      TextEditingController();

  final TextEditingController cvvTextEditingController =
      TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_outlined, color: Colors.black),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: responsiveHeight(context, 26)),
                Text(
                  'Add Card',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF391713),
                    fontSize: responsiveHeight(context, 20),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    height: 1.0,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 24)),
                Image.asset('assets/images/addcard.png'),

                SizedBox(height: responsiveHeight(context, 16)),

                Text(
                  'Name',
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0XFF6C7278),
                    fontSize: responsiveHeight(context, 12),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.02,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 2)),
                Container(
                  width: responsiveWidth(context, 295),
                  height: responsiveHeight(context, 46),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFEDF1F3),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3DE4E5E7),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: nameTextEditingController,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0XFF1A1C1E),
                      height: 1.4,
                      letterSpacing: -0.01,
                    ),
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: responsiveHeight(context, 14),
                        color: Colors.grey[500],
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 13),
                        vertical: responsiveHeight(context, 14),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: responsiveHeight(context, 16)),

                Text(
                  'Card Number',
                  style: GoogleFonts.plusJakartaSans(
                    color: Color(0XFF6C7278),
                    fontSize: responsiveHeight(context, 12),
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.02,
                    height: 1.6,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 2)),
                Container(
                  width: responsiveWidth(context, 295),
                  height: responsiveHeight(context, 46),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xFFEDF1F3),
                      width: 1,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3DE4E5E7),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: cardNumberTextEditingController,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0XFF1A1C1E),
                      height: 1.4,
                      letterSpacing: -0.01,
                    ),
                    decoration: InputDecoration(
                      hintText: '',
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: responsiveHeight(context, 14),
                        color: Colors.grey[500],
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 13),
                        vertical: responsiveHeight(context, 14),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: responsiveHeight(context, 16)),

                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiry',
                            style: GoogleFonts.plusJakartaSans(
                              color: Color(0XFF6C7278),
                              fontSize: responsiveHeight(context, 12),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.02,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 2)),
                          Container(
                            width: responsiveWidth(context, 176),
                            height: responsiveHeight(context, 46),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFEDF1F3),
                                width: 1,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3DE4E5E7),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: cardNumberTextEditingController,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0XFF1A1C1E),
                                height: 1.4,
                                letterSpacing: -0.01,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: responsiveHeight(context, 14),
                                  color: Colors.grey[500],
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context, 13),
                                  vertical: responsiveHeight(context, 14),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: responsiveWidth(context, 7)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style: GoogleFonts.plusJakartaSans(
                              color: Color(0XFF6C7278),
                              fontSize: responsiveHeight(context, 12),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.02,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(height: responsiveHeight(context, 2)),
                          Container(
                            width: responsiveWidth(context, 176),
                            height: responsiveHeight(context, 46),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFEDF1F3),
                                width: 1,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3DE4E5E7),
                                  offset: Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: cardNumberTextEditingController,
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0XFF1A1C1E),
                                height: 1.4,
                                letterSpacing: -0.01,
                              ),
                              decoration: InputDecoration(
                                hintText: '',
                                hintStyle: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: responsiveHeight(context, 14),
                                  color: Colors.grey[500],
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context, 13),
                                  vertical: responsiveHeight(context, 14),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 16)),

                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'We will send you an order details to your\nemail after the successful payment',
                    style: GoogleFonts.inter(
                      color: Color(0XFF929DA9),
                      fontSize: responsiveHeight(context, 12),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),

                SizedBox(height: responsiveHeight(context, 16)),

                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: responsiveWidth(context, 327),
                    height: responsiveHeight(context, 57),
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDoneSuccessfullyScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25AE4B),
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 22),
                          vertical: responsiveHeight(context, 18),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/icons/lock.png"),
                          SizedBox(width: responsiveWidth(context, 16)),
                          Text(
                            "Pay for the order",
                            style: GoogleFonts.inter(
                              fontSize: responsiveHeight(context, 18),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              height: 1.0,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
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
      ),
    );
  }
}
