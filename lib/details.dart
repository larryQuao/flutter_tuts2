import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({Key? key, required this.productName}) : super(key: key);

  String productName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.black,
        title: Text(productName),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.account_balance_wallet),
              title: Text(productName),
            )
          ],
        ),
      ),
    );
  }
}
