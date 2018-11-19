import 'package:flutter/material.dart';
import 'package:flutteruitutorial1/login_page.dart';

void main() => runApp(QuickBee());

class QuickBee extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      title: 'My App',
      home: LoginPage()
    );
  }
}




// /*
// Scaffold Body:
// SafeArea / Center / Column / Row / Stack / Container / Expanded
// */
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('App Bar Title'),
//         elevation: 0.4,
//         leading: IconButton(
//           icon: new Icon(Icons.menu),
//           onPressed: () {},
//         ),
//       ),
//       body: new SafeArea(
//         minimum: EdgeInsets.all(15),
//         child: CartPage(),
//       )
//     );
//   }

//   Widget _cartHome(BuildContext context) {
//     return Container(
//       child: CartPage(),
//     );
//   }
// }

// class CartPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SafeArea(
//         minimum: const EdgeInsets.all(0),
//         child: new ListView.builder(
//             itemCount: 5,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text('entry $index'),
//               );
//             }
//           ),
//       )
//     );
//   }
// }
