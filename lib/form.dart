// import 'package:flutter/material.dart';

// class MyForm extends StatefulWidget {
//   const MyForm({super.key});

//   @override
//   State<MyForm> createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         elevation: 5,
//         shadowColor: Colors.black,
//         title: const Text(
//           'Form',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: OutlinedButton(
//           style: OutlinedButton.styleFrom(
//             minimumSize: const Size(200, 50),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) {
//               return Text('') /*Details();*/;
//             }));
//           },
//           child: Text(
//             'Submit Form'.toUpperCase(),
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
