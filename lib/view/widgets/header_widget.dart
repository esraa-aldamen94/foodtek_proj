import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'notifications_bottom_sheet.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.pin_drop_outlined,
            color: Color(0xFF4FAF5A),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current location',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF606060),
                  ),
                ),
                Text(
                  'Jl. Soekarno Hatta 15A...',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xFF101010),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
                size: 18,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder:
                      (context) => NotificationsBottomSheet(
                        scrollController: ScrollController(),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
