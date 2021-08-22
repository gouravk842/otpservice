import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/login.dart';

class Lang extends StatelessWidget {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blueAccent,
    minimumSize: Size(300, 40),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liveasy'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please select your Language",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'You can change the language at any time',
                textAlign: TextAlign.center,
              ),
              width: 200,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: ["English", "Hindi", "Bengali", 'Urdu'],
                  label: "Language",
                  hint: "Select Language",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "English"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => login()));
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
