import 'package:flutter/material.dart';
import 'package:ghumfir/interesteduser_screen.dart';
import 'package:ghumfir/recommended.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ghumfir/welcome_screen.dart';
import 'package:ghumfir/interest_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:ghumfir/getKYC.dart';
import 'package:ghumfir/interesteduser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'match.dart';
import 'matched.dart';

 class HomeScreen extends StatefulWidget {
   static const id = 'home_screen';

   @override
   _HomeScreenState createState() => _HomeScreenState();
 }

 class _HomeScreenState extends State<HomeScreen> {

   Future logout(BuildContext context) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.clear();
     Navigator.popUntil(context, ModalRoute.withName(WelcomeScreen.id));
   }

   @override
   Widget build(BuildContext context) {

     void onSelected(BuildContext context, int item) {
       switch (item) {
         case 0:
           getKYC();
           break;
         case 1:
           showDialog(
             context: context,
             builder: (ctx) => AlertDialog(
               title: Text("LogOut"),
               content: Text("Are you sure you want to LogOut"),
               actions: <Widget>[
                 ElevatedButton(
                   onPressed: () {
                     logoutToken();
                     logout(context);
                   },
                   child: Text("Yes"),
                 ),
               ],
             ),
           );
           break;
       }
     }

     return WillPopScope(
       onWillPop: () async => false,
       child: Scaffold(
         appBar: AppBar(title: Text('Ghumfir',
           style: TextStyle(fontFamily: 'Pacifico',
               color: Colors.black, fontSize: 25.0,
           ),
         ),
           automaticallyImplyLeading: false,
         actions: [
           PopupMenuButton<int>(
             icon: FaIcon(FontAwesomeIcons.userCircle),
             iconSize: 40.0,
             onSelected: (item) => onSelected(context, item),
             itemBuilder: (context) => [
             PopupMenuItem<int>(
               value: 0,
               child: Row(
                 children: <Widget>[
                   Icon(Icons.format_align_center_outlined, color: Colors.black,),
                   SizedBox(
                     width: 15.0,
                   ),
                   Text('KYC'),
                 ],
               ),
             ),
               PopupMenuItem<int>(
                 value: 1,
                 child: Row(
               children: <Widget>[
               Icon(Icons.logout, color: Colors.black,),
               SizedBox(
                 width: 15.0,
               ),
               Text('LogOut'),
             ],
       ),
               ),
             ],
           ),],
         ),

         body: Container(
           child: SingleChildScrollView(
             child: SafeArea(
               child: Center(
                 child : Column(
                   children: <Widget>[
                     CarouselSlider(items: [
                       SizedBox(
                         width: double.infinity,
                         child: InkWell(
                           onTap: () {
                             print('pokhara');
                           },
                           child: Container(
                             margin: EdgeInsets.symmetric(vertical: 5.0),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10.0),
                               image: DecorationImage(
                                 image: AssetImage('images/pokhara.jpg'),
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         width: double.infinity,
                         child: Container(
                           margin: EdgeInsets.symmetric(vertical: 5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             image: DecorationImage(
                               image: AssetImage('images/mardi.jpg'),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         width: double.infinity,
                         child: Container(
                           margin: EdgeInsets.symmetric(vertical: 5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             image: DecorationImage(
                               image: AssetImage('images/sauraha.jpg'),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         width: double.infinity,
                         child: Container(
                           margin: EdgeInsets.symmetric(vertical: 5.0),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10.0),
                             image: DecorationImage(
                               image: AssetImage('images/annapurna.jpg'),
                               fit: BoxFit.cover,
                             ),
                           ),
                         ),
                       ),
                     ],
                       options: CarouselOptions(height: 200.0, autoPlay: true,
                       enableInfiniteScroll: true,
                         autoPlayAnimationDuration: Duration(seconds: 1),
                         enlargeCenterPage: true,
                         viewportFraction: 0.8,
                         aspectRatio: 16/9,
                       ),
                     ),
                     SizedBox(
                       height: 20.0,
                     ),
                     Row(
                       children: <Widget>[
                         Expanded(
                           flex: 1,
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: SizedBox(
                               height: 120.0,
                               child: ElevatedButton(
                                 onPressed: () {
                                   Navigator.pushNamed(context, InterestScreen.id);
                                 }, child: Text('Interest',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30.0,fontWeight: FontWeight.bold),),
                                 style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(18.0),
                                   ),
                                 ),
                                   backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent[200]),
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Expanded(
                           flex: 1,
                           child: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: SizedBox(
                               height: 120.0,
                               child: ElevatedButton(
                                 onPressed: () async{
                                   await getMatch();
                                   await getMatchurl1();
                                   await getMatchurl2();
                                   await getMatchurl3();
                                   await Navigator.pushNamed(context, Recommended.id);
                                 }, child: Text('Match',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 30.0,fontWeight: FontWeight.bold),),
                                 style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(18.0),
                                   ),
                                 ),
                                   backgroundColor: MaterialStateProperty.all(Colors.lightGreen[400]),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                     SizedBox(
                       height: 20.0,
                     ),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: SizedBox(
               width: double.infinity,
               height: 80.0,
               child: ElevatedButton(
                 onPressed: () {
                     getinterested().then((value) => finalinterested()).then((value) => finalinterested2().then((value) => finalinterested3().then((value) => Navigator.pushNamed(context, InterestedUser.id))));

                 }, child: Text("Interested User's",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25.0,fontWeight: FontWeight.bold),),
                 style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                   RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(18.0),
                   ),
                 ),
                   backgroundColor: MaterialStateProperty.all(Colors.deepPurple[300]),
                 ),
               ),
             ),
           ),
                     SizedBox(
                       height: 20.0,
                     ),
                     Text('Powered by',style: TextStyle(fontSize: 30.0, color: Colors.black.withOpacity(0.3), fontStyle: FontStyle.italic),),
                     Text('Ghumfir..',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.3),fontFamily: 'Pacifico'),),
                   ],
                 ),
               ),
             ),
           ),
         ),
       ),
     );
   }
   Future logoutToken() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     var counter = prefs.getString('key') ?? 0;
     var response = await http.post(
       Uri.parse('http://ghumfir003.pythonanywhere.com/api/auth/logout/'),
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
         'Accept': '*/*',
         'Authorization': 'Token $counter',
       },);
     print(response.body);
     print(response.statusCode);
   }
 }
