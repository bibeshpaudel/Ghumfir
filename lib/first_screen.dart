import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:http_parser/http_parser.dart';

class FirstScreen extends StatefulWidget {
  static const id = 'first_screen';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  TextEditingController dob =TextEditingController();
  TextEditingController doi =TextEditingController();
  TextEditingController father =TextEditingController();
  TextEditingController mother =TextEditingController();
  TextEditingController mobile =TextEditingController();
  TextEditingController cnumber =TextEditingController();
  TextEditingController paddress =TextEditingController();
  TextEditingController taddress =TextEditingController();
  TextEditingController occupation =TextEditingController();
  TextEditingController iaddress =TextEditingController();
  var gender;
  var education;
  final ImagePicker _picker = ImagePicker();
  Image imageu = Image.asset('images/noimage.jpeg');
  Image imagec = Image.asset('images/noimage.jpeg');
  File? userimage;
  File? docimage;
  XFile? usr;
  XFile? cer;
  String? imgu;
  String? imgc;

  void imageSelectU() async{
    final XFile? selectedImageU =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print(selectedImageU!.path.toString());
    //if(selectedImageU.path.isNotEmpty) {
      setState(() {
        usr = selectedImageU;
        userimage = File(selectedImageU.path);
        imageu = Image.file(File(selectedImageU.path));
        // String img64 = base64Encode(File(selectedImageU.path).readAsBytesSync());
        // imgu = img64;
        List<int> imageBytes = (File(selectedImageU.path)).readAsBytesSync();
        String base64Image = base64.encode(imageBytes);
        imgu = base64Image;
      });
    //}
  }

  void imageSelectC() async{
    final XFile? selectedImageC =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    print(selectedImageC!.path.toString());
    //if(selectedImageC.path.isNotEmpty) {
      setState(() {
        cer = selectedImageC;
        docimage = File(selectedImageC.path);
        imagec = Image.file(File(selectedImageC.path));
        // String img64 = base64Encode(File(selectedImageC.path).readAsBytesSync());
        // imgc = img64;
        List<int> imageBytes = (File(selectedImageC.path)).readAsBytesSync();
        String base64Image = base64.encode(imageBytes);
        imgc = base64Image;
      });
    //}
  }

  Dio dio = new Dio();
  Future submitKYC() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
    var counter1 = prefs.getInt('pk') ?? 0;
    FormData? formData = FormData.fromMap({
      "user": counter1,
      "mobile":mobile,
      "dob": dob,
      "gender": gender,
      "father_name":father,
      "mother_name":mother,
      "current_location":taddress,
      "permanent_location":paddress,
      "education":education,
      "occupation":occupation,
      "citizenship_number":cnumber,
      "citizenship_issue_district":iaddress,
      "citizenship_issue_date": doi,
      "citizenship_photo": await MultipartFile.fromFile(userimage!.path, filename: 'citizen',),
      "pp_size": await MultipartFile.fromFile(docimage!.path,  filename: 'user'),
    });
    var response = await dio.patch('http://ghumfir002.pythonanywhere.com/api/kyc/$counter1/',
    data: formData,
      options: Options(
        headers: <String, String>{
          'Authorization': 'Token $counter',
        },
      ),
    );
    print(response.statusCode);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.cyanAccent,
          title: Text('KYC Form', style: TextStyle(
            color: Colors.black,
          ),),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFC5F4DF),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget> [
                // TextFormField(
                // decoration: new InputDecoration(
                //   prefixIcon: Icon(Icons.perm_identity),
                //   labelText: "Full Name",
                //   fillColor: Colors.white,
                //   border: new OutlineInputBorder(
                //     borderRadius: new BorderRadius.circular(25.0),
                //     borderSide: new BorderSide(),
                //   ),
                // ),
                // ),
                //     SizedBox(
                //       height: 10.0,
                //     ),
                    DateTimeField(
                      controller: dob,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelText: 'Date of Birth'),
                      format: DateFormat("yyyy-MM-dd"),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2025));
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: mobile,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.phone_android),
                        labelText: "Mobile No.",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: father,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity),
                        labelText: "Father Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: mother,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.face_outlined),
                        labelText: "Mother Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.group),
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelText: 'Gender'),
                      hint: Text('Gender'),
                      value: gender,
                      items: ["M", "F"]
                          .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => gender = value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.menu_book_outlined),
                          border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          labelText: 'Education'),
                      hint: Text('Education'),
                      value: education,
                      items: ["M", "B", "+2", "S"]
                          .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() => education = value);
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: occupation,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.work),
                        labelText: "Occupation",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: taddress,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_on_outlined),
                        hintText: 'Provide detailed address',
                        labelText: "Current Location",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: paddress,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_on_rounded),
                        hintText: 'Provide detailed address',
                        labelText: "Permanent Location",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: cnumber,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.call_to_action_outlined),
                        labelText: "Citizenship no.",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: iaddress,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.location_pin),
                        labelText: "Issued District",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DateTimeField(
                      controller: doi,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_sharp),
              border: OutlineInputBorder(
                borderRadius: new BorderRadius.circular(25.0),
                borderSide: new BorderSide(),
              ),
              labelText: 'Issued date'),
                      format: DateFormat("yyyy-MM-dd"),
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2025));
                      },
                    ),
                    ElevatedButton.icon(
                      label: Text('User Profile'),
                      icon: Icon(Icons.portrait_rounded),
                      onPressed: () {
                        setState(() {
                          imageSelectU();
                        });
                    },),
                    Container(
                      height: 100.0,
                      width: double.infinity,
                      child: imageu,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton.icon(
                      label: Text('Citizenship'),
                      icon: Icon(Icons.call_to_action),
                      onPressed: () {
                        setState(() {
                          imageSelectC();
                        });
                      },),
                    Container(
                      height: 100.0,
                      width: double.infinity,
                      child: imagec,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 50.0,
                      width: 200.0,
                      child: ElevatedButton(onPressed: () {
                        setState(() {
                          submitKYC();
                        });
                      },
                        child: Text('Submit', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
                        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.lightBlue)
                          ),
                        ),
                        ),
                      ),
                    ),
                      ],
                    ),
              ),
              ),
            ),
        ),
        ),
    );
  }
}
