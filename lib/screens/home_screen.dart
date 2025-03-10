import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reward_task/widgets/footer_widget.dart';
import '../models/product_model.dart';
import '../models/voucher_model.dart';
import '../widgets/pagination_ui.dart';
import '../widgets/product_tile.dart';
import '../widgets/voucher_tile.dart';
import '../utils/app_strings.dart';
import '../utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isProductSelected = true;
  int currentPage = 1;
  int itemsPerPage = 5;
  final String imageUrl = "https://avatars.githubusercontent.com/u/583231?v=4";
  final List<Product> products = [
    Product(
      name: "Raycon RB Headphones",
      image:
          "https://img.freepik.com/free-psd/3d-blue-headphones-isolated-transparent-background_191095-16409.jpg",
      description: "High quality sound",
      price: 189,
    ),
    Product(
      name: "Yoto Max CH4",
      image:
          "https://w7.pngwing.com/pngs/969/417/png-transparent-red-beats-by-dr-dre-wireless-headphones-headphones-beats-electronics-microphone-sound-disc-jockey-headphone-electronics-recording-studio-musician-thumbnail.png",
      description: "Kids Headphones",
      price: 109,
    ),
    Product(
      name: "Audionic Earphones",
      image:
          "https://img.freepik.com/free-psd/3d-blue-headphones-isolated-transparent-background_191095-16409.jpg",
      description: "High Fidelity Audio",
      price: 119,
    ),
  ];

  final List<Voucher> vouchers = [
    Voucher(
      title: "\$50 Amazon Gift Card",
      description: "Shop on Amazon",
      coins: 500,
    ),
    Voucher(
      title: "1-Month Netflix Premium",
      description: "Enjoy unlimited streaming",
      coins: 400,
    ),
    Voucher(
      title: "\$25 Starbucks Card",
      description: "Get coffee and snacks",
      coins: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Image.asset('assets/logo.png', width: 100),
        actions: [
          Row(
            children: [
              Icon(Icons.notifications_outlined),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Aditya Tripathi",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Coins, 2000",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imageUrl),
                child: imageUrl.isEmpty ? Icon(Icons.person, size: 20) : null,
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30.0,
              children: [
                Text("Dashboard", style: TextStyle(fontSize: 12)),
                Text("Creator", style: TextStyle(fontSize: 12)),
                Text("Rewards", style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi Aditya",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(Iconsax.localfire, size: 15),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.asset('assets/fire.png'),
                      ),
                      Text(
                        "65 days streak",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              AppStrings.redeemCoins,
              style: AppStyles.heading.copyWith(fontSize: 18),
            ),
            Text(
              AppStrings.redeemDescription,
              style: AppStyles.subheading.copyWith(fontSize: 12),
            ),
            SizedBox(height: 12),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Iconsax.coin, size: 15),
                    Text(
                      "1,250 coins",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search product",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                          ), // Adjust padding
                        ),
                      ),
                    ),
                    Center(child: Icon(Icons.search, color: Colors.grey)),
                  ],
                ),
              ),
            ),

            ToggleButtons(
              borderRadius: BorderRadius.circular(30), // Rounded shape
              borderColor: Colors.grey.shade400, // Border for unselected tabs

              isSelected: [isProductSelected, !isProductSelected],
              constraints: BoxConstraints(minHeight: 30),
              onPressed: (index) {
                setState(() => isProductSelected = index == 0);
              },
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color:
                        isProductSelected
                            ? Colors.white
                            : Colors.grey.shade300, // Dynamic fill color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    AppStrings.productsTab,
                    style: TextStyle(
                      color:
                          isProductSelected
                              ? Colors.black
                              : Colors.black54, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color:
                        !isProductSelected
                            ? Colors.white
                            : Colors.grey.shade300, // Dynamic fill color
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    AppStrings.vouchersTab,
                    style: TextStyle(
                      color:
                          !isProductSelected
                              ? Colors.black
                              : Colors.black54, // Text color
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount:
                    (isProductSelected ? products.length : vouchers.length) +
                    1, // +1 for pagination & footer
                itemBuilder: (context, index) {
                  if (index ==
                      (isProductSelected ? products.length : vouchers.length)) {
                    return Column(
                      mainAxisSize:
                          MainAxisSize
                              .min, // Ensures content does not stretch unnecessarily
                      children: [
                        const PaginationWidget(),
                        const FooterWidget(),
                      ],
                    ); // Show pagination & footer at the end
                  }
                  return isProductSelected
                      ? Center(child: Text("no data"))
                      : Center(child: Text("no text"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
