import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For social icons

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween, // Aligns text on left & icons on right
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// **Copyright Text**
          const Flexible(
            // Prevents overflow in small screens
            child: Text(
              "© 2025 Antmore Labs Pvt Ltd.\nAll rights reserved.",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),

          /// **Social Icons**
          Row(
            children: [
              const FaIcon(FontAwesomeIcons.github, size: 15),
              const SizedBox(width: 10),
              const FaIcon(FontAwesomeIcons.twitter, size: 15),
              const SizedBox(width: 10),
              const FaIcon(FontAwesomeIcons.youtube, size: 15),
            ],
          ),
        ],
      ),
    );
  }
}
