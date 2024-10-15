import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class PhonePeHomeScreen extends StatefulWidget {
  @override
  State<PhonePeHomeScreen> createState() => _PhonePeHomeScreenState();
}

class _PhonePeHomeScreenState extends State<PhonePeHomeScreen> {
  List<String> items = [
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/45d2e8cad38ba5e4.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/5dcc1f2ca3969ab4.png?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/f39cd50df3682fa7.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/aa1b2bdcf519b468.jpg?q=100",
    "https://rukminim2.flixcart.com/fk-p-flap/1600/270/image/80e9232048de153f.png?q=100",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        elevation: .1,
        backgroundColor: Colors.purple,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/33.jpg'), // Replace with actual image URL
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Add Address',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white)),
                Text('Sangeet Nagar',
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.help_outline_sharp, color: Colors.white),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          // Banner Section
          section1(),
          // Transfer Money Section
          section2(),

          // Additional Options
          section3(),

          // Recharge & Pay Bills Section
          section4(),

          section5()
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }

  Widget section1() {
    return ExpandableCarousel(
      options: ExpandableCarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        floatingIndicator: true,
        showIndicator: true,
      ),
      items: items.map((imageURL) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.network(imageURL, fit: BoxFit.cover));
          },
        );
      }).toList(),
    );
  }

  Widget section2() {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transfer Money',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton('To Mobile\nNumber', Icons.person),
                _buildActionButton('To Bank/ UPI\nID', Icons.home),
                _buildActionButton('To Self\nAccount', Icons.account_circle),
                _buildActionButton(
                    'Check Bank\nBalance', Icons.account_balance),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildUpiLiteWidget(), _buildUpiIdWidget()],
            ),
          ],
        ),
      ),
    );
  }

  Widget section3() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _card1('PhonePe\nWallet', Icons.account_balance_wallet, Colors.white),
          _card1('Explore\nRewards', Icons.card_giftcard, Colors.white),
          _card1('Earn\nCashbacks', Icons.local_offer, Colors.white),
        ],
      ),
    );
  }

  Widget _buildUpiLiteWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Padding inside the border
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
        borderRadius:
            BorderRadius.circular(8), // Optional: Rounded corners for border
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'UPI Lite: ',
                  style: TextStyle(
                    color: Colors.black, // Black color for "UPI Lite"
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: '₹0.01',
                  style: TextStyle(
                    color: Colors.red, // Red color for the currency value
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpiIdWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10, vertical: 5), // Padding inside the border
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
        borderRadius:
            BorderRadius.circular(8), // Optional: Rounded corners for border
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'UPI ID: 9010101010@axl', // UPI ID text
            style: TextStyle(
              color: Colors.black, // Black color for UPI ID
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.arrow_forward_ios,
              size: 12, color: Colors.grey), // Arrow icon
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Make the column as small as possible
      mainAxisAlignment: MainAxisAlignment.start, // Align at the top
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.purple,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _card1(String text, IconData icon, Color backgroundColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      decoration: BoxDecoration(
        color: backgroundColor, // Set the background color here
        borderRadius: BorderRadius.circular(10), // Optional: Add border radius
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.purple),
          SizedBox(
            width: 10,
          ),
          Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Widget section4() {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recharge & Pay Bills',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                viewAllButton()
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton('Mobile\nRecharge', Icons.phone_android),
                _buildActionButton('Loan\nRepayment', Icons.money),
                _buildActionButton('Credit Card\nPayment', Icons.credit_card),
                _buildActionButton('Rent', Icons.home),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget section5() {
    return Card(
      color: Colors.white,
      elevation: .5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Loans',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                viewAllButton()
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton('Credit Score', Icons.credit_card),
                _buildActionButton('Gold Loan', Icons.money),
                _buildActionButton('Mutual Fund \nLoan', Icons.graphic_eq),
                _buildActionButton('Bike Loan', Icons.bike_scooter),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget viewAllButton() {
    return TextButton(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.purple.shade50),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text(
            'View All',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            size: 11,
          )
        ],
      ),
    );
  }
}
