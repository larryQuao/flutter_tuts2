// RadioButtons and RadioTlleLists

import 'package:flutter/material.dart';
import 'package:second/details.dart';

// ignore: constant_identifier_names
enum ProductTypeEnum { Downloadable, Deliverable }

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  _MyFormState() {
    _selectedVal = _productSizesList[0];
  }
// Variables
  final _productController = TextEditingController();
  final _productDesController = TextEditingController();
  ProductTypeEnum? _productTypeEnum;
  final bool _checkBox = false;
  final _productSizesList = ["Small", "Medium", "Large", "XLarge"];
  String? _selectedVal = "";

  @override
  void dispose() {
    _productController.dispose();
    super.dispose();
  }

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

              // Custom TextFormField
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
              MyCheckBoxList(
                checkBoxTitle: 'Top Chart',
                checkBoxTitleSize: 16,
                weight: FontWeight.w400,
                checkBox: _checkBox,
              ),

              // RadioListTile
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(ProductTypeEnum.Deliverable.name),
                      tileColor: Colors.deepPurple.shade50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      dense: true,
                      value: ProductTypeEnum.Deliverable,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: RadioListTile(
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(ProductTypeEnum.Downloadable.name),
                      tileColor: Colors.deepPurple.shade50,
                      dense: true,
                      value: ProductTypeEnum.Downloadable,
                      groupValue: _productTypeEnum,
                      onChanged: (val) {
                        setState(() {
                          _productTypeEnum = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),

              // DropDown Button
              // DropdownButton(
              //   value: _selectedVal,
              //   items: _productSizesList
              //       .map(
              //         (e) => DropdownMenuItem(
              //           value: e,
              //           child: Text(e),
              //         ),
              //       )
              //       .toList(),
              //   onChanged: (val) {
              //     setState(() {
              //       _selectedVal = val as String;
              //     });
              //   },
              // ),

              myDropDownButton(
                selectedVal: _selectedVal,
                productSizesList: _productSizesList,
                dropDownArrowColor: Colors.deepPurple,
                dropDownColor: Colors.deepPurple.shade50,
                prefixIcon: Icons.accessibility_new_rounded,
                prefixIconColor: Colors.deepPurple,
                dropDownName: "Product Size",
              ),

              const SizedBox(
                height: 20,
              ),

              myBtn(context)
            ],
          ),
        ));
  }

// Button Custom Widget
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
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

class myDropDownButton extends StatefulWidget {
  myDropDownButton({
    super.key,
    required String? selectedVal,
    required List<String> productSizesList,
    this.dropDownName,
    required this.dropDownArrowColor,
    required this.prefixIcon,
    required this.prefixIconColor,
    required this.dropDownColor,
  })  : _selectedVal = selectedVal,
        _productSizesList = productSizesList;

  String? _selectedVal;
  final List<String> _productSizesList;
  final String? dropDownName;
  final Color dropDownArrowColor;
  final IconData prefixIcon;
  final Color prefixIconColor;
  final Color dropDownColor;

  @override
  State<myDropDownButton> createState() => _myDropDownButtonState();
}

class _myDropDownButtonState extends State<myDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget._selectedVal,
      items: widget._productSizesList
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (val) {
        setState(() {
          widget._selectedVal = val as String;
        });
      },
      icon: Icon(
        Icons.arrow_drop_down_circle,
        color: widget.dropDownArrowColor,
      ),
      dropdownColor: widget.dropDownColor,
      decoration: InputDecoration(
        labelText: widget.dropDownName,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: widget.prefixIconColor,
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }
}

// Custom CheckBoxList Widget
class MyCheckBoxList extends StatefulWidget {
  MyCheckBoxList({
    Key? key,
    required this.checkBoxTitle,
    required this.checkBoxTitleSize,
    required this.weight,
    required this.checkBox,
  }) : super(key: key);

  final String checkBoxTitle;
  final double checkBoxTitleSize;
  final FontWeight weight;
  bool? checkBox;

  @override
  State<MyCheckBoxList> createState() => _myCheckBoxListState();
}

class _myCheckBoxListState extends State<MyCheckBoxList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            tristate: true,
            value: widget.checkBox,
            onChanged: (val) {
              setState(() {
                widget.checkBox = val;
              });
            }),
        const Padding(padding: EdgeInsets.only(left: 12)),
        Text(
          widget.checkBoxTitle,
          style: TextStyle(
              fontSize: widget.checkBoxTitleSize, fontWeight: widget.weight),
        )
      ],
    );
  }
}

// Custom TextFormField
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

// Reference to an enclosing class method cannot be extracted
