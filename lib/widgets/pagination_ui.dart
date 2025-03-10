import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// **Previous Button**
          InkWell(
            onTap: null, // Disabled for now
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios, size: 14, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  "Previous",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Spacing
          /// **Page Numbers (Only Numbers, No Styling)**
          for (int i = 1; i <= 3; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '$i',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Simple black text
                ),
              ),
            ),

          /// **Ellipsis (...)**
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              "...",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          const SizedBox(width: 16), // Spacing
          /// **Next Button**
          InkWell(
            onTap: null, // Disabled for now
            child: Row(
              children: const [
                Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
