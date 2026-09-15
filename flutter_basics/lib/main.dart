import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/IntroPage.dart';
import 'package:flutter_basics/bmiCalculator.dart';
import 'package:flutter_basics/data/local/dbHelper.dart';
import 'package:flutter_basics/flowerDetails.dart';
import 'package:flutter_basics/profilePage.dart';
import 'package:flutter_basics/sharedPref/splashScreenPage.dart';
import 'package:flutter_basics/splashScreen.dart';
import 'package:flutter_basics/ui/font.dart';
import 'package:flutter_basics/widgets/roundedBtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment Lab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),

        textTheme: TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          headlineMedium: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
          headlineSmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 6),
        ),
      ),
      home: const MyHomePage(title: 'Welcome to Experiment Lab'),
      // home: HomePage(),
      // home: const Intropage(),
      // home: SplashScreen(),
      // home: BmiCalculator(),
      // home: const SplashScreenSharedPref(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var user_name = ["Uday", "Nitish", "Raghav", "Sudesh", "Prabhash"];

  var emailText = TextEditingController();
  var passwordText = TextEditingController();
  var phoneText = TextEditingController();

  var time = DateTime.now();

  var colorList = [
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.lime,
    Colors.purpleAccent,
  ];

  buttonPress() {
    print("Button Clicked");
  }

  var firstValueController = TextEditingController();
  var secondValueController = TextEditingController();
  var resultController = TextEditingController();
  var resultValue;

  calculation(operation) {
    double result = 0;

    final double? firstValue = double.tryParse(
      firstValueController.text.toString(),
    );

    final double? secondValue = double.tryParse(
      secondValueController.text.toString(),
    );

    if (firstValue == null || secondValue == null) {
      resultController.text = "Please Enter Valid Number";
      resultValue = "Please Enter Valid Number";
      return;
    }

    switch (operation) {
      case "+":
        result = firstValue + secondValue;
        break;

      case "-":
        result = firstValue - secondValue;
        break;

      case "*":
        result = firstValue * secondValue;
        break;

      case "/":
        if (secondValue == 0) {
          resultController.text = "Please Enter Valid Number";
          return;
        }
        result = firstValue / secondValue;
        break;
    }

    resultController.text = result.toStringAsFixed(2);
    // resultValue= result.toStringAsFixed(2); // this works  but not show in ui
    setState(() {
      resultValue = result.toStringAsFixed(2);
    });
  }

  var nameController = TextEditingController();

  // RangeValues values = RangeValues(0, 1);
  RangeValues values = const RangeValues(0, 100);

  var _isAnimated = false;
  var _width = 100.0;
  var _height = 100.0;
  var _color = Colors.red;

  var _opacity = 1.0;
  var _isVisible = true;

  bool _isVisibleImage = true;

  var arrIndex = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  var userName = [
    "Ravi",
    "Ramesh",
    "Rajesh",
    "Rakesh",
    "Rohit",
    "Rahul",
    "Ranjan",
    "Raghav",
    "Rupesh",
    "Ritesh",
    "Suresh",
    "Sandeep",
    "Sanjay",
    "Satyam",
    "Saurabh",
    "Shivam",
    "Shubham",
    "Sumit",
    "Sunil",
    "Suraj",
    "Uday",
    "Umesh",
    "Uttam",
    "Vikash",
    "Vishal",
    "Vivek",
    "Yogesh",
    "Yash",
    "Yuvraj",
  ];

  var userList = [
    {"id": 1, "name": "Ravi", "email": "ravi@gmail.com"},
    {"id": 2, "name": "Ramesh", "email": "ramesh@gmail.com"},
    {"id": 3, "name": "Rajesh", "email": "rajesh@gmail.com"},
    {"id": 4, "name": "Rakesh", "email": "rakesh@gmail.com"},
    {"id": 5, "name": "Rohit", "email": "rohit4@gmail.com"},
    {"id": 6, "name": "Rahul", "email": "rahul485@gmail.com"},
    {"id": 7, "name": "Ranjan", "email": "ranjan@gmail.com"},
    {"id": 8, "name": "Raghav", "email": "raghav@gmail.com"},
    {"id": 9, "name": "Rupesh", "email": "rupesh@gmail.com"},
    {"id": 10, "name": "Ritesh", "email": "ritesh@gmail.com"},
  ];

  // late Animation animation;
  // late Animation colorAnimation;
  // late AnimationController animationController;

  // @override
  // void initState() {
  //   super.initState();

  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 10),
  //   );
  //   animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
  //   colorAnimation = ColorTween(begin: const Color.fromARGB(255, 228, 21, 56), end: const Color.fromARGB(255, 196, 49, 209)).animate(animationController);

  //   animationController.addListener(() {
  //     print(animation.value);
  //     setState(() {

  //     });
  //   });

  //   animationController.forward();

  // }

  // late Animation _animation;
  late AnimationController _animationController;

  // @override
  // void initState() {
  //   super.initState();

  //   _animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 5),
  //     lowerBound: 0.5,
  //   );
  //   // _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

  //   _animationController.addListener(() {
  //     setState(() {});
  //   });

  //   _animationController.forward();
  // }

  var radiusList = [150.0, 200.0, 250.0, 300.0, 350.0];

  var profileName;
  var profileNameController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   loadProfile();
  // }

  void loadProfile() async {
    final name = await getValue();

    setState(() {
      profileName = name;
      profileNameController.text = name;
    });
  }

  List<Map<String, dynamic>> allNotes = [];
  DBHelper? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = DBHelper.getInstance;
    getNotes();
  }

  void getNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  var notes_title = TextEditingController();
  var notes_desc = TextEditingController();
  String err_msg = '';

  void addNote(BuildContext context) async {
    err_msg = '';
    if (notes_title.text.trim().isEmpty || notes_desc.text.trim().isEmpty) {
      setState(() {
        err_msg = "Please fill all fields";
      });
      return;
    }

    bool check = await dbRef!.addNotes(
      title: notes_title.text,
      description: notes_desc.text,
    );

    if (check) {
      notes_title.clear();
      notes_desc.clear();
      getNotes();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please Try again")));
    }
  }

  void deleteNote(BuildContext context, int id) async {
    bool check = await dbRef!.deleteNote(id: id);
    if (!check)
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please Try Again")));
    getNotes();
  }

  void editNote(BuildContext context, int id) async {
    err_msg = '';
    if (notes_title.text.trim().isEmpty || notes_desc.text.trim().isEmpty) {
      setState(() {
        err_msg = "Please fill all fields";
      });
      return;
    }

    bool check = await dbRef!.updateNote(
      id: id,
      title: notes_title.text,
      description: notes_desc.text,
    );

    if (check) {
      notes_title.clear();
      notes_desc.clear();
      err_msg = '';
      getNotes();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please Try again")));
    }
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      /*
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      */
      // // TOPICS : CONTAINER WIDGET :-
      // body : Center(
      //   child : Container(
      //   width : 100,
      //   height :  100,
      //   color : const Color.fromARGB(255, 205, 255, 68),
      //   child : Text("Hi From Uday")
      //   )
      // )

      // // TOPICS : CENTER WIDGET :-
      // body: Center(
      //   child: Container(
      //     width: 200,
      //     height: 100,
      //     color: Colors.grey,
      //     child: Center(
      //       child: Text(
      //         "Hi Uday",
      //         style: TextStyle(
      //           fontFamily: 'Pacifico',
      //           fontStyle: FontStyle.italic,
      //           fontSize: 30,
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // // TOPICS : TEXT WIDGET :-
      // body: Text(
      //   "Hi Uday",
      //   style: TextStyle(
      //     fontSize: 24,
      //     color: Colors.lightBlue,
      //     fontWeight: FontWeight.w200,
      //     backgroundColor: Colors.lightGreen[200],
      //   ),
      // ),

      // // TOPICS : BUTTON WIDGET :-
      //   // SUB-TOPIC : TEXT BUTTON WIDGET :-
      // body: TextButton(
      //   child: Text("Buy Now"),
      //   onPressed: () {
      //     print("User Click on Button");
      //   },
      //   onLongPress: () => {print("Long Press Executed.")},
      // ),

      // // // TOPICS : BUTTON WIDGET :-
      // //   // SUB-TOPIC : ELEVATED BUTTON WIDGET :-
      // body: ElevatedButton(
      //   child: Text("Buy Now"),
      //   onPressed: () {
      //     print("User Click");
      //   },
      // ),

      // // // TOPICS : BUTTON WIDGET :-
      // //   // SUB-TOPIC : OUTLINED BUTTON WIDGET :-
      // body: OutlinedButton(
      //   onPressed: () {
      //     print("Button Pressed");
      //   },
      //   child: Text("Click Now !"),
      // ),

      // // // TOPICS : IMAGE WIDGET :-
      // body : Center(
      //   child : Image.asset("assets/images/user-image-02.png")
      // )

      // // // // TOPICS : COLUMNS AND ROWS WIDGET :-
      // //   // SUB-TOPIC : COLUMNS WIDGET :-
      //  body: Container(
      //   height: 500,
      //   width: 500,
      //   color: Colors.red,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     children: [
      //       Text("A", style: TextStyle(fontSize: 25)),
      //       Text("B", style: TextStyle(fontSize: 25)),
      //       Text("C", style: TextStyle(fontSize: 25)),
      //       Text("D", style: TextStyle(fontSize: 25)),
      //       Text("E", style: TextStyle(fontSize: 25)),
      //       ElevatedButton(child: Text("Buy Now !") , onPressed: () {},)
      //     ],
      //   ),
      // ),

      // // // // TOPICS : COLUMNS AND ROWS WIDGET :-
      // //   // SUB-TOPIC : ROWS WIDGET :-
      // body: Container(
      //   height: 300,
      //   width: 500,
      //   color: Colors.red,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     crossAxisAlignment: CrossAxisAlignment.end,
      //     children: <Text>[
      //       Text("A", style: TextStyle(fontSize: 25)),
      //       Text("B", style: TextStyle(fontSize: 25)),
      //       Text("C", style: TextStyle(fontSize: 25)),
      //       Text("D", style: TextStyle(fontSize: 25)),
      //       Text("E", style: TextStyle(fontSize: 25)),
      //     ],
      //   ),
      // ),

      // // // // // TOPICS : COLUMNS AND ROWS WIDGET :-
      // // //   // SUB-TOPIC :COLUMNS AND ROWS:-
      // body: Container(
      //   height : 500,
      //   color:  Colors.lightGreen,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Text("R1-A", style: TextStyle(fontSize: 22)),
      //           Text("R1-B", style: TextStyle(fontSize: 22)),
      //           Text("R1-C", style: TextStyle(fontSize: 22)),
      //           Text("R1-D", style: TextStyle(fontSize: 22)),
      //           Text("R1-E", style: TextStyle(fontSize: 22)),
      //         ],
      //       ),
      //       Text("A", style: TextStyle(fontSize: 22)),
      //       Text("B", style: TextStyle(fontSize: 22)),
      //       Text("C", style: TextStyle(fontSize: 22)),
      //       Text("D", style: TextStyle(fontSize: 22)),
      //       Text("E", style: TextStyle(fontSize: 22)),
      //     ],
      //   ),
      // ),

      // // // TOPICS : INKWELL WIDGET :-
      // body: Center(
      //   child: InkWell(
      //     onTap: () => {print("User Perform Tap Operation")},
      //     onLongPress: () {
      //       print("User Perform Long Press Operation");
      //     },
      //     onDoubleTap: () => {print("User Perform Double Tap Operation")},
      //     child: Container(
      //       height: 100,
      //       width: 100,
      //       color: Colors.tealAccent,
      //       child: Center(
      //         child: InkWell(
      //           onTap: () => print("User Click on Text."),
      //           child: Text("Click Here !"),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),

      // // // TOPICS : SINGLE CHILD SCROLL VIEW WIDGET :-
      // body: SingleChildScrollView(
      //     // scrollDirection: Axis.vertical,
      //   child: Padding(
      //     padding: EdgeInsetsGeometry.all(8.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: Row(
      //             children: [
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.tealAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 1 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.lime,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 2 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.redAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 3 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.orange,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 4 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.greenAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 5 "),
      //               ),
      //              Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.tealAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 6 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.lime,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 7 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.redAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 8 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.orange,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 9 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.greenAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 10 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.tealAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 11 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.lime,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 12 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.redAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 13 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.orange,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 14 "),
      //               ),
      //               Container(
      //                 height: 200,
      //                 width: 200,
      //                 color: Colors.greenAccent,
      //                 margin: EdgeInsets.all(2.0),
      //                 child: Text("BOX - 15 "),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           height: 200,
      //           width: 200,
      //           color: Colors.tealAccent,
      //           margin: EdgeInsets.only(bottom: 10),
      //           child: Text("BOX - 1 "),
      //         ),
      //         Container(
      //           height: 200,
      //           width: 200,
      //           color: Colors.lime,
      //           margin: EdgeInsets.only(bottom: 10),
      //           child: Text("BOX - 2 "),
      //         ),
      //         Container(
      //           height: 200,
      //           width: 200,
      //           color: Colors.redAccent,
      //           margin: EdgeInsets.only(bottom: 10),
      //           child: Text("BOX - 3 "),
      //         ),
      //         Container(
      //           height: 200,
      //           width: 200,
      //           color: Colors.orange,
      //           margin: EdgeInsets.only(bottom: 10),
      //           child: Text("BOX - 4 "),
      //         ),
      //         Container(
      //           height: 200,
      //           width: 200,
      //           color: Colors.greenAccent,
      //           margin: EdgeInsets.only(bottom: 10),
      //           child: Text("BOX - 5 "),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // // // TOPICS : LISTVIEW AND ITS COMPONENTS :-
      // //   // SUB-TOPIC : LISTVIEW WIDGET :-
      // body: Center(
      //   child: ListView(
      //     scrollDirection:Axis.horizontal,
      //     reverse: true,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           "one",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           "two",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           "three",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           "four",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text(
      //           "five",
      //           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // // // TOPICS : LISTVIEW AND ITS COMPONENTS :-
      // //   // SUB-TOPIC : LISTVIEW BUILDER WIDGET :-
      // body : ListView.builder(
      //   itemCount: user_name.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Text(user_name[index] , style: TextStyle(fontSize: 21 , fontWeight: FontWeight.w600));
      //   },
      //   // reverse: true,
      //   itemExtent: 100,
      //   scrollDirection: Axis.horizontal,
      // ),

      // // // TOPICS : LISTVIEW AND ITS COMPONENTS :-
      // //   // SUB-TOPIC : LISTVIEW SEPERATOR WIDGET :-
      // body : ListView.separated(
      //   itemCount: user_name.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return Text(user_name[index] , style: TextStyle(fontSize: 21 , fontWeight: FontWeight.w600));
      //   },
      //   separatorBuilder: (context, index) {
      //     return Divider(height:4 , thickness: 4,);
      //   },
      // ),

      // // // // TOPICS : BOX DECORATION  :-
      // body : Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   color: Colors.blue.shade50,
      //   child: Center(
      //     child: Container(
      //       width: 100,
      //       height: 100,
      //       decoration: BoxDecoration(
      //         color: Colors.blueGrey,
      //         // borderRadius: BorderRadius.circular(10)
      //         // borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , bottomRight: Radius.circular(20)),
      //         border: Border.all(color: Colors.black54 , width: 2),
      //         boxShadow: [BoxShadow(
      //           color: const Color.fromARGB(66, 24, 23, 23),
      //           blurRadius: 5,
      //           spreadRadius: 7
      //         )],
      //         shape: BoxShape.circle
      //       ),
      //     ),
      //   ),
      // )

      // // TOPICS : EXPANDED WIDGET  :-
      // body: Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Column(
      //       children: [
      //         Expanded(
      //           child: Container(width: 50, height: 100, color: Colors.blue),
      //           flex: 3,
      //         ),
      //         Expanded(
      //           child: Container(width: 50, height: 100, color: Colors.red),
      //           flex: 1,
      //         ),
      //         Expanded(
      //           child: Container(width: 50, height: 100, color: Colors.amber),
      //           flex: 1,
      //         ),
      //         Expanded(
      //           child: Container(width: 50, height: 100, color: Colors.green),
      //           flex: 1,
      //         ),
      //         Expanded(
      //           child: Container(width: 50, height: 100, color: Colors.pink),
      //           flex: 1,
      //         ),
      //         Expanded(
      //           child: Container(
      //             width: 50,
      //             height: 100,
      //             color: Colors.tealAccent,
      //           ),
      //           flex: 3,
      //         ),
      //       ],
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.blue),
      //       flex: 1,
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.red),
      //       flex: 1,
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.amber),
      //       flex: 1,
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.green),
      //       flex: 1,
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.pink),
      //       flex: 1,
      //     ),
      //     Expanded(
      //       child: Container(width: 50, height: 100, color: Colors.tealAccent),
      //       flex: 2,
      //     ),
      //   ],
      // ),

      // // TOPICS : MARGIN & PADDING  :-
      // body: Padding(
      //   // padding: const EdgeInsets.all(8.0),
      //   padding: EdgeInsetsGeometry.only(left: 10),
      //   child: Container(
      //     height: 50,
      //     width: 200,
      //     color: Colors.cyan,
      //     margin: EdgeInsets.all(8.0), // provides space form outside
      //     padding: EdgeInsets.all(8.0), // provides space form inside
      //     child: Text(
      //       "Hello World",
      //       style: TextStyle(fontSize: 24, color: Colors.white),
      //     ),
      //   ),
      // ),

      // // // TOPICS : LIST TILE  :-
      // body: ListView.separated(
      //   itemCount: user_name.length,
      //   separatorBuilder: (BuildContext context, int index) {
      //     return Divider(
      //       thickness: 4,
      //       height: 10,
      //     );
      //   },
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       leading: Text("${index + 1}"),
      //       title: Text(user_name[index]),
      //       subtitle: Text("Person ${index + 1} is ${user_name[index]}"),
      //       trailing: Icon(Icons.add)
      //     );
      //   },
      // ),

      // // TOPICS : CIRCLE AVATAR  :-
      // body: Center(
      //   child: CircleAvatar(
      //     child: Text("U", style: TextStyle(fontSize: 18)),
      //     backgroundImage: AssetImage("assets/images/user-image-02.png"),
      //     backgroundColor: Colors.greenAccent,
      //     radius: 50,
      //     // minRadius: 20,
      //     // maxRadius: 100,
      //   ),
      // ),

      // // // TOPICS : CUSTOM FONT  :-
      // body: Text("hello world" , style: TextStyle(fontFamily: 'Volkhov' , fontSize: 20)),

      // // // TOPICS : STYLES AND THEMES  :-
      // body: Column(
      //   children: [
      //     Text("Hello World", style: mTextStyleColor(Theme.of(context).textTheme.headlineLarge,Colors.orange)),
      //     Text("Hello World", style: Theme.of(context).textTheme.headlineMedium),
      //     Text("Hello World", style: Theme.of(context).textTheme.headlineSmall),
      //     Text("Hello World", style: mTextStyleColor(Theme.of(context).textTheme.headlineLarge,Colors.green)),
      //     Text("Hello World", style: Theme.of(context).textTheme.headlineMedium),
      //     Text("Hello World", style: Theme.of(context).textTheme.headlineSmall),
      //   ],
      // ),

      // // // TOPICS : CARD WIDGET :-
      // body: Center(
      //   child: Card(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Text("Hello World", style: TextStyle(fontSize: 24),),
      //     ),
      //   ),
      // ),

      // // // TOPICS : TEXT INPUT WIDGET :-
      // body: Center(
      //   child: Container(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextField(
      //           controller: emailText,
      //           keyboardType: TextInputType.emailAddress,
      //           // enabled: false,
      //           decoration: InputDecoration(
      //             hint: Text("Enter Your Email"),
      //             enabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.amber, width: 2),
      //               // borderRadius: BorderRadius.circular(21)
      //               borderRadius: BorderRadius.all(Radius.circular(20)),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.cyan, width: 2),
      //               // borderRadius: BorderRadius.circular(21)
      //               borderRadius: BorderRadius.all(Radius.circular(20)),
      //             ),
      //             disabledBorder: OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.red, width: 2),
      //               // borderRadius: BorderRadius.circular(21)
      //               borderRadius: BorderRadius.all(Radius.circular(20)),
      //             ),
      //             // suffixText: "hi",
      //             // suffixIcon: IconButton(
      //             //   onPressed: () {},
      //             //   icon: Icon(Icons.remove_red_eye, color: Colors.red),
      //             // ),
      //             prefixIcon: Icon(Icons.email),
      //           ),
      //         ),
      //         Container(height: 11),
      //         TextField(
      //           keyboardType: TextInputType.phone,
      //           controller: phoneText,
      //           decoration: InputDecoration(
      //             hint: Text("Enter Your Phone No"),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //             ),
      //             prefixIcon: Icon(Icons.call),
      //             disabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: BorderSide(color: Colors.red, width: 2),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: BorderSide(color: Colors.amber, width: 2),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: BorderSide(color: Colors.cyan, width: 2),
      //             ),
      //           ),
      //         ),
      //         Container(height: 11),
      //         TextField(
      //           controller: passwordText,
      //           obscureText: true,
      //           obscuringCharacter: '*',
      //           decoration: InputDecoration(
      //             hint: Text("Enter Your Password"),
      //             disabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(20)),
      //               borderSide: BorderSide(color: Colors.red, width: 2),
      //             ),
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.all(Radius.circular(20)),
      //               borderSide: BorderSide(color: Colors.amber, width: 2),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20),
      //               borderSide: BorderSide(color: Colors.cyan, width: 2),
      //             ),
      //             prefixIcon: Icon(Icons.lock),
      //             suffixIcon: IconButton(
      //               onPressed: () {},
      //               icon: Icon(Icons.remove_red_eye),
      //               color: Colors.red,
      //             ),
      //           ),
      //         ),
      //         Container(height: 11),
      //         ElevatedButton(
      //           onPressed: () {
      //             print(
      //               "Email : ${emailText.text.toString()} , Mobile : ${phoneText.text.toString()} and Password : ${passwordText.text.toString()} ",
      //             );
      //           },
      //           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      //           child: Text("Login" , style: TextStyle(color: Colors.white),),
      //         ),
      //       ],
      //     ),
      //     width: 200,
      //   ),
      // ),

      // // // // TOPICS : GETTING CURRENT DATE & TIME :-
      // body: Center(
      //   child: Container(
      //     width: 500,
      //     height: 200,
      //     child: Column(
      //       children: [
      //         Text("Current Time : ${DateFormat('jms').format(time)}", style: TextStyle(fontSize: 24)),
      //         ElevatedButton(
      //           onPressed: () {
      //             // print("time : ${time}");
      //             // time = DateTime.now(); // it will change value but not reflect in ui
      //             setState(() {
      //                 time = DateTime.now();
      //             });
      //           },
      //           child: Text("Current Time"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // // // // TOPICS : DATE PICKER :-
      // body: Center(
      //   child: Container(
      //     height: 200,
      //     child: Column(
      //       children: [
      //         Text("Select Date ", style: TextStyle(fontSize: 24)),
      //         ElevatedButton(
      //           onPressed: () async {
      //             DateTime? datePicked = await showDatePicker(
      //               context: context,
      //               firstDate: DateTime(1990),
      //               lastDate: DateTime.now(),
      //             );
      //             if (datePicked != null) {
      //               print(datePicked);
      //             }
      //           },
      //           child: Text("Show Date"),
      //         ),
      //         ElevatedButton(
      //           onPressed: () async {
      //             TimeOfDay? timePicked = await showTimePicker(
      //               context: context,
      //               initialTime: TimeOfDay.now(),
      //               initialEntryMode: TimePickerEntryMode.input
      //             );
      //             if (timePicked != null) {
      //               print(timePicked);
      //             }
      //           },
      //           child: Text("Show Time"),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // // // TOPICS : GRID VIEW :-
      // // // SUB TOPIC : GRIDVIEW COUNT -
      // body: Container(
      //   width: 200,
      //   height: 200,
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: GridView.count(
      //       crossAxisSpacing: 8,
      //       mainAxisSpacing: 8,
      //       crossAxisCount: 3,
      //       children: <Widget>[
      //         for (var i = 0; i < colorList.length; i++)
      //           Container(
      //             color: colorList[i],
      //             child: Center(
      //               child: Text("${i}", style: TextStyle(color: Colors.white)),
      //             ),
      //           ),
      //       ],
      //     ),
      //   ),
      // ),

      // // // // TOPICS : GRID VIEW :-
      // // // // SUB TOPIC : GRIDVIEW EXTENT -
      // body: Container(
      //   height: 400,
      //   child: GridView.extent(
      //     maxCrossAxisExtent: 200,
      //     children: <Widget>[
      //       for (var i = 0; i < colorList.length; i++)
      //         Container(
      //           color: colorList[i],
      //           child: Center(
      //             child: Text("${i}", style: TextStyle(color: Colors.white)),
      //           ),
      //         ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : GRID VIEW :-
      // // // // SUB TOPIC : GRIDVIEW BUILDER -
      // body: GridView.builder(
      //   // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   //   crossAxisCount: 3,
      //   // ),
      //    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
      //   itemBuilder: (context, index) {
      //     return Container(color: colorList[index]);
      //   },
      //   itemCount: colorList.length,
      // ),

      // // // // TOPICS : CALLBACK FUNCTION :-
      // body: ElevatedButton(onPressed: buttonPress, child: Text("Click Me!")),

      // // // // TOPICS : CUSTOM WIDGET :-
      // body: Column(
      //   children: [CatItems(), Contact(), SubCartItem(), BottomMenu()],
      // ),

      // // // // TOPICS : STACK WIDGET :-
      // body: Stack(
      //   children: [
      //     Container(width: 200, height: 200, color: Colors.blue),
      //     Container(width: 180, height: 180, color: Colors.green),
      //     Container(width: 160, height: 160, color: Colors.red),
      //     Container(width: 140, height: 140, color: Colors.yellow),
      //     Positioned(
      //       left: 20,
      //       top: 20,
      //       child: Container(width: 120, height: 120, color: Colors.deepPurpleAccent),
      //     ),
      //     Positioned(
      //       left: 40,
      //       top: 40,
      //       child: Container(width: 100, height: 100, color: Colors.tealAccent),
      //     ),
      //   ],
      // ),

      // // // // TOPICS : CUSTOM WIDGET :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 200,
      //         height: 50,
      //         child: RoundedButton(
      //           btnName: "Play Now!!",
      //           icon: Icon(Icons.play_arrow),
      //           callBack: () => print("Play Button Clicked!"),
      //           bgColor: Colors.red,
      //           textStyle: TextStyle(color : Colors.yellow),
      //         ),
      //       ),
      //       Container(height: 15,),
      //       Container(
      //         width: 200,
      //         height: 50,
      //         child: RoundedButton(
      //           btnName: "Click Me!",
      //           icon: Icon(Icons.lock),
      //           callBack: () => print("Button Clicked!"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : WRAP WIDGET :-
      // body: Container(
      //   width:double.infinity,
      //   child: Wrap(
      //     direction: Axis.horizontal,
      //     spacing: 10,
      //     runSpacing: 10,
      //     alignment: WrapAlignment.center,
      //     children: [
      //       Container(width: 100, height: 100, color: Colors.red),
      //       Container(width: 100, height: 100, color: Colors.teal),
      //       Container(width: 100, height: 100, color: Colors.yellow),
      //       Container(width: 100, height: 100, color: Colors.deepPurpleAccent),
      //       Container(width: 100, height: 100, color: Colors.lightGreenAccent),
      //       Container(width: 100, height: 100, color: Colors.grey),
      //       Container(width: 100, height: 100, color: Colors.brown),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : SIZEBOX WIDGET :-
      // body: Row(
      //   children: [
      //     SizedBox(
      //       width :100,
      //       height: 50,
      //       child: ElevatedButton(onPressed: () {}, child: Text("Button"))
      //     ),
      //     SizedBox(width: 10,),
      //      SizedBox(
      //       width :100,
      //       height: 50,
      //       child: ElevatedButton(onPressed: () {}, child: Text("Button"))
      //     ),
      //   ],
      // ),

      // // // // TOPICS : RICH TEXT WIDGET :-
      // body: RichText(
      //   text: TextSpan(
      //     style: TextStyle(color: Colors.grey, fontSize: 14),
      //     children: [
      //       TextSpan(text: "Hello "),
      //       TextSpan(text: "World " , style : TextStyle(color: Colors.red, fontSize: 20)),
      //       TextSpan(text: "Uday!!!!",style : TextStyle(fontFamily: "Volkhov" , fontSize: 30)),
      //     ],
      //   ),
      // ),

      // // // // // TOPICS : ICON WIDGET :-
      // body: Icon(Icons.camera_outdoor_outlined , color: Colors.teal,),

      // // // // TOPICS : AWASOME ICON WIDGET :-
      // body : FaIcon(FontAwesomeIcons.amazon , color: Colors.teal,)

      // // // // TOPICS : POSITIONED WIDGET :-
      // body: Container(
      //   height: 500,
      //   width: 200,
      //   color: Colors.indigo,
      //   child: Stack(
      //     children: [
      //       Positioned(
      //         bottom: 10,
      //         right: 50,
      //         child: Container(
      //           height: 200,
      //           width : 100,
      //           color: Colors.red,
      //         ),
      //       )
      //     ]
      //   ),
      // ),

      // // // // TOPICS :-
      // body: Center(
      //   child: Container(
      //     height: 350,
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: TextField(
      //               keyboardType: TextInputType.number,
      //               controller: firstValueController,
      //               decoration: InputDecoration(
      //                 labelText: "Enter First Value",
      //                 border: OutlineInputBorder(),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.lightGreenAccent),
      //                 ),
      //                 errorBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.red),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: TextField(
      //               keyboardType: TextInputType.number,
      //               controller: secondValueController,
      //               decoration: InputDecoration(
      //                 labelText: "Enter Second Value",
      //                 border: OutlineInputBorder(),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.lightGreenAccent),
      //                 ),
      //                 errorBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.red),
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 ElevatedButton(
      //                   onPressed: () => calculation('+'),
      //                   child: Icon(Icons.add, color: Colors.white),
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.lightBlueAccent,
      //                   ),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () => calculation('-'),
      //                   child: FaIcon(
      //                     FontAwesomeIcons.minus,
      //                     color: Colors.white,
      //                   ),
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.lightBlueAccent,
      //                   ),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () => calculation('*'),
      //                   child: FaIcon(
      //                     FontAwesomeIcons.xmark,
      //                     color: Colors.white,
      //                   ),
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.lightBlueAccent,
      //                   ),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () => calculation('/'),
      //                   child: FaIcon(
      //                     FontAwesomeIcons.divide,
      //                     color: Colors.white,
      //                   ),
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: Colors.lightBlueAccent,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: TextField(
      //               controller: resultController,
      //               readOnly: true,
      //               decoration: InputDecoration(border: OutlineInputBorder()),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: Text("result is : ${resultValue}"),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      // // // // TOPICS : CONSTRAINT BOX :-
      // body: ConstrainedBox(
      //   child: Text(
      //     "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ",
      //   ),
      //   constraints: BoxConstraints(maxWidth: 100, maxHeight: 200),
      // ),

      // // // // // TOPICS : SWITCHING FROM ONE SCREEN TO ANOTHER SCREEN :-
      // body: Center(child: Container(child: Text("Welcome to Home Page"))),

      // // // // TOPICS : SPLASH SCREEN :-
      // body: Center(child: Container(child: Text("Welcome to Home Page"))),

      // // // // TOPICS : PASSING DATA FROM ONE SCREEN TO ANOTHER SCREEN  :-
      // body: Center(
      //   child: Container(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: TextField(
      //             controller: nameController,
      //             decoration: InputDecoration(border: OutlineInputBorder() , hint: Text("Enter Your Name!!!")),
      //           ),
      //         ),
      //         ElevatedButton(onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(userName: nameController.text.toString(),)));
      //         }, child: Text("Click To View Profile"))
      //       ],
      //     ),
      //   ),
      // ),

      // // // // TOPICS : RANGE SLIDER :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Start : ${values.start} and End :  ${values.end}"),
      //       SizedBox(height: 10),
      //       RangeSlider(
      //         min: 0,
      //         max: 100,
      //         values: values,
      //         labels: labels,
      //         divisions: 5,
      //         activeColor: Colors.greenAccent,
      //         inactiveColor: Colors.lightBlue,
      //         onChanged: (newValue) {
      //           setState(() {
      //             values = newValue;
      //           });
      //           // print("${newValue.start} ${newValue.end}");
      //         },
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : FOO ANIMATION :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       AnimatedContainer(
      //         width: _width,
      //         height: _height,
      //         duration: Duration(seconds: 2),
      //         color: _color,
      //         curve: Curves.bounceIn,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ElevatedButton(
      //           onPressed: () {
      //             setState(() {
      //               if (_isAnimated) {
      //                 _width = 200.0;
      //                 _height = 50.0;
      //                 _color = Colors.green;
      //               } else {
      //                 _width = 100.0;
      //                 _height = 100.0;
      //                 _color = Colors.red;
      //               }
      //               _isAnimated = !_isAnimated;
      //             });
      //           },
      //           child: Text("Click Here !!!"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : ANIMATED OPACITY :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       AnimatedOpacity(
      //         opacity: _opacity,
      //         duration: Duration(seconds: 1),
      //         curve: Curves.bounceInOut,
      //         child: Container(
      //           width: 200,
      //           height: 100,
      //           color: Colors.tealAccent,
      //         ),
      //       ),
      //       SizedBox(height: 10),
      //       ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             if (_isAnimated) {
      //               _opacity = 0.0;
      //             } else {
      //               _opacity = 1.0;
      //             }
      //             _isAnimated = !_isAnimated;
      //           });
      //         },
      //         child: Text("Click Here !!!"),
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : CROSS FADE :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       AnimatedCrossFade(
      //         firstChild: Container(
      //           height: 300,
      //           width: 300,
      //           color: Colors.amber,
      //         ),
      //         secondChild: Container(
      //           height: 150,
      //           width: 150,
      //           child: Image.asset('assets/images/user-image-01.jpg'),
      //         ),
      //         crossFadeState: _isVisibleImage
      //             ? CrossFadeState.showFirst
      //             : CrossFadeState.showSecond,
      //         duration: Duration(seconds: 2),
      //         sizeCurve: Curves.bounceInOut,
      //       ),
      //       SizedBox(height: 10),
      //       ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             _isVisibleImage = !_isVisibleImage;
      //           });
      //         },
      //         child: Text("Click Here !!!"),
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : HERO ANIMATION :-
      // body: Center(
      //   child: InkWell(
      //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FlowerDetails())),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       child: Hero(tag  : "flower",child: Image.asset('assets/images/flower/flower-02.jpg')),
      //     ),
      //   ),
      // ),

      // // // // TOPICS : LIST WHEEL SCROLLVIEW :-
      // body: ListWheelScrollView(
      //   itemExtent: 200,
      //   children: arrIndex
      //       .map((index) => Container(width: 200, color: Colors.blue))
      //       .toList(),
      // ),

      // // // // TOPICS : CLIP RRECT :-
      // body: Center(
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.all(Radius.elliptical(10, 60)),
      //     // child: Container(color: Colors.redAccent, width: 200, height: 200),
      //     child: Image.asset('assets/images/flower/flower-02.jpg', width: 300, height: 150, fit: BoxFit.cover,),
      //   ),
      // ),

      // // // // TOPICS : how to add gradient as app background  :-
      // body: Container(
      //   decoration: BoxDecoration(
      //     // gradient: LinearGradient(colors: [Colors.orange, Colors.yellow, Colors.purple, Colors.pink, Colors.red],)
      //     // gradient: LinearGradient(
      //     //   colors: [
      //     //     Color(0xff20E2D7),
      //     //     Color.fromARGB(255, 255, 41, 244),
      //     //     Color(0xffF9FEA5),
      //     //   ],
      //     //   // begin: FractionalOffset(1.0, 0.5),
      //     //   // end: FractionalOffset(0.5, 1.0),
      //     //   stops: [0.0, 0.2, 1.0],
      //     // ),
      //      gradient: RadialGradient(
      //       colors: [
      //         Color(0xff20E2D7),
      //         Color.fromARGB(255, 255, 41, 244),
      //         Color(0xffF9FEA5),
      //       ],
      //       center: Alignment.center,
      //       stops: [0.0, 0.2, 1.0],
      //     ),
      //   ),
      // ),

      // // // // TOPICS : MAPPING LISTS TO WIDGETS  :-
      // body: ListView(
      //   children: userName.map((name) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(child: Text(name)),
      //     );
      //   }).toList(),
      // ),
      // body: ListView(
      //   children: userList.map((user) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //         child: Row(
      //           children: [
      //             CircleAvatar(child: Text("${user["id"]}"),),
      //             SizedBox(width: 10),
      //             Column(
      //               children: [Text("${user["name"]}"), Text("${user["email"]}")],
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   }).toList(),
      // ),

      // // // // TOPICS : TWIN ANIMATION  :-
      // body: Center(child: Container(
      //   width : animation.value,
      //   height : animation.value,
      //   color : colorAnimation.value,
      // )),

      // // // // TOPICS : RIPPLE EFFECT ANIMATION  :-
      // body: Center(
      //   child: Stack(
      //     alignment: Alignment.center,
      //     children: [
      //       for(var i = 0 ; i< radiusList.length; i++) buildRippleContainer(radiusList[i]),
      //       Icon(Icons.call, color: Colors.white, size: 50),
      //     ]
      //   ),
      // ),

      // // // // TOPICS : SHARED PREFERENCES :-
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text("Profile Name : ${profileName}"),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: TextField(
      //           controller: profileNameController,
      //           decoration: InputDecoration(
      //             border: OutlineInputBorder(),
      //             hint: Text("Enter Profile Name"),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: ElevatedButton(
      //           onPressed: () async {
      //             var prefs = await SharedPreferences.getInstance();
      //             prefs.setString(
      //               "profileName",
      //               profileNameController.text.toString(),
      //             );
      //             setState(() {
      //               profileName = profileNameController.text.toString();
      //               profileNameController.text = "";
      //             });
      //           },
      //           child: Text("Save Profile Name"),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      // // // // TOPICS : SAVE DATA LOCALLY USING SQLITE :-
      body: allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text("${allNotes[index][DBHelper.COLUMN_TITLE]}"),
                  subtitle: Text(
                    "${allNotes[index][DBHelper.COLUMN_DESCRIPTION]}",
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        child: Icon(
                          Icons.edit,
                          color: Colors.limeAccent.shade100,
                        ),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            notes_title.text =
                                allNotes[index][DBHelper.COLUMN_TITLE];
                            notes_desc.text =
                                allNotes[index][DBHelper.COLUMN_DESCRIPTION];
                            return bottomModel(
                              isNew: false,
                              id: allNotes[index][DBHelper.COLUMN_S_NO],
                            );
                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.delete, color: Colors.red.shade500),
                        onTap: () => deleteNote(
                          context,
                          allNotes[index][DBHelper.COLUMN_S_NO],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(child: Text("No Notes Found")),

      /*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // dbRef!.addNotes(
          //   title: "Test Notes",
          //   description: "TEsting notes fo use ",
          // );
          // getNotes();

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return bottomModel();
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildRippleContainer(double radius) {
    return Container(
      width: radius * _animationController.value,
      height: radius * _animationController.value,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.greenAccent.withOpacity(1.0 - _animationController.value),
      ),
    );
  }

  Widget bottomModel({bool isNew = true, int? id}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              isNew ? "Add Notes" : "Edit Notes",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            TextField(
              controller: notes_title,
              decoration: InputDecoration(
                hint: Text("Enter Title"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: notes_desc,
              minLines: 4,
              maxLines: null,
              decoration: InputDecoration(
                hint: Text("Enter Description"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () =>
                        isNew ? addNote(context) : editNote(context, id!),
                    child: Text(isNew ? "Add Notes" : "Edit Notes"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      err_msg = '';
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            if (err_msg.isNotEmpty) Text("$err_msg"),
          ],
        ),
      ),
    );
  }
}

Future<String> getValue() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString("profileName") ?? "";
}

class CatItems extends StatelessWidget {
  const CatItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Center(child: Text("${index + 1}")),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Container(
        color: Colors.orange,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("User - ${index + 1}"),
              subtitle: Text("Mobile No : +91-xxxxxxxxxx"),
              leading: CircleAvatar(backgroundColor: Colors.green),
              trailing: Icon(Icons.delete),
            );
          },
        ),
      ),
    );
  }
}

class SubCartItem extends StatelessWidget {
  const SubCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Experiment Lab 😊"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Counter : $count"),
              SizedBox(height: 10),
              Container(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 10),
                      Text("Increse count"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
