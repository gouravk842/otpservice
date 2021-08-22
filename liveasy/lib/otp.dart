import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/home.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flutter/services.dart';

class OtpService extends StatefulWidget {
  String id;
  String mobile;
  OtpService({
    required this.id,
    required this.mobile,
  });
  @override
  _OtpServiceState createState() =>
      _OtpServiceState(verificationId: id, mobile: mobile);
}

class _OtpServiceState extends State<OtpService> {
  final String verificationId;
  String mobile;
  _OtpServiceState({
    required this.verificationId,
    required this.mobile,
  });

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  FirebaseAuth _auth = FirebaseAuth.instance;
  signIn(String smsOTP) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsOTP);
      final user = await _auth.signInWithCredential(credential);

      print("success");
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) => Home()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid OTP'),
        ),
      );

      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("OTP Verification"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                'Verify +91-' + mobile,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                print(pin);
                signIn(pin);
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didnt receive the code ? "),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Resend Code"))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Home()));
              },
              child: Text("Verify and Continue "))
        ],
      ),
    );
  }
}
