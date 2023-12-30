import 'package:flutter/material.dart';
// import 'package:second/form.dart';
// import 'package:second/form2.dart';
// import 'package:second/form3.dart';
// import 'package:second/form4.dart';
import 'package:second/form5.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final title = '3.2 Flutter Push Pop';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.light(),
      home: MyForm(),
    );
  }
}


// void main() => runApp(StatelessClass());

// class StatelessClass extends StatelessWidget {
//   const StatelessClass({super.key});

//   final title = 'Stateless Widgets Flutter - 3.16';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.black87,
//           foregroundColor: Colors.white70,
//           title: Text(title),
//           centerTitle: true,
//         ),
//         body: StatefulClass(),
//       ),
//     );
//   }
// }

// class StatefulClass extends StatefulWidget {
//   const StatefulClass({super.key});

//   @override
//   State<StatefulClass> createState() => _StatefulClassState();
// }

// class _StatefulClassState extends State<StatefulClass> {
//   bool liked = false;
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         ListTile(
//           title: Text('Nike Shoes'),
//           trailing: IconButton(
//             icon:
//                 liked ? (Icon(Icons.favorite)) : (Icon(Icons.favorite_border)),
//             onPressed: () {
//               setState(() => liked = !liked);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }
