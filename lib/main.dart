import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      '/second': (context) => ChooseLeagueType(),
      '/third': (context) => CreateLeague(),
      '/fourth': (context) => JoinLeague(),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Create Your League"),
    backgroundColor: Colors.blueGrey,
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
      body: Center(

      child: SizedBox(
      width: 400,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a team name',
          ),
        ),
        //child: Text('Join league ' + leaguename +'?'),
    ),
        //below this one is the point
      ),

    );
  }

}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Join a Moolah Master League', style: Theme.of(context).textTheme.headline2),

      ),
    );
  }
}