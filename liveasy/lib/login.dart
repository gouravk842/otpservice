import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/otp.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blueAccent,
    minimumSize: Size(300, 40),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
  final mobileNumber = TextEditingController();
  String verificationId = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Liveasy'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Please enter your mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'You will receive a 6 digit code to verify next',
                textAlign: TextAlign.center,
              ),
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 300,
                child: TextField(
                  controller: mobileNumber,
                )),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                print(mobileNumber.text);
                try {
                  await auth.verifyPhoneNumber(
                    phoneNumber: '+91' + mobileNumber.text,
                    verificationCompleted:
                        (AuthCredential phoneAuthCredential) {
                      print(phoneAuthCredential);
                    },
                    verificationFailed: (verificationFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to send otp'),
                        ),
                      );
                    },
                    codeSent: (verificationId, resendingToken) {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => OtpService(
                                id: verificationId,
                                mobile: mobileNumber.text,
                              )));
                    },
                    codeAutoRetrievalTimeout: (String verId) {
                      this.verificationId = verId;
                    },
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to send otp'),
                    ),
                  );
                }
              },
              child: Text("NEXT"),
              style: raisedButtonStyle,
            )
          ],
        ),
      ),
    );
  }
}
