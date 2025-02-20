import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                size: 40,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: 100, // Adjust width to control overlap
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                      left: 5, // Adjust to shift the back button slightly
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Color.fromARGB(255, 148, 148, 148))),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10, // Moves the second button over the first
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: Color.fromARGB(255, 148, 148, 148))),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 227, 243, 227),
            const Color.fromARGB(255, 240, 231, 222)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                Text("Total Balance",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Text("Debit Card *4863",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                    SizedBox(width: 5),
                    Image.asset("icons/debit.png", width: 20),
                  ],
                ),
                SizedBox(height: 30),
                Center(
                  child: Text("36,280.00 USD",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _actionButton(Icons.arrow_upward, "Send"),
                    _actionButton(Icons.arrow_downward, "Receive"),
                    _actionButton(Icons.swap_horiz, "Convert"),
                    _actionButton(Icons.more_horiz, "Another"),
                  ],
                ),
                SizedBox(height: 30),
                Text("Recent Transactions",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transactionTile(
                      "From: Julia K.", "Money transfer", "\$200.00", true),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _transactionTile(
                      "Sketch", "Monthly subscription fee", "-\$12.00", false),
                ),
                _transactionTile(
                    "YouTube", "Monthly subscription fee", "-\$16.00", false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 30,
          child: Icon(icon, size: 30, color: Colors.black),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14))
      ],
    );
  }

  Widget _transactionTile(
      String title, String subtitle, String amount, bool isPositive) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(85, 255, 255, 255),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.grey[200], child: Icon(Icons.history)),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle,
            style: TextStyle(color: const Color.fromARGB(255, 70, 70, 70))),
        trailing: Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPositive ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
