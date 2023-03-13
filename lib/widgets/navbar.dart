// import 'package:flutter/material.dart';

// class NavBar extends StatefulWidget {
//   @override
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   bool state1 = false;
//   bool state2 = false;
//   bool state3 = false;

//   // Widget logoBar(){
//   //   return Row(children: <Widget>[Image.asset('image/icon.png')],)
//   // }

//   List<Widget> navList() => [    
//     FlatButton(
//       shape: StadiumBorder(),
//       child: Text('Destination'),
//       onPressed: () {},
//       color: Colors.transparent,                  
//     ), 
//     FlatButton(
//       shape: StadiumBorder(),
//       child: Text('Driver'),
//       onPressed: () {},
//       color: Colors.transparent,
//     ),
//     FlatButton(
//       shape: StadiumBorder(),
//       child: Row(
//         children: <Widget>[
//           Text('My Account'),
//           SizedBox(
//             width: 15,
//           ),
//           Icon(Icons.arrow_drop_down),
//         ],
//       ),
//       onPressed: () {},
//       color: Colors.transparent,
//     ),
//     FlatButton(
//       shape: StadiumBorder(),
//       child: Row(
//         children: <Widget>[
//           Text('More'),
//           SizedBox(
//             width: 15,
//           ),
//           Icon(Icons.arrow_drop_down),
//         ],
//       ),
//       onPressed: () {},
//       color: Colors.transparent,
//     ),
//   ];

//   // Widget dropDownItem(
//   //     String label, Function onTap, Function onEnter, Function onExit) {
//   //   return Padding(
//   //     padding: EdgeInsets.only(bottom: 15),
//   //     child: InkWell(
//   //       onTap: onTap,
//   //       child: MouseRegion(
//   //         onEnter: onEnter,
//   //         onExit: onExit,
//   //         child: Text(
//   //           label,
//   //           style: TextStyle(
//   //             color: state1 == false || state2 == false || state3 == false
//   //                 ? Colors.black
//   //                 : Colors.blue,
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Container dropDownMenu() => Container(
//   //   padding: EdgeInsets.all(20),
//   //   decoration: BoxDecoration(
//   //     color: Colors.white24,
//   //     borderRadius: BorderRadius.only(
//   //       bottomLeft: Radius.circular(8),
//   //       bottomRight: Radius.circular(8),
//   //     ),
//   //   ),
//   //   child: Column(
//   //     children: <Widget>[
//   //       dropDownItem('Profile', () {
//   //         setState(() {
//   //           state1 = true;
//   //         });
//   //       }, (_) {
//   //         setState(() => state1 = true);
//   //       }, (_) {
//   //         setState(() => state1 = false);
//   //       }),
//   //       dropDownItem('Activities', () {
//   //         setState(() {
//   //           state2 = true;
//   //         });
//   //       }, (_) {
//   //         setState(() => state2 = true);
//   //       }, (_) {
//   //         setState(() => state2 = false);
//   //       }),
//   //       dropDownItem('Cart', () {
//   //         setState(() {
//   //           state3 = true;
//   //         });
//   //       }, (_) {
//   //         setState(() => state3 = true);
//   //       }, (_) {
//   //         setState(() => state3 = false);
//   //       }),
//   //     ],
//   //   ),
//   // );  

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
          
//           Row(
//             children: navList(),
//           ),
//           LoginButton()
//         ],
//       ),
//     );
//   }
// }

// class LoginButton extends StatelessWidget {
//   const LoginButton({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton(      
//       child: Container(
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(color: Colors.black26),
//         child: Text(
//           'Login',
//           style: TextStyle(
//               fontFamily: 'Roboto',
//               fontWeight: FontWeight.w600,
//               color: Colors.white),
//         ),
//       ),
//       onPressed: () {},
//     );
//   }
// }
