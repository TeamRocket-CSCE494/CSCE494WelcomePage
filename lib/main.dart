import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/second': (context) => ChooseLeagueType(),
      '/third': (context) => CreateLeague(),
      '/fourth': (context) => JoinLeague(),
      'fifth': (context) => JoinSpecificLeague(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Image.asset(
                    'assets/MoolahMasterLogo2.png',
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Center(
                    child: const Text(
                    'Moolah Master',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Color.fromRGBO(1, 25, 54, 1.0),
                    ),
                    ),
                  ),
                ),
              ],
            ),

          ),
          /*3*/
        ],
      ),
    );
    return MaterialApp(
      title: 'Moolah Master',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        fontFamily: 'Bebas Neue',
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('Welcome to Moolah Master'),
            )

        ),
        body: Column(
          children: [
            titleSection,
            TextButton(
              child: Text('Start', style: TextStyle(fontSize: 50.0),),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },

            ),
          ]
        )
      ),

    );
  }
}
class ChooseLeagueType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Your League Type"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text('Create League', style: TextStyle(fontSize: 50.0),),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
            child: Text('Join League', style: TextStyle(fontSize: 50.0),),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Resume League', style: TextStyle(fontSize: 50.0),),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class CreateLeague extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      //padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Moolah Master',
                    style: TextStyle(
                        fontSize: 50, color: Color.fromRGBO(239, 41, 23, 1)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Future<void> sendData(formData) async {
      final header = {
        'Api-Version': 'v2',
        'Ocp-Apim-Subscription-Key': 'c7d04b42632847e4bd1a633c4e54a75d',
      };
      final response = await http.post(
          Uri.parse('https://csc494apimgmt.azure-api.net/league'),
          headers: header,
          body: json.encode(formData));
      print('Status code: ${response.statusCode}');
      print('Body: ${response.body}');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create League',
      theme: ThemeData(
          textTheme: GoogleFonts.bebasNeueTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(01, 19, 36, 20),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Create Your League!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                titleSection,
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderTextField(
                  name: 'league', //{'name': Sophia}
                  cursorColor: Colors.white,
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER YOUR TEAM NAME',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderTextField(
                  name: 'owner', //{'email': email@email.com}
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'ENTER EMAIL',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                FormBuilderDropdown(
                  name: 'capacity',
                  style: TextStyle(
                      color: Color.fromRGBO(239, 41, 23, 1), fontSize: 20),
                  decoration: InputDecoration(
                    labelText: 'NUMBER OF TEAM MEMBERS',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.white, width: 0.0)),
                    border: const OutlineInputBorder(),
                  ),
                  items: ['4', '6', '8']
                      .map((val) => DropdownMenuItem(
                    value: val,
                    child: Text('$val'),
                  ))
                      .toList(),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                ),
                /*FormBuilderDropdown(
                name: 'league',
                decoration: InputDecoration(labelText: 'LEAGUE TYPE'),
                items: ['Basic League', 'Advanced League']
                    .map((val) => DropdownMenuItem(
                          value: val,
                          child: Text('$val'),
                        ))
                    .toList(),
              ),*/
                ButtonTheme(
                  minWidth: 200.0,
                  height: 70,
                  child: RaisedButton(
                    color: Color.fromRGBO(239, 41, 23, 1),
                    textColor: Colors.white,

                    onPressed: () async {
                      //saving form data
                      _formKey.currentState?.save();
                      final formData =
                          _formKey.currentState?.value; //all form values
                      print(
                          formData); //{'name': Sophia, 'email': email@email.com, 'number': 8 members, 'league': Basic League}
                      sendData(formData);
                    }, //FUCK YEAH BABY!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                    child: Text('continue', style: TextStyle(fontSize: 30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class JoinLeague extends StatelessWidget {
  const JoinLeague({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join a League"),
        backgroundColor: Colors.blueGrey,

      ),
        body: Column(
            children: [
              SizedBox(
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a team name',
                  ),
                ),
              ),
              TextButton(
                child: Text('Next', style: TextStyle(fontSize: 50.0),),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blueGrey,
                  padding: EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/fifth');
                },

              ),
            ]
        )
    );
  }
}

class JoinSpecificLeague extends StatelessWidget {
  const JoinSpecificLeague();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join a League"),
        backgroundColor: Colors.blueGrey,

      ),
      body: Center(
        child: Text('Join a Moolah Master League',),

      ),
    );
  }
}