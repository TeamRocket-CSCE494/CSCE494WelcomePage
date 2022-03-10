import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:io' as IO;
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:core';
import 'package:camera_roll_uploader/camera_roll_uploader.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/first': (context) => MyApp(),
      '/second': (context) => ChooseLeagueType(),
      '/third': (context) => CreateLeague(),
      '/fourth': (context) => JoinLeagueApp(),
      '/fifth': (context) => JoinSpecificLeague(),
      '/sixth': (context) => CreateLineupPage(),
      '/seventh': (context) => ViewLineupPage(),
      '/eighth': (context) => ProfilePicUploadPage()
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
            child: Text('Welcome to Moolah Master!'),
          )),
          body: Column(children: [
            titleSection,
            TextButton(
              child: Text(
                'Start',
                style: TextStyle(fontSize: 50.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  right: 15,
                  left: 15,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
            ),
            TextButton(
              child: Text(
                'Change Profile Pic',
                style: TextStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.blueGrey,
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: 10,
                  right: 15,
                  left: 15,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/eighth');
              },
            ),
          ])),
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
            child: Text(
              'Create League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                right: 15,
                left: 15,
              ),
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
            child: Text(
              'Join League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding: EdgeInsets.only(
                top: 20,
                bottom: 10,
                right: 15,
                left: 15,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
          const SizedBox(height: 50),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sixth');
            },
            child: Text(
              'Resume League',
              style: TextStyle(fontSize: 50.0),
            ),
            style: TextButton.styleFrom(
              alignment: FractionalOffset.center,
              primary: Colors.black,
              backgroundColor: Colors.blueGrey,
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 15, left: 15),
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
                Row(
                  children: [
                    Text(
                      'Moolah Master',
                      style: TextStyle(
                          fontSize: 50, color: Color.fromRGBO(239, 41, 23, 1)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 0),
                      child: Image.asset(
                        'assets/MoolahMasterLogo2.png',
                        height: 95,
                        width: 95,
                      ),
                    ),
                  ],
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
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
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
                      borderSide: BorderSide(color: Colors.white, width: 0.0),
                    ),
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

class JoinLeagueApp extends StatelessWidget {
  JoinLeagueApp(); //I had to make it not const so I could create these functions

  final _formKey = GlobalKey<FormBuilderState>();

  Future<void> sendData(formData) async {
    final header = {
      'Api-Version': 'v2',
      'Ocp-Apim-Subscription-Key':
          'c7d04b42632847e4bd1a633c4e54a75d', //I think this is the same???
    };
    final response = await http.post(
        Uri.parse('https://csc494apimgmt.azure-api.net/league'),
        headers: header,
        body: json.encode(formData));
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const JoinLeagueScreen(),
        '/joinleague': (context) => const JoinLeagueScreen(),
      },
      /*home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
        ),
      ),*/
    );
  }
}

class JoinLeagueScreen extends StatelessWidget {
  const JoinLeagueScreen();

  final String leaguename =
      ""; // change this once we figure out how to get league name from the database

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('Join a League!')),
      body: new Column(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Center(
                      child: Text(
                        'Moolah Master',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(239, 41, 23, 1),
                          fontFamily: 'Bebas Neue',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 60),
                    child: Image.asset(
                      'assets/MoolahMasterLogo2.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: FormBuilderTextField(
                        name: 'joinedleague',
                        cursorColor: Colors.white,
                        style: TextStyle(
                            color: Color.fromRGBO(239, 41, 23, 1),
                            fontSize: 20),
                        decoration: InputDecoration(
                          labelText: 'ENTER A TEAM NAME:',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Center(
                child: TextButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontFamily: 'Bebas Neue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                    padding: EdgeInsets.only(
                        top: 20, bottom: 10, right: 35, left: 35),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/sixth');
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
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
        child: Text(
          'Join a Moolah Master League',
        ),
      ),
    );
  }
}

class CreateLineupPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<CreateLineupPage> createState() => _CreateLineupPageState();
}

class _CreateLineupPageState extends State<CreateLineupPage> {
  String teamname = "Teamname"; // change once we get team names from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose Your Lineup!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Text('${teamname}\'s current lineup:',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'bebas neue',
                  fontSize: 30,
                )),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
            ),
            Row(
              // this is where the actual stocks are gonna be displayed

              // stocks
              children: [
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
            ),
            const Text(
              "Tap the stocks from the selection below to add them to your lineup!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'bebas neue', fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'NASDAQ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'APPLE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'DOW JONES',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'MICROSOFT',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'TESLA',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'AMAZON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'BANK OF AMERICA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'EXXON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'JP MORGAN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, right: 35, left: 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewLineupPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ViewLineupPage> createState() => _ViewLineupPageState();
}

class _ViewLineupPageState extends State<ViewLineupPage> {
  String teamname = "Teamname"; // change once we get team names from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(01, 19, 36, 20),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Choose Your Lineup!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Text('${teamname}\'s current lineup:',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'bebas neue',
                  fontSize: 30,
                )),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20),
            ),
            Row(
              // this is where the actual stocks are gonna be displayed

              // stocks
              children: [
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text(
                    'Name and price here',
                  ),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
                Container(
                  width: 75,
                  height: 75,
                  color: Color.fromRGBO(239, 41, 23, 1),
                  child: Text('Name and price here'),
                ),
                const Spacer(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10),
            ),
            const Text(
              "Tap the stocks from the selection below to add them to your lineup!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontFamily: 'bebas neue', fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'NASDAQ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'APPLE',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'DOW JONES',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'MICROSOFT',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'TESLA',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'AMAZON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  Row(children: [
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'BANK OF AMERICA',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'EXXON',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: TextButton(
                        child: Text(
                          'JP MORGAN',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Bebas Neue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(4, 119, 111, 1),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                    ),
                    const Spacer(),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10),
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontFamily: 'Bebas Neue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Color.fromRGBO(239, 41, 23, 1),
                  padding:
                      EdgeInsets.only(top: 20, bottom: 10, right: 35, left: 35),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/sixth');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePicUploadPage extends StatefulWidget {
  @override
  State<ProfilePicUploadPage> createState() => _ProfilePicUploadPageState();
}

class _ProfilePicUploadPageState extends State<ProfilePicUploadPage> {
  var image;
  var imgpath;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            title: Text("Embedded Camera Roll Picker"),
          ),
          body: CameraRollUploader(
            isDownloadingImage: (downloading) {
              print("downloading $downloading");
            },
            selectedImageCallback: (imagePath) {
              print("imagePath $imagePath");
              Image.file(IO.File(imagePath!),fit: BoxFit.cover,);
              imgpath = imagePath;
            },
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (IO.Platform.isIOS)
                  ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: FloatingActionButton(
                    heroTag: "modal",
                    child: Text(
                      "SHOW\nMODAL",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () => _openPicker(context),
                  ),
                ),
              )
                  : Container(
                width: 0.0,
                height: 0.0,
              ),
              SizedBox(
                width: 80,
                height: 80,
                child: FloatingActionButton(
                  heroTag: "push",
                  backgroundColor: Colors.black,
                  child: Text(
                    "Back",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/first'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _openPicker(BuildContext context, {bool isModal = true}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: isModal,
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: CameraRollUploader(),
          );
        },
      ),
    );
  }
}
