// import 'package:flutter/material.dart';
// import 'package:karyawanku_apps/home_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             // Tumpukan kontainer latar belakang
//             Stack(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 1.6,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 1.6,
//                   decoration: BoxDecoration(
//                     color: Color(0xFF674AEF),
//                     borderRadius:
//                         BorderRadius.only(bottomRight: Radius.circular(70)),
//                   ),
//                   child: Center(
//                     child: Image.asset(
//                       "images/gambar1.png",
//                       scale: 0.8,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Kontainer bawah berwarna putih dengan teks
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2.666,
//                 padding: EdgeInsets.only(top: 40, bottom: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(70)),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Selamat Datang",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1,
//                         wordSpacing: 2,
//                         color: Color(0xFF674AEF),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Text(
//                         "belajar bersama.",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 17,
//                           color: Colors.black.withOpacity(0.6),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 60),
//                     Material(
//                       color: Color(0xFF674AEF),
//                       borderRadius: BorderRadius.circular(10),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => HomePage(
//                                   userName: '',
//                                 ),
//                               ));
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 80),
//                           child: Text(
//                             "klik disini",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               letterSpacing: 1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
