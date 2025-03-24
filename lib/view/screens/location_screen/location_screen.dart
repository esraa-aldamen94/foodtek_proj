// import 'package:flutter/material.dart';
// import 'package:foodtek_project/helper/responsive.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }
//
// class _LocationScreenState extends State<LocationScreen> {
//   GoogleMapController? _mapController;
//   LatLng? selectedLocation;
//   String selectedAddress = "Select a location";
//   int selectedTabIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: true,
//       left: true,
//       child: Scaffold(
//         body: Stack(
//           clipBehavior: Clip.none, // منع قص المحتوى الخارجي
//           children: [
//             Container(
//               width: responsiveWidth(context, 430),
//               height: responsiveHeight(context, 846),
//               child: GoogleMap(
//                 initialCameraPosition: CameraPosition(
//                   target: LatLng(37.7749, -122.4194),
//                   zoom: 15,
//                 ),
//                 onMapCreated: (controller) {
//                   _mapController = controller;
//                 },
//                 onTap: (LatLng position) {
//                   setState(() {
//                     selectedLocation = position;
//                     selectedAddress =
//                     "Selected location (${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)})";
//                   });
//                 },
//                 markers: {
//                   if (selectedLocation != null)
//                     Marker(
//                       markerId: MarkerId("selectedLocation"),
//                       position: selectedLocation!,
//                       infoWindow: InfoWindow(title: "Selected Location"),
//                     ),
//                 },
//               ),
//             ),
//             Positioned(
//               top: responsiveHeight(context, 567),
//               left: responsiveWidth(context, 46),
//               child: Container(
//                 width: responsiveWidth(context, 343),
//                 height: responsiveHeight(context, 154),
//                 padding: EdgeInsets.all(responsiveHeight(context, 24)),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "your location",
//                       style: GoogleFonts.inter(
//                         fontSize: responsiveHeight(context, 12),
//                         fontWeight: FontWeight.w500,
//                         color: Color(0XFF878787),
//                         letterSpacing: -0.01,
//                         height: 1.4,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: responsiveHeight(context, 12)),
//                     Row(
//                       children: [
//                         // استخدام Container بدلاً من Positioned داخل Row
//                         Container(
//                           width: responsiveWidth(context, 15),
//                           height: responsiveHeight(context, 18.46),
//                           alignment: Alignment.center,
//                           child: Icon(
//                             Icons.location_on_outlined,
//                             color: Color(0xFF4CAF50),
//                             size: responsiveHeight(context, 18.46),
//                           ),
//                         ),
//                         SizedBox(width: responsiveWidth(context, 8)),
//                         Expanded(
//                           child: Text(
//                             selectedAddress,
//                             style: GoogleFonts.inter(
//                               fontSize: responsiveHeight(context, 12),
//                               fontWeight: FontWeight.w600,
//                               color: Color(0XFF6C7278),
//                               letterSpacing: -0.01,
//                               height: 1.4,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: responsiveHeight(context, 24)),
//                     // تغليف الزر بـ Transform.translate لتحريكه لأعلى بمقدار 4.6 بكسل
//                     Transform.translate(
//                       offset: Offset(0, -4.6),
//                       child: SizedBox(
//                         height: responsiveHeight(context, 46),
//                         width: responsiveWidth(context, 295),
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ButtonStyle(
//                             padding: MaterialStateProperty.all(EdgeInsets.zero),
//                             shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             elevation: MaterialStateProperty.all(0),
//                             backgroundColor: MaterialStateProperty.all(
//                               Color(0xFF25AE4B),
//                             ),
//                           ),
//                           child: Text(
//                             "Set Location",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.inter(
//                               fontWeight: FontWeight.w500,
//                               fontSize: responsiveHeight(context, 12),
//                               height: 1.4,
//                               letterSpacing: -0.01,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // شريط التنقل السفلي + iPhone Indicator
//         bottomNavigationBar: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             BottomAppBar(
//               shape: CircularNotchedRectangle(),
//               notchMargin: 8.0,
//               color: Color(0xFFDBF4D1),
//               child: Container(
//                 height: 60,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildNavItem(Icons.home_outlined, "Home", 0),
//                     _buildNavItem(Icons.favorite_border_outlined, "Favorites", 1),
//                     SizedBox(width: 40), // فراغ للأيقونة العائمة
//                     _buildNavItem(Icons.history_toggle_off_rounded, "History", 3),
//                     _buildNavItem(Icons.person_outline, "Profile", 4),
//                   ],
//                 ),
//               ),
//             ),
//             // iPhone Indicator
//             Container(
//               width: double.infinity,
//               height: 30,
//               color: Color(0xFFDBF4D1),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Color(0xFF25AE4B),
//           onPressed: () {},
//           child: Icon(
//             Icons.shopping_cart_outlined,
//             color: Colors.white,
//             size: 28,
//           ),
//           shape: CircleBorder(),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       ),
//     );
//   }
//
//   Widget _buildNavItem(IconData icon, String label, int index) {
//     bool isSelected = selectedTabIndex == index;
//
//     // حالة أيقونة الكارت (يمكن تعديل الشرط حسب متطلباتك)
//     if (label == "Cart" || index == 2) {
//       return GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedTabIndex = index;
//           });
//         },
//         child: Container(
//           width: responsiveWidth(context, 81.2),
//           height: responsiveHeight(context, 71),
//           padding: const EdgeInsets.only(bottom: 18),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: responsiveWidth(context, 52),
//                 height: responsiveHeight(context, 53),
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF25AE4B),
//                   border: Border.all(color: const Color(0xFFDBF4D1), width: responsiveWidth(context, 4)),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//                 child: Icon(
//                   icon,
//                   color: Colors.white,
//                 ),
//               ),
//                SizedBox(height: responsiveHeight(context, 6)),
//               Container(
//                 width: responsiveWidth(context, 34), // يمكن تعديله إذا كانت الحالة تعتمد على isSelected
//                 height: responsiveHeight(context, 16),
//                 alignment: Alignment.center,
//                 child: Text(
//                   label,
//                   style: GoogleFonts.inter(
//                     fontSize: responsiveHeight(context, 12),
//                     fontWeight: FontWeight.w500,
//                     color: const Color(0xFF25AE4B),
//                     height: 16 / 12,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedTabIndex = index;
//           });
//         },
//         child: Container(
//           width: responsiveWidth(context, 81.2),
//           height: responsiveHeight(context, 46),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // الأيقونة ثابتة بالحجم 24x24 في كلتا الحالتين
//               Container(
//                 width: responsiveWidth(context, 24),
//                 height: responsiveHeight(context, 24),
//                 alignment: Alignment.center,
//                 child: Icon(
//                   icon,
//                   color: isSelected ? const Color(0xFF25AE4B) : const Color(0xFF484C52),
//                   size: responsiveHeight(context, 24),
//                 ),
//               ),
//                SizedBox(height: responsiveHeight(context, 6)),
//               // نص التسمية مع اختلاف بالعرض والوزن حسب الحالة
//               Container(
//                 width: isSelected ? 34 : 37,
//                 height: 16,
//                 alignment: Alignment.center,
//                 child: Text(
//                   label,
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.inter(
//                     fontSize: responsiveHeight(context, 12),
//                     fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
//                     color: isSelected ? const Color(0xFF25AE4B) : const Color(0xFF484C52),
//                     height: 16 / 12,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:foodtek_project/helper/responsive.dart';

// 1. Import the convex_bottom_bar package
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../checkout_screens/checout_secreen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  LatLng? selectedLocation;
  String selectedAddress = "Select a location";

  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      child: Scaffold(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            // Google Map
            SizedBox(
              width: responsiveWidth(context, 430),
              height: responsiveHeight(context, 846),
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 15,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                },
                onTap: (LatLng position) {
                  setState(() {
                    selectedLocation = position;
                    selectedAddress =
                        "Selected location (${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)})";
                  });
                },
                markers: {
                  if (selectedLocation != null)
                    Marker(
                      markerId: const MarkerId("selectedLocation"),
                      position: selectedLocation!,
                      infoWindow: const InfoWindow(title: "Selected Location"),
                    ),
                },
              ),
            ),
            // Info card over the map
            Positioned(
              top: responsiveHeight(context, 567),
              left: responsiveWidth(context, 46),
              child: Container(
                width: responsiveWidth(context, 343),
                height: responsiveHeight(context, 154),
                padding: EdgeInsets.all(responsiveHeight(context, 24)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "your location",
                      style: GoogleFonts.inter(
                        fontSize: responsiveHeight(context, 12),
                        fontWeight: FontWeight.w500,
                        color: const Color(0XFF878787),
                        letterSpacing: -0.01,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: responsiveHeight(context, 12)),
                    Row(
                      children: [
                        Container(
                          width: responsiveWidth(context, 15),
                          height: responsiveHeight(context, 18.46),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: const Color(0xFF4CAF50),
                            size: responsiveHeight(context, 18.46),
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 8)),
                        Expanded(
                          child: Text(
                            selectedAddress,
                            style: GoogleFonts.inter(
                              fontSize: responsiveHeight(context, 12),
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFF6C7278),
                              letterSpacing: -0.01,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 16)),
                    Transform.translate(
                      offset: const Offset(0, -4.6),
                      child: SizedBox(
                        height: responsiveHeight(context, 42),
                        width: responsiveWidth(context, 295),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF25AE4B),
                            ),
                          ),
                          child: Text(
                            "Set Location",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: responsiveHeight(context, 12),
                              height: 1.4,
                              letterSpacing: -0.01,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // 3. Replace bottomNavigationBar + FAB with a ConvexAppBar
        bottomNavigationBar: Container(
          // Using a Column to keep your "iPhone Indicator" under the ConvexAppBar
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- ConvexAppBar ---
              ConvexAppBar(
                style: TabStyle.fixedCircle,
                backgroundColor: const Color(0xFFDBF4D1),
                color: const Color(0xFF484C52),
                // Inactive icons
                activeColor: const Color(0xFF25AE4B),
                // Active icon
                elevation: 2.0,
                // Define the tabs (icons + optional titles)
                items: const [
                  TabItem(icon: Icons.home_outlined, title: 'Home'),
                  TabItem(
                    icon: Icons.favorite_border_rounded,
                    title: 'Favorites',
                  ),
                  TabItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
                  TabItem(
                    icon: Icons.history_toggle_off_rounded,
                    title: 'History',
                  ),
                  TabItem(icon: Icons.person_outline, title: 'Profile'),
                ],
                // Start with whichever tab you want selected
                initialActiveIndex: 0,
                // Handle tab taps
                onTap: (int index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),

              // iPhone Indicator (optional)
              Container(
                width: double.infinity,
                height: 30,
                color: const Color(0xFFDBF4D1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
