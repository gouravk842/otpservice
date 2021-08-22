import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Text("Profile"),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please Select Profile",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(border: Border.all()),
              child: RadioListTile(
                groupValue: radioItem,
                title: Row(
                  children: [
                    Icon(Icons.emoji_transportation),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Transporter ")
                  ],
                ),
                value: 'Item 1',
                onChanged: (val) {
                  setState(() {
                    print(val);
                    //radioItem = val;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(border: Border.all()),
              child: RadioListTile(
                groupValue: radioItem,
                title: Row(
                  children: [
                    Icon(Icons.home_work),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Shipper ")
                  ],
                ),
                value: 'Item 2',
                onChanged: (val) {
                  print(val);
                  setState(() {
                    // radioItem = val;
                  });
                },
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Continue"))
          ],
        ),
      ),
    );
  }
}
