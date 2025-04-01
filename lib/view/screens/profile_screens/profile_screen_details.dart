import 'package:flutter/material.dart';
import 'package:foodtek_project/view/screens/profile_screens/profile_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../helper/responsive.dart';
import '../../../helper/validation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../location_screen/delivery_tracking_screen.dart';
import '../ordering_screens/cart_history_screen.dart';
import '../ordering_screens/favorites_screen.dart';
import '../ordering_screens/home_screen.dart';

class ProfileScreenDetails extends StatefulWidget {
  @override
  _ProfileScreenDetailsState createState() => _ProfileScreenDetailsState();
}

class _ProfileScreenDetailsState extends State<ProfileScreenDetails> {
  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController addressTextEditingController =
      TextEditingController();
  Validation validation = Validation();
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
  void initState() {
    super.initState();
    userNameTextEditingController.text = 'Ahmad Daboor';
    emailTextEditingController.text = 'Loisbecket@gmail.com';
    phoneTextEditingController.text = '079765394';
    addressTextEditingController.text = '123 Al-Madina Street, Abdali,..';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0XFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xFF391713),
          iconSize: responsiveHeight(context, 20),
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => DeliveryTrackingScreen()),
            // );
          },
        ),
        toolbarHeight: 50,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: responsiveHeight(context, 20),
            fontWeight: FontWeight.w600,
            color: Color(0xFF391713),
            letterSpacing: 0.0,
            height: 1.0,
          ),
        ),
        titleSpacing: 0.0,
        leadingWidth: responsiveWidth(context, 40),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildUserProfileHeader(context),
            SizedBox(height: responsiveHeight(context, 20)),
            Center(
              child: Container(
                width: responsiveWidth(context, 380),
                height: responsiveHeight(context, 416),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFF5F5F5), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1F000000),
                      blurRadius: 15,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildInputField('Username', userNameTextEditingController),
                    SizedBox(height: responsiveHeight(context, 9)),
                    _buildInputField('Email', emailTextEditingController),
                    SizedBox(height: responsiveHeight(context, 9)),
                    _buildInputField(
                      'Phone Number',
                      phoneTextEditingController,
                    ),
                    SizedBox(height: responsiveHeight(context, 9)),
                    passwordInputField('Password', '*', obscureText: true),
                    SizedBox(height: responsiveHeight(context, 9)),
                    _buildInputField(
                      'Address',
                      addressTextEditingController,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: responsiveHeight(context, 50)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                // Remove default button styling
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0, // Remove default elevation
              ),
              child: Container(
                width: responsiveWidth(context, 295),
                height: responsiveHeight(context, 48),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF25AE4B),
                      Color(0xFF25AE4B),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      letterSpacing: -1,
                      height: 1.4,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
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

  Widget _buildInputField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            color: Color(0xFF6C7278),
            fontSize: responsiveHeight(context, 12),
            fontWeight: FontWeight.w500,
            height: 1.6,
            letterSpacing: -0.02,
          ),
        ),
        SizedBox(height: responsiveHeight(context, 2)),
        Container(
          width: responsiveWidth(context, 356),
          height: responsiveHeight(context, 46),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFEDF1F3), width: 1),
            boxShadow: [
              BoxShadow(
                color: Color(0x3DE4E5E7),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            maxLines: maxLines,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: responsiveHeight(context, 14),
              color: Color(0XFF1A1C1E),
              height: 1.4,
              letterSpacing: -0.01,
            ),
            decoration: InputDecoration(
              hintText: label,
              hintStyle: GoogleFonts.plusJakartaSans(
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
    );
  }

  Widget passwordInputField(
    String? hintText,
    String obscuringCharacter, {
    required bool obscureText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "password",
          style: GoogleFonts.plusJakartaSans(
            color: const Color(0xFF6C7278),
            fontSize: responsiveHeight(context, 12),
            letterSpacing: -0.02,
            height: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Container(
          width: responsiveWidth(context, 356),
          height: responsiveHeight(context, 46),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFEDF1F3), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3DE4E5E7),
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: TextField(
            obscureText: validation.obscureTextPassword,
            obscuringCharacter: obscuringCharacter,
            controller: validation.passwordTextEditingController,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              height: 1.4,
              letterSpacing: -0.01,
              color: const Color(0xFF1A1C1E),
            ),
            decoration: InputDecoration(
              hintText:
                  hintText ?? AppLocalizations.of(context)!.enterYourPassword,
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey[500],
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 13),
                vertical: responsiveHeight(context, 14),
              ),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  validation.obscureTextPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: const Color(0XFFACB5BB),
                  size: 12,
                ),
                onPressed: () {
                  setState(() {
                    validation.changeObscureTextPassword();
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserProfileHeader(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            Icons.person,
            size: responsiveHeight(context, 60),
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Ahmad Daboor',
          style: GoogleFonts.inter(
            fontSize: responsiveHeight(context, 16),
            fontWeight: FontWeight.w500,
            color: Color(0xFF1B1B1B),
          ),
        ),
        SizedBox(height: 2),
        Text(
          'ahmad1709@gmail.com',
          style: GoogleFonts.inter(
            color: Colors.grey,
            fontSize: responsiveHeight(context, 14),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    userNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    phoneTextEditingController.dispose();
    passwordTextEditingController.dispose();
    addressTextEditingController.dispose();
    super.dispose();
  }
}
