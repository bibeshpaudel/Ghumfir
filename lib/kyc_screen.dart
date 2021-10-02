import 'package:flutter/material.dart';
import 'package:ghumfir/getKYC.dart';

class KycScreen extends StatefulWidget {
  static const id = 'kyc_screen';

  @override
  _KycScreenState createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Your KYC', style: TextStyle(
            fontFamily: 'Pacifico',
            color: Colors.black,
          ),),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                      height: 50.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(child: Text('Mobile: $mobile',
                          style: TextStyle(fontSize: 18.0),
                        )),
                      ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Date of Birth: $dob',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Gender: $gender',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Father Name: $father',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Mother Name: $mother',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Current Location: $clocation',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Permanent Location: $plocation',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Education: $education',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Occupation: $occupation',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Citizenship No.: $cnumber',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Citizenship Issued District: $idistrict',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(child: Text('Citizenship Issued Date: $idate',
                        style: TextStyle(fontSize: 18.0),)),
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$pp'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$cpp'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),),
      ),
    );
  }
}
