import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:select_form_field/select_form_field.dart';

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

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'M',
      'label': 'Male',
    },
    {
      'value': 'F',
      'label': 'Female',
    },
  ];

  final List<Map<String, dynamic>> _items1 = [
    {
      'value': 'B',
      'label': 'Bachelor',
    },
    {
      'value': 'M',
      'label': 'Masters',
    },
    {
      'value': '+2',
      'label': '+2',
    },
    {
      'value': 'S',
      'label': 'up to SEE',
    },
  ];

  void imageSelectU() async{
    final XFile? selectedImageU =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    print(selectedImageU!.path.toString());
      setState(() {
        usr = selectedImageU;
        userimage = File(selectedImageU.path);
        imageu = Image.file(File(selectedImageU.path));
        print(userimage!.path);
        List<int> imageBytes = (File(selectedImageU.path)).readAsBytesSync();
        String base64Image = base64.encode(imageBytes);
        imgu = base64Image;
      });
  }

  void imageSelectC() async{
    final XFile? selectedImageC =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 10);
    print(selectedImageC!.path.toString());
      setState(() {
        cer = selectedImageC;
        docimage = File(selectedImageC.path);
        imagec = Image.file(File(selectedImageC.path));
        List<int> imageBytes = (File(selectedImageC.path)).readAsBytesSync();
        String base64Image = base64.encode(imageBytes);
        imgc = base64Image;
      });
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
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      icon: Icon(Icons.group),
                      labelText: 'Gender',
                      items: _items,
                      onChanged: (val) => setState(() => gender = val),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      icon: Icon(Icons.menu_book_outlined),
                      labelText: 'Education',
                      items: _items1,
                      onChanged: (val) => setState(() => education = val),
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
                          // submitKYC();
                          postKYC();
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

  Future postKYC() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var counter = prefs.getString('key') ?? 0;
     var counter1 = prefs.getInt('pk') ?? 0;
    var request = http.MultipartRequest(
      'POST', Uri.parse("http://ghumfir003.pythonanywhere.com/api/kyc/"),

    );
    Map<String,String> headers={
      "Authorization":"Token $counter",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      await http.MultipartFile.fromPath(
        'citizenship_photo',
        docimage!.path,
      ),
    );
    request.files.add(
      await http.MultipartFile.fromPath(
        'pp_size',
        userimage!.path
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
          "user": counter1.toString(),
          "mobile":mobile.text,
          "dob": dob.text,
          "gender": gender,
          "father_name":father.text,
          "mother_name":mother.text,
          "current_location":taddress.text,
          "permanent_location":paddress.text,
          "education":education,
          "occupation":occupation.text,
          "citizenship_number":cnumber.text,
          "citizenship_issue_district":iaddress.text,
          "citizenship_issue_date": doi.text,
    });
    print("request: "+request.toString());
    var response = await request.send();
    print("This is response:"+response.toString());
    print(response.statusCode);
    if(response.statusCode == 201) {
      Navigator.pop(context);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid Credentials')));
    }
    return response.statusCode;
  }
}
