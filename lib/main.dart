import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
    vsync: this,
    duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/login.jpg"),
            fit: BoxFit.cover,
            colorBlendMode: BlendMode.overlay,
            color: Colors.black,



          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            new FlutterLogo(
             size: _iconAnimation.value*100,
    ),
    new Container(
    padding: const EdgeInsets.all(40.0),
    child: new Form(
    autovalidate: true,
    child: new Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
    new TextFormField(
    decoration: new InputDecoration(
    labelText: "Enter Email", fillColor: Colors.cyanAccent),
    keyboardType: TextInputType.emailAddress,
      style: new TextStyle(color: Colors.cyanAccent),
    ),
    new TextFormField(
    decoration: new InputDecoration(
    labelText: "Enter Password",
    ),
    obscureText: true,
    keyboardType: TextInputType.text,

    style: new TextStyle(color: Colors.cyanAccent),
    ),
    new Padding(
    padding: const EdgeInsets.only(top: 60.0),
    ),
    new MaterialButton(
    height: 50.0,
    minWidth: 150.0,
    color: Colors.blue,
    splashColor: Colors.teal,
    textColor: Colors.white,
    child: new Text("Login"),

    onPressed: () {},
    )
    ],
    ),
    ),
    )
    ],
    ),

    ]),
    );
  }
}