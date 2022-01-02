import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/Aboutus_screen.dart';
import 'package:untitled1/Contactus_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled1/Question.dart';
import 'package:untitled1/Testpaper.dart';
import 'package:untitled1/NavBar.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Aboutus_screen': (context) => Aboutus(),
        '/Contactus_screen': (context) => Contactus_screen(),
      },




      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),

      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(


          title: Center(child: new Text("PRACTICSHA"),),
        ),
        body: Column(
            children: [


              Container(


                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),


                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email Id",
                      hintText: 'Enter you email id'


                  ),


                  )
              ),
              Container(

                  padding: EdgeInsets.all(10),
                  child: TextField(decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: 'Enter your Password'


                  ),

                  )
              ),
              Container(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.teal,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHome()));
                  },
                  child: Text('Login'),


                ),
              ),

              FlatButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.teal, fontSize: 15),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => signup()));
                },
                child: Text(
                  'sign up',
                  style: TextStyle(color: Colors.teal, fontSize: 15),
                ),
              ),


            ]


        )


    );
  }
}






class Todo {
  final String paper_name;

  const Todo(this.paper_name);
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class GetUsers {
  int id;
  String class_name;

  GetUsers({required this.id, required this.class_name});

  factory GetUsers.fromJson(Map<String, dynamic> json) {
    return GetUsers(id: json['id'], class_name: json['class_name']);
  }
}

final String apiURL = 'http://api.hometutorpatna.com/api/getClass';

Future<List<GetUsers>> fetchJSONData() async {
  var jsonResponse = await http.get(Uri.parse('http://api.hometutorpatna.com/api/getClass'));

  if (jsonResponse.statusCode == 200) {
    final jsonItems =
    json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

    List<GetUsers> usersList = jsonItems.map<GetUsers>((json) {
      return GetUsers.fromJson(json);
    }).toList();

    return usersList;
  } else {
    throw Exception('Failed to load data from internet');
  }
}

class _MyHomeState extends State<MyHome> {
  final name = TextEditingController();
  void _ontapselected(int index) {
    if (index == 1) {
      //Navigator.pushReplacementNamed(context, "/about");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Aboutus(),
              settings: RouteSettings(arguments: {'name': name.text})));
    }
    // if (index == 2) {
    //   //Navigator.pushReplacementNamed(context, "/home");
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => MyHome(),
    //           settings: RouteSettings(arguments: {'name': name.text})));
    // }
    if (index == 2) {
      //Navigator.pushReplacementNamed(context, "/contactus");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Contactus_screen(),
              settings: RouteSettings(arguments: {'name': name.text})));
    }


    // Navigator.pushNamed(context, '/about');
  }

  makePostRequest() async {
    final uri = Uri.parse('url');
    final headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> body = {
      'device_id': 7854220,
      'fcm_id': 5874988,
      'mobile_number': 9973044945
    };
    String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    http.Response response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
      encoding: encoding,
    );

    int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        bottomOpacity: 0,
        elevation: 0,
        title: new Text("Standard"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.icecream), label: "About us"),
          BottomNavigationBarItem(
              icon: Icon(Icons.icecream), label: "Contact us"),


        ],
        selectedFontSize: 10,
        currentIndex: 0,
        onTap: _ontapselected,
      ),
      body: FutureBuilder<List<GetUsers>>(
        future: fetchJSONData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return GridView(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: snapshot.data!
                .map(
                  (user) => ListTile(
                title: Text(user.class_name),

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Testpaper(1),
                          settings: RouteSettings(
                              arguments: {'name': name.text})));
                },
                subtitle: Text(user.class_name),
                leading: CircleAvatar(

                  backgroundColor: Colors.teal,
                  child: Text(user.class_name[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                ),
              ),
            )
                .toList(),
          );
        },
      ),
    );
  }
}



class signup extends StatefulWidget {
  // const signup({Key? key}) : super(key: key);
  @override
  _signupState createState() => _signupState();
} MakePostRequest() async {
  final uri = Uri.parse('http://api.hometutorpatna.com/api/getlogin');
  final headers = {'Content-Type': 'application/json; charset=UTF-8'};
  Map<String, dynamic> body = {

  };
  String jsonBody = json.encode(body);
  final encoding = Encoding.getByName('utf-8');

  http.Response response = await http.post(
    uri,
    headers: headers,
    body: jsonBody,
    encoding: encoding,
  );

  int statusCode = response.statusCode;
  String responseBody = response.body;
  print(responseBody);

}

class _signupState extends State<signup> {
  final password=TextEditingController();
  final name=TextEditingController();
  final email=TextEditingController();
  final id=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
          appBar: AppBar(
            title: Center(child: new Text("Signup") ,),
          ),
          body: Column(
              children: [
                Container(


                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),

                    child: TextField(controller: name,decoration: InputDecoration(labelText: "Name",
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name'),

                    )
                ),
                Container(


                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),

                    child: TextField(controller: email,decoration: InputDecoration(labelText: "Email",
                        border: OutlineInputBorder(),
                        hintText: 'Enter you email id'),

                    )
                ),
                Container(


                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),

                    child: TextField(controller: id,decoration: InputDecoration(labelText: "id",
                        border: OutlineInputBorder(),
                        hintText: 'Enter your id'),

                    )
                ),
                Container(


                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),

                    child: TextField(controller:password,decoration: InputDecoration(labelText: "password",
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password'),

                    )
                ),
                Container(
                  child: FlatButton(
                    color: Colors.teal,
                    child: Text('Submit', style: TextStyle(fontSize: 20.0,
                      color: Colors.white,),
                    ),
                    onPressed: MakePostRequest,
                  ),
                ),
              ]
          )

      ),

    );
  }
}



