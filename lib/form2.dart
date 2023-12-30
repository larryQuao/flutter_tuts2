// TextFormField, TextFormField, Dispose, TextEditingController, Controllers, initStates

import 'package:flutter/material.dart';
import 'package:second/details.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  var _productName;
  final _productController = TextEditingController();

  @override
  void dispose() {
    _productController.dispose();
    super.dispose();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(
                  labelText: "Products",
                  prefixIcon: Icon(Icons.verified_user_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              myBtn(context),
            ],
          ),
        ));
  }

  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Details(
            productName: _productController.text,
          );
        }));
      },
      child: Text('Submit Form'.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
