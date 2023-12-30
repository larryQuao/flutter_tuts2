// CheckBox & CheckBoxListTile

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
  final _productDesController = TextEditingController();

  bool? _checkBox, _listTileCheckBox = false;

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
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.black,
          centerTitle: true,
          title: const Text('Form'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const Text(
                'Products',
                style: TextStyle(
                    fontSize: 35, fontWeight: FontWeight.bold, height: 1),
              ),
              const Text('Add product details in the form below'),
              const SizedBox(height: 30),
              MyTextField(
                  productController: _productController,
                  fieldName: "Product Name",
                  myIcon: Icons.propane_outlined,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              MyTextField(
                  productController: _productDesController,
                  fieldName: "Product Description",
                  myIcon: Icons.description_outlined,
                  prefixIconColor: Colors.deepPurple.shade300),
              const SizedBox(height: 10.0),
              // Custom Widget for the Check box
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    Checkbox(
                        tristate: true,
                        value: _checkBox,
                        onChanged: (val) {
                          setState(() {
                            _checkBox = val;
                          });
                        }),
                    const Padding(padding: EdgeInsets.only(left: 12)),
                    const Text(
                      'Top Product',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              CheckboxListTile(
                value: _listTileCheckBox,
                title: const Text("Top Product"),
                onChanged: (val) {
                  setState(() {
                    _listTileCheckBox = val;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              // myBtn(context)
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
          style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.fieldName,
    required this.productController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
  }) : super(key: key);

  final TextEditingController productController;
  final String fieldName;
  final IconData myIcon;
  final Color prefixIconColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: productController,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.deepPurple)),
    );
  }
}
