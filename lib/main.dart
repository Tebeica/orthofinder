import 'dart:html';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

int mainCol = 0xFF314351; // text and icon
int secondaryCol = 0xFF9DB150;
int backgroundCol = 0xFFF1F1F3;
int miscCol1 = 0xFF7D8B6F; // #2 but faded
int miscCol2 = 0xFF2B5048; //dark green? gray?
int miscCol3 = 0xFFFF502E; //bright orange, button col
int miscCol4 = 0xFF8BC641; //bright green
int pastelPink = 0xFFFEC8D8;
int pastelBlue = 0xFFE0BBE4;
int logoGreen = 0xFF8bc641;
String defaultFont = "Helvetica";
String accIcon = '/iconAcc.png';
String treatmentIcon = '/iconTreatment.png';
String insuranceIcon = '/iconInsurance.png';
String dentistIcon = '/iconDentist.png';
String dollarIcon = '/dollarIcon.png';
String dentistTreatIcon = '/dentistTreatmentIcon.png';
String photoIcon = '/photoIconW.png';
String xrayIcon = '/xrayIcon.png';
String commentIcon = '/commentsIconW.png';

int dentist1Price = 1477;
int dentist2Price = 2039;
int dentist3Price = 1660;
int dentist4Price = 1874;

double dentist1Rating = 2.8;
double dentist2Rating = 4.7;
double dentist3Rating = 3.9;
double dentist4Rating = 4.3;

int dentist1Practicing = 2016;
int dentist2Practicing = 2010;
int dentist3Practicing = 2009;
int dentist4Practicing = 2006;

String dentist1Name = "Andrea Capon";
String dentist2Name = "John Teller";
String dentist3Name = "Anna Smith";
String dentist4Name = "Jennifer Jenkins";

String dentist1Photo = "/dentist1.jpg";
String dentist2Photo = "/dentist2.jpg";
String dentist3Photo = "/dentist3.jpg";
String dentist4Photo = "/dentist4.jpg";

String patient1Name = "Alexandra Mars";
String patient2Name = "Josh McDonald";
String patient3Name = "Annabelle House";
String patient4Name = "Jennifer Lawrence";

String patient1Photo = "/photo1.png";
String patient2Photo = "/patient2.png";
String patient3Photo = "/patient3.jpg";
// picture source: https://www.imdb.com/name/nm2225369/mediaviewer/rm2555577344/
String patient4Photo = "/patient4.jpg";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orthofinders',
      theme: ThemeData(
          fontFamily: defaultFont,
          primaryColor: Color(logoGreen),
          accentColor: Color(secondaryCol),
          canvasColor: Color(backgroundCol)),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/': (context) => HomePagePatient(),
        '/account': (context) => Account(),
        '/treatment': (context) => Treatment(),
        '/dentist': (context) => Dentist(),
        '/insurance': (context) => Insurance(),
        '/insurance2': (context) => Insurance2(),
        '/dentist1Page': (context) => Dentist1Page(),
        '/dentist2Page': (context) => Dentist2Page(),
        '/dentist3Page': (context) => Dentist3Page(),
        '/dentist4Page': (context) => Dentist4Page(),
        '/dentistPC': (context) => DentistPC(),
        '/dentistBN': (context) => DentistBN(),
        '/dentistHomePage': (context) => DentistHomePage(),
        '/dentistAccount': (context) => DentistAccountPage(),
        '/patients': (context) => DentistPatientsPage(),
        '/patient1Page': (context) => CarouselWithIndicatorDemo()
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80.0,
          title: Text('OrthoFinder Home Page',
              style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/landing');
              },
            ),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dentist_button(context),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              patient_button(context),
            ],
          ),
        ],
      ),
      drawer: PersistentDrawer(),
    );
  }

  Widget dentist_button(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.popAndPushNamed(context,
          '/dentistHomePage'), // MUST CHANGE FROM LANDING TO ACTUAL DENTIST PAGES
      child: Text(
        "Dentist Log-In",
        style: TextStyle(fontSize: 60, color: Color(backgroundCol)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(miscCol2),
      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
    );
  }

  Widget patient_button(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.popAndPushNamed(context, '/'),
      child: Text(
        "Patient Log-In",
        style: TextStyle(fontSize: 60, color: Color(backgroundCol)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(miscCol2),
      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
    );
  }
}

// if we want the application to be dynamic (and we do+), classes will
//have to extend StateFULWidget
class Account extends StatelessWidget {
  Widget Tab_list(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(mainCol),
            toolbarHeight: 55,
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  icon: Text(
                    'My Photos',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                    icon: Text(
                  'My X-Rays',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: tab1(context)),
              Center(child: tab2(context)),
              Center(child: tab3(context)),
            ],
          ),
        ),
      ),
    );
  }

  // my xrays page
  Widget tab3(BuildContext context) {
    return Container(
        child: Text(
      "X-Ray page",
      style: TextStyle(
        fontSize: 40,
      ),
    ));
  }

  // my account info page
  Widget tab1(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "My OrthoFinder account",
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 500,
                      child: TextField(
                        showCursor: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16,
                            ),
                            hintText: "First Name"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 500,
                      child: TextField(
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 16,
                          ),
                          hintText: "Last Name",
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                        ),
                        hintText: "Email address"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Birthdate",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Phone number",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    obscureText: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    obscureText: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Confirm Password",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // my photos page
  // photos taken from https://dentalnow.ca/virtual-consultation/ with the
  // consent of the owner
  Widget tab2(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(5.0),
          mainAxisSpacing: 3.0,
          crossAxisSpacing: 3.0,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo1.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo2.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo3.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo4.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo5.png'),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Image.asset('/photo6.png'),
            )
          ].toList()),
    );
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80.0,
            title:
                Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
            flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            )),
        body: Tab_list(context),
        drawer: PersistentDrawer());
  }
}

class Treatment extends StatefulWidget {
  Treatment({Key key}) : super(key: key);

  @override
  _TreatmentState createState() => _TreatmentState();
}

class _TreatmentState extends State<Treatment> {
  bool isTreatmentStarted = false;

  void _startTreatment() {
    setState(() {
      isTreatmentStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isTreatmentStarted
            ? Dentist().build(context)
            : Pre_dentist(
                context), //needs to change to post dentist too, need to create post dentist
        drawer: PersistentDrawer());
  }

  Widget Pre_dentist(BuildContext context) {
    //add components in container
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80.0,
            title: Text('Treatment'),
            flexibleSpace: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                })),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: preDentistComponent2(context),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: preDentistComponent1(context),
                  )
                ],
              )
            ]));
  }

  Widget preDentistComponent1(BuildContext context) {
    final maxLines = 5;
    return Container(
      width: 1000.0,
      child: TextField(
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 30,
        ),
        showCursor: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 30,
            ),
            hintText: "Additional information for your dentist..."),
      ),
    );
  }

  Widget preDentistComponent2(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {
                Navigator.popAndPushNamed(context, '/account'),
              },
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Update Profile",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {
                _startTreatment(),
              },
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Start Treatment",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget Dentist_component1(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          "Recommended Dentist For You",
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget Dentist_component2(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {
                Navigator.popAndPushNamed(context, '/account'),
              },
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Update Profile",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Update Insurance",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "Update Treatment",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class Dentist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          title: Text('Dentist', style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
          ),
        ),
        body: Dentist1(context),
        drawer: PersistentDrawer());
  }

  final leftSection = new Container(
    child: Text("Find the Right Dentist",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        )),
  );

  final rightSection = new Container(
    child: DropdownButton<String>(
      hint: Text("Sort by"),
      items: <String>['Price', 'Rating', 'C', 'D'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    ),
  );

  final bottomSection = new Container(
    child: Text(
        "Add widget of list of dentists here and replace the TextButton child below"),
  );

  @override
  Widget Dentist1(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        children: [
          Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                leftSection,
                SizedBox(
                  width: 350,
                ),
                rightSection,
              ]),
              SizedBox(
                height: 120,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  // this is where you set the size of the list item
                  height: 180,
                  width: 1100,
                  child: Dentist1List_row(context),
                ),
              ]),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist2List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist3List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist4List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  final dentist1Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          dentist1Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final dentist2Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          dentist2Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final dentist3Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          dentist3Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final dentist4Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          dentist4Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  Widget dentist1Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist1List_name(context),
          ),
          SizedBox(
            width: 250,
          ),
          Container(
            // rating
            child: Dentist1List_component2(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: DentistList_component3(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            // price
            child: Dentist1List_component5(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            child: Dentist1List_button(context),
          ),
        ],
      ),
    );
  }

  Widget dentist2Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist2List_name(context),
          ),
          SizedBox(
            width: 305,
          ),
          Container(
            // rating
            child: Dentist2List_component2(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: DentistList_component3(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            // price
            child: Dentist2List_component5(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            child: Dentist2List_button(context),
          ),
        ],
      ),
    );
  }

  Widget dentist3Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist3List_name(context),
          ),
          SizedBox(
            width: 295,
          ),
          Container(
            // rating
            child: Dentist3List_component2(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: DentistList_component3(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            // price
            child: Dentist3List_component5(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            child: Dentist3List_button(context),
          ),
        ],
      ),
    );
  }

  Widget dentist4Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist4List_name(context),
          ),
          SizedBox(
            width: 230,
          ),
          Container(
            // rating
            child: Dentist4List_component2(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: DentistList_component3(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            // price
            child: Dentist4List_component5(context),
          ),
          SizedBox(
            width: 50,
          ),
          Container(
            child: Dentist4List_button(context),
          ),
        ],
      ),
    );
  }

  Widget Dentist1List_button(BuildContext context) {
    return FlatButton(
      child: Text("See Profile",
          style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/dentist1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget Dentist2List_button(BuildContext context) {
    return FlatButton(
      child: Text("See Profile",
          style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/dentist2Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget Dentist3List_button(BuildContext context) {
    return FlatButton(
      child: Text("See Profile",
          style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/dentist3Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget Dentist4List_button(BuildContext context) {
    return FlatButton(
      child: Text("See Profile",
          style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/dentist4Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget Dentist1List_name(BuildContext context) {
    return Text(
      dentist1Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist2List_name(BuildContext context) {
    return Text(
      dentist2Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist3List_name(BuildContext context) {
    return Text(
      dentist3Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist4List_name(BuildContext context) {
    return Text(
      dentist4Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist1List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          dentist1Card(context),
          dentist1Img,
        ],
      ),
    );
  }

  Widget Dentist2List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          dentist2Card(context),
          dentist2Img,
        ],
      ),
    );
  }

  Widget Dentist3List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          dentist3Card(context),
          dentist3Img,
        ],
      ),
    );
  }

  Widget Dentist4List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          dentist4Card(context),
          dentist4Img,
        ],
      ),
    );
  }

  //stack component2 and component3 next to each other
  Widget Dentist1List_component2(BuildContext context) {
    return Text(
      dentist1Rating.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  Widget Dentist2List_component2(BuildContext context) {
    return Text(
      dentist2Rating.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  Widget Dentist3List_component2(BuildContext context) {
    return Text(
      dentist3Rating.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  Widget Dentist4List_component2(BuildContext context) {
    return Text(
      dentist4Rating.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  //stack component2 and component3 next to each other
  Widget DentistList_component3(BuildContext context) {
    return Icon(
      Icons.grade,
      color: Colors.white,
      size: 30.0,
    ); //dentist rating
  }

  //price widget
  Widget Dentist1List_component5(BuildContext context) {
    return Text(
      "\$" + dentist1Price.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  //price widget
  Widget Dentist2List_component5(BuildContext context) {
    return Text(
      "\$" + dentist2Price.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  //price widget
  Widget Dentist3List_component5(BuildContext context) {
    return Text(
      "\$" + dentist3Price.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }

  //price widget
  Widget Dentist4List_component5(BuildContext context) {
    return Text(
      "\$" + dentist4Price.toString(),
      style: TextStyle(color: Colors.white, fontSize: 32),
    ); //dentist rating
  }
}

//========================== DENTIST 1 PAGE ====================================
class Dentist1Page extends StatelessWidget {
  // add elevation here
  Widget Dentist2_profilePic(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Container(
          child: IconButton(
            onPressed: () =>
                {Navigator.popAndPushNamed(context, '/dentist1Page')},
            iconSize: 300,
            icon: Image.asset(
              dentist1Photo,
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget Dentist2_practicingSince(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              dentist1Practicing.toString(),
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Text(
              "Bronze Invisalign Provider",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ],
    );
  }

  final Text cabinetInfo = Text(
    "This is where the dentist or office staff member would fill in additional information about the case and some nots on the project itself, the better the message and information, the more likely it is the patient will go through with treatment.",
    style: new TextStyle(fontSize: 16.0, color: Colors.black),
  );

  Dentist2_TreatmentInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: cabinetInfo,
          width: 700,
          height: 300,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 6,
            child: Container(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              color: Color(logoGreen),
              child: Text(
                "Treatment Information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ],
    );
  }

  Widget Dentist2_component4(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Dentist2_profilePic(context),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Dentist2_name(context),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Dentist2_rating(context),
                      ),
                      Container(
                        child: Dentist2_star(context),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget Dentist2_name(BuildContext context) {
    return Container(
      child: Text(
        dentist1Name,
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget Dentist2_rating(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          dentist1Rating.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget Dentist2_star(BuildContext context) {
    return Icon(
      Icons.grade,
      color: Colors.black,
      size: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text('Dentist - profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/dentist"),
                      child: Text(
                        "Return to Dentists",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: defaultFont,
                        ),
                      ),
                      color: Color(logoGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    // PROFILE PICTURE, NAME, RATING
                    child: Dentist2_component4(context),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    // PRACTICING SINCE, INSURANCE PROVIDER RATING
                    child: Dentist2_practicingSince(context),
                  )
                  // ----------------------------- MAP COMES HERE
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Container(
                    // REVIEWS, PAST CASES, PROFILE
                    child: Dentist2_QuickButtons(context),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    // TREATMENT INFORMATION
                    child: Dentist2_TreatmentInfo(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: PersistentDrawer(),
    );
  }

  //need to change the look of the buttons
  //need to change the onPressed outcome
  Widget Dentist2_QuickButtons(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistPC')},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Past Cases",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistBN')},
              color: Color(miscCol3),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Book Now",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
  //End of List of widgets corresponding to Dentist 2 Screen
}

// ============================ DENTIST 2 PAGE ================================
class Dentist2Page extends StatelessWidget {
  // add elevation here
  Widget Dentist2_profilePic(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Container(
          child: IconButton(
            onPressed: () =>
                {Navigator.popAndPushNamed(context, '/dentist2Page')},
            iconSize: 300,
            icon: Image.asset(
              dentist2Photo,
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget Dentist2_practicingSince(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              dentist2Practicing.toString(),
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Text(
              "DIAMOND+ Invisalign Provider",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ],
    );
  }

  final Text cabinetInfo = Text(
    "This is where the dentist or office staff member would fill in additional information about the case and some nots on the project itself, the better the message and information, the more likely it is the patient will go through with treatment.",
    style: new TextStyle(fontSize: 16.0, color: Colors.black),
  );

  Dentist2_TreatmentInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: cabinetInfo,
          width: 700,
          height: 300,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 6,
            child: Container(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              color: Color(logoGreen),
              child: Text(
                "Treatment Information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ],
    );
  }

  Widget Dentist2_component4(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Dentist2_profilePic(context),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Dentist2_name(context),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Dentist2_rating(context),
                      ),
                      Container(
                        child: Dentist2_star(context),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget Dentist2_name(BuildContext context) {
    return Container(
      child: Text(
        dentist2Name,
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget Dentist2_rating(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          dentist2Rating.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget Dentist2_star(BuildContext context) {
    return Icon(
      Icons.grade,
      color: Colors.black,
      size: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text('Dentist - profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/dentist"),
                      child: Text(
                        "Return to Dentists",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: defaultFont,
                        ),
                      ),
                      color: Color(logoGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    // PROFILE PICTURE, NAME, RATING
                    child: Dentist2_component4(context),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    // PRACTICING SINCE, INSURANCE PROVIDER RATING
                    child: Dentist2_practicingSince(context),
                  )
                  // ----------------------------- MAP COMES HERE
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Container(
                    // REVIEWS, PAST CASES, PROFILE
                    child: Dentist2_QuickButtons(context),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    // TREATMENT INFORMATION
                    child: Dentist2_TreatmentInfo(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: PersistentDrawer(),
    );
  }

  //need to change the look of the buttons
  //need to change the onPressed outcome
  Widget Dentist2_QuickButtons(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistPC')},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Past Cases",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistBN')},
              color: Color(miscCol3),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Book Now",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
  //End of List of widgets corresponding to Dentist 2 Screen
}

// ============================ DENTIST 3 PAGE ===============================
class Dentist3Page extends StatelessWidget {
  // add elevation here
  Widget Dentist2_profilePic(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Container(
          child: IconButton(
            onPressed: () =>
                {Navigator.popAndPushNamed(context, '/dentist3Page')},
            iconSize: 300,
            icon: Image.asset(
              dentist3Photo,
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget Dentist2_practicingSince(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              dentist3Practicing.toString(),
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Text(
              "Platinum Invisalign Provider",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ],
    );
  }

  final Text cabinetInfo = Text(
    "This is where the dentist or office staff member would fill in additional information about the case and some nots on the project itself, the better the message and information, the more likely it is the patient will go through with treatment.",
    style: new TextStyle(fontSize: 16.0, color: Colors.black),
  );

  Dentist2_TreatmentInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: cabinetInfo,
          width: 700,
          height: 300,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 6,
            child: Container(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              color: Color(logoGreen),
              child: Text(
                "Treatment Information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ],
    );
  }

  Widget Dentist2_component4(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Dentist2_profilePic(context),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Dentist2_name(context),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Dentist2_rating(context),
                      ),
                      Container(
                        child: Dentist2_star(context),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget Dentist2_name(BuildContext context) {
    return Container(
      child: Text(
        dentist3Name,
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget Dentist2_rating(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          dentist3Rating.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget Dentist2_star(BuildContext context) {
    return Icon(
      Icons.grade,
      color: Colors.black,
      size: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text('Dentist - profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/dentist"),
                      child: Text(
                        "Return to Dentists",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: defaultFont,
                        ),
                      ),
                      color: Color(logoGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    // PROFILE PICTURE, NAME, RATING
                    child: Dentist2_component4(context),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    // PRACTICING SINCE, INSURANCE PROVIDER RATING
                    child: Dentist2_practicingSince(context),
                  )
                  // ----------------------------- MAP COMES HERE
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Container(
                    // REVIEWS, PAST CASES, PROFILE
                    child: Dentist2_QuickButtons(context),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    // TREATMENT INFORMATION
                    child: Dentist2_TreatmentInfo(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: PersistentDrawer(),
    );
  }

  //need to change the look of the buttons
  //need to change the onPressed outcome
  Widget Dentist2_QuickButtons(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistPC')},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Past Cases",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistBN')},
              color: Color(miscCol3),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Book Now",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
  //End of List of widgets corresponding to Dentist 2 Screen
}

//============================== DENTIST 4 PAGE ================================
class Dentist4Page extends StatelessWidget {
  // add elevation here
  Widget Dentist2_profilePic(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Container(
          child: IconButton(
            onPressed: () => {
              Navigator.popAndPushNamed(context, '/dentist4Page'),
            },
            iconSize: 300,
            icon: Image.asset(
              dentist4Photo,
              scale: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget Dentist2_practicingSince(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              dentist4Practicing.toString(),
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            Text(
              "Platinum+ Invisalign Provider",
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
      ],
    );
  }

  final Text cabinetInfo = Text(
    "This is where the dentist or office staff member would fill in additional information about the case and some nots on the project itself, the better the message and information, the more likely it is the patient will go through with treatment.",
    style: new TextStyle(fontSize: 16.0, color: Colors.black),
  );

  Dentist2_TreatmentInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: cabinetInfo,
          width: 700,
          height: 300,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 6,
            child: Container(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              color: Color(logoGreen),
              child: Text(
                "Treatment Information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ],
    );
  }

  Widget Dentist2_component4(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                child: Dentist2_profilePic(context),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Dentist2_name(context),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Dentist2_rating(context),
                      ),
                      Container(
                        child: Dentist2_star(context),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget Dentist2_name(BuildContext context) {
    return Container(
      child: Text(
        dentist4Name,
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget Dentist2_rating(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          dentist4Rating.toString(),
          style: new TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget Dentist2_star(BuildContext context) {
    return Icon(
      Icons.grade,
      color: Colors.black,
      size: 24.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text('Dentist - profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: FlatButton(
                      onPressed: () => Navigator.pushNamed(context, "/dentist"),
                      child: Text(
                        "Return to Dentists",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: defaultFont,
                        ),
                      ),
                      color: Color(logoGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  Container(
                    // PROFILE PICTURE, NAME, RATING
                    child: Dentist2_component4(context),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    // PRACTICING SINCE, INSURANCE PROVIDER RATING
                    child: Dentist2_practicingSince(context),
                  )
                  // ----------------------------- MAP COMES HERE
                ],
              ),
              SizedBox(
                width: 100,
              ),
              Column(
                children: [
                  Container(
                    // REVIEWS, PAST CASES, PROFILE
                    child: Dentist2_QuickButtons(context),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    // TREATMENT INFORMATION
                    child: Dentist2_TreatmentInfo(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: PersistentDrawer(),
    );
  }

  //need to change the look of the buttons
  //need to change the onPressed outcome
  Widget Dentist2_QuickButtons(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Reviews",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistPC')},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Past Cases",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistBN')},
              color: Color(miscCol3),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Book Now",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
  //End of List of widgets corresponding to Dentist 2 Screen
}

class DentistPC extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Text('Dentist - Past Cases',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
          alignment: Alignment.topRight,
          child: IconButton(
              icon: Image.asset('/cropped_logo.png'),
              iconSize: 70.0,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              }),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DentistPC_component2(context),
              ],
            ),
          ),
          Expanded(
            flex: 60,
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black,
                    width: 5,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Past Cases",
                      style: TextStyle(
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DentistPC_casePics(context),
                  ],
                )),
          ),
        ],
      ),
      drawer: PersistentDrawer(),
    );
  }

  final myImageAndCaption = [
    ["/pc1.png", "Girl, Age 8"],
    ["/pc2e.png", "Boy, Age 5"],
    ["/pc3e.png", "Girl, Age 15"],
    ["/pc4.jpg", "Boy, Age 19"],
    ["/pc5.jpg", "Girl, Age 26"],
    ["/pc6.jpg", "Boy, Age 18"],
  ];

  Widget DentistPC_casePics(BuildContext context) {
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: [
          ...myImageAndCaption.map(
            (i) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Material(
                  shape: CircleBorder(),
                  elevation: 3.0,
                  child: Image.asset(
                    i.first,
                    fit: BoxFit.fitWidth,
                    height: 200,
                    width: 200,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    child: Text(i.last),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget DentistPC_component2(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Dentist2Page().Dentist2_profilePic(context),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Dentist2Page().Dentist2_name(context),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/dentist2Page');
              },
              color: Color(logoGreen),
              child: Text(
                "Doctor Profile",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 75,
          ),
          Container(
            child: FlatButton(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/dentistBN');
              },
              color: Color(miscCol3),
              child: Text(
                "Book Consultation",
                style: TextStyle(
                  fontSize: 36,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DentistBN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          title:
              Text('Book Now', style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
          ),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
                    child: FlatButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, "/dentist2Page"),
                      child: Text(
                        "Return to Profile",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: defaultFont,
                        ),
                      ),
                      color: Color(logoGreen),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Dentist2Page().Dentist2_profilePic(context),
                  SizedBox(
                    height: 15,
                  ),
                  Dentist2Page().Dentist2_name(context),
                  SizedBox(
                    height: 30,
                  ),
                  DentistBN_component2(context),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DentistBN_component3(context),
                        DentistBN_component4(context),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DentistBN_component5(context),
                ],
              ),
            ),
            Expanded(
              flex: 60,
              child: Container(
                  margin: EdgeInsets.fromLTRB(10, 100, 10, 100),
                  decoration: BoxDecoration(
                    //borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: DentistBN_Calendar(context),
                      ),
                    ],
                  )),
            ),
          ],
        ),
        drawer: PersistentDrawer());
  }

  Widget DentistBN_Calendar(BuildContext context) {
    return Container(
      child: SfCalendar(view: CalendarView.month),
    ); //dentist calender
  }

  Widget DentistBN_component2(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      onPressed: () => {Navigator.popAndPushNamed(context, '/account')},
      color: Color(logoGreen),
      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Text(
        "Update Your Profile",
        style: TextStyle(fontSize: 50),
      ),
    );
  }

//Doesn't change unless stateful
  bool CheckboxVal = false;

  Widget DentistBN_component3(BuildContext context) {
    return Checkbox(
      value: CheckboxVal,
      onChanged: (bool value) {
        CheckboxVal = true;
      },
    );
  }

//goes next to DentistBN_component3
//text for the check box
  Widget DentistBN_component4(BuildContext context) {
    return Container(
      width: 600,
      child: Text(
        "I understand that most of the information provided will go to the dentist for review",
        style: TextStyle(fontSize: 26),
      ),
    );
  }

//Make sure the onPressed goes to the correct screen
  Widget DentistBN_component5(BuildContext context) {
    return FlatButton(
      onPressed: () => {},
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Column(
        children: <Widget>[
          Text(
            "Confirm",
            style: TextStyle(fontSize: 50),
          ),
        ],
      ),
    );
  }
}

//Stack under DentistBN_component1
//Name of the Doctor
// Widget DentistBN_component6(BuildContext context) {
//   return Dentist2_component6(context);
// }

//End of list of Widgets for Dentist Book Now screen

class Insurance extends StatefulWidget {
  InsuranceInformation createState() => InsuranceInformation();
}

class InsuranceInfo {
  String name;
  String phoneNumber;
  String email;
  InsuranceInfo(this.name, this.phoneNumber, this.email);
}

String selectedInsuranceName = "";
String selectedInsuranceEmail = "";
String selectedInsurancePhone = "";

class InsuranceInformation extends State<Insurance> {
  List<InsuranceInfo> _infoList = [
    InsuranceInfo("Select your insurance provider...", "", ""),
    InsuranceInfo("Sunlife", "1 (800) 638-2287", "info@sunlife.ca"),
    InsuranceInfo("Manulife", "1 (800) 268-6195", "info@manulife.ca"),
    InsuranceInfo(
        "Blue Cross Blue Shield", "1 (888) 630-2583", "info@bcbs.com"),
    InsuranceInfo("Special Benefits Insurance Services", "1 (800) 667-0429",
        "info@sbis.ca"),
    InsuranceInfo("Canada Life Assurance Company", "1 (800) 957-9777",
        "info@canadalife.ca"),
    InsuranceInfo("Canada Protection Plan", "1 (977) 847-9090", "info@cpp.ca"),
    InsuranceInfo("AMA Insurance", "1 (877) 261-8222", "am_caa@manulife.com"),
  ];

  List<DropdownMenuItem<InsuranceInfo>> _dropdownMenuItems;
  InsuranceInfo _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_infoList);
    _selectedItem = _dropdownMenuItems[0].value;
    selectedInsuranceName = _selectedItem.name;
    selectedInsuranceEmail = _selectedItem.email;
    selectedInsurancePhone = _selectedItem.phoneNumber;
  }

  List<DropdownMenuItem<InsuranceInfo>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<InsuranceInfo>> items = List();
    for (InsuranceInfo listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name, style: TextStyle(fontSize: 22)),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget insuranceDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.cyan,
            border: Border.all()),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(
                () {
                  _selectedItem = value;
                  selectedInsuranceName = _selectedItem.name;
                  selectedInsuranceEmail = _selectedItem.email;
                  selectedInsurancePhone = _selectedItem.phoneNumber;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget selectedInsuranceInfo(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      child: Column(
        children: [
          Text(
            "Contact information:",
            style: TextStyle(fontSize: 44),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                _selectedItem.name,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                _selectedItem.phoneNumber,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                _selectedItem.email,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget nextStepButton(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.popAndPushNamed(context, '/insurance2'),
      child: Text(
        "Next Step",
        style: TextStyle(fontSize: 26, color: Color(backgroundCol)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(miscCol3),
      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
    );
  }

  Widget title(BuildContext context) {
    return Text(
      "Who is your insurance provider?",
      style: TextStyle(fontSize: 60),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          title: Text('Insurance Information',
              style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }),
          ),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 330, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [title(context)],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  insuranceDropdown(context),
                  SizedBox(
                    width: 100,
                  ),
                  Column(
                    children: [
                      selectedInsuranceInfo(context),
                      SizedBox(
                        height: 120,
                      ),
                      nextStepButton(context),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: PersistentDrawer());
  }
}

class Insurance2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Text('Insurance Information',
            style: TextStyle(fontWeight: FontWeight.bold)),
        flexibleSpace: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Image.asset('/cropped_logo.png'),
                iconSize: 70.0,
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/');
                })),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              returnToInsuranceSelect(context),
              SizedBox(
                height: 80,
              ),
              title(context),
              SizedBox(
                height: 75,
              ),
              setOfQuestions(context),
            ],
          ),
          SizedBox(
            width: 80,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                displayCurrentInsuranceInfo(context),
                SizedBox(
                  height: 20,
                ),
                inputFields(context),
                SizedBox(
                  height: 50,
                ),
                confirmButton(context),
              ],
            ),
          ),
        ],
      ),
      drawer: PersistentDrawer(),
    );
  }

  Widget returnToInsuranceSelect(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.popAndPushNamed(context, '/insurance'),
      child: Text(
        "Go back",
        style: TextStyle(fontSize: 26, color: Color(backgroundCol)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(miscCol3),
      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
    );
  }

  Widget title(BuildContext context) {
    return Column(
      children: [
        Text(
          "Contact your insurance provider",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "\tand ask for information about your dental plan!",
          style: TextStyle(fontSize: 40),
        ),
      ],
    );
  }

  Widget confirmButton(BuildContext context) {
    return FlatButton(
      onPressed: () => Navigator.popAndPushNamed(context, '/'),
      child: Text(
        "Confirm",
        style: TextStyle(fontSize: 30, color: Color(backgroundCol)),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: Color(miscCol3),
      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
    );
  }

  Widget inputFields(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          width: 400,
          child: TextField(
            decoration:
                InputDecoration(hintText: 'Enter insurance expiry date...'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Enter orthodontic coverage amount...'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: 400,
          child: TextField(
            decoration: InputDecoration(
                hintText:
                    'Enter whether you are able to combine plans (yes/no)...'),
          ),
        ),
      ],
    );
  }

  Widget displayCurrentInsuranceInfo(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      child: Column(
        children: [
          Text(
            "Contact information:",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                selectedInsuranceName,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                selectedInsurancePhone,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                selectedInsuranceEmail,
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget setOfQuestions(BuildContext context) {
    return Column(
      children: [
        Text(
          "Questions to ask your insurance company:",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          "\t\"When does my orthodontic insurance expire?\"",
          style: TextStyle(fontSize: 26),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "\t\"What is my orthodontic coverage for a given period?\"",
          style: TextStyle(fontSize: 26),
        ),
        SizedBox(
          height: 25,
        ),
        Text(
          "\t\"Can I combine your plan with another provider's plan?\"",
          style: TextStyle(fontSize: 26),
        ),
      ],
    );
  }
}

class DentistHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          title: Text('Home - Dentist',
              style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Image.asset('/cropped_logo.png'),
                  iconSize: 70.0,
                  onPressed: () {})),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(67, 55, 67, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(dentistIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Account",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/dentistAccount');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(55, 55, 55, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(dentistTreatIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Treatment",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/dentistHomePage');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(60, 35, 60, 35),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(dollarIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Payments",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Due",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/dentistHomePage');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(70, 55, 70, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(accIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Patients",
                            style: TextStyle(
                              color: Color(mainCol),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/patients');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: PersistentDrawerDentist());
  }
}

class DentistAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          title: Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Image.asset('/cropped_logo.png'),
                  iconSize: 70.0,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/dentistHomePage');
                  })),
        ),
        body: widget1(context),
        drawer: PersistentDrawerDentist());
  }

  Widget widget1(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "My OrthoFinder account",
                    style: TextStyle(
                      fontSize: 34,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 500,
                      child: TextField(
                        showCursor: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontSize: 16,
                            ),
                            hintText: "First Name"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 500,
                      child: TextField(
                        showCursor: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xFFF2F3F5),
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 16,
                          ),
                          hintText: "Last Name",
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 16,
                        ),
                        hintText: "Email address"),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Practicing Since",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Practice Website",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    obscureText: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Invisalign Provider Link",
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 1015,
                  child: TextField(
                    obscureText: true,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                      ),
                      hintText: "Office Name",
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DentistPatientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.0,
          title:
              Text('Patients', style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Image.asset('/cropped_logo.png'),
                  iconSize: 70.0,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/dentistHomePage');
                  })),
        ),
        body: patientsList(context),
        drawer: PersistentDrawer());
  }

  final leftSection = new Container(
    child: Text("Find the Right Patient",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        )),
  );

  // final rightSection = new Container(
  //   child: DropdownButton<String>(
  //     hint: Text("Sort by"),
  //     items: <String>['Price', 'Rating', 'C', 'D'].map((String value) {
  //       return new DropdownMenuItem<String>(
  //         value: value,
  //         child: new Text(value),
  //       );
  //     }).toList(),
  //     onChanged: (_) {},
  //   ),
  // );

  // final bottomSection = new Container(
  //   child: Text(
  //       "Add widget of list of dentists here and replace the TextButton child below"),
  // );

  Widget patientsList(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        children: [
          Column(
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                leftSection,
                SizedBox(
                  width: 350,
                ),
                //rightSection,
              ]),
              SizedBox(
                height: 120,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  // this is where you set the size of the list item
                  height: 180,
                  width: 1100,
                  child: Dentist1List_row(context),
                ),
              ]),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist2List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist3List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 1100,
                    child: Dentist4List_row(context),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  final patient1Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          patient1Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final patient2Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          patient2Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final patient3Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          patient3Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  final patient4Img = Container(
    height: 230,
    width: 150,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: ExactAssetImage(
          patient4Photo,
        ),
        fit: BoxFit.cover,
      ),
      border: Border.all(
        color: Color(mainCol),
        width: 5,
      ),
    ),
  );

  Widget patient1Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist1List_name(context),
          ),
          SizedBox(
            width: 170,
          ),
          Container(
            // photos icon
            child: patientPhIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // comments icon
            child: patientComIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // xray icon
            child: patientXrayIcon(context),
          ),
          SizedBox(
            width: 130,
          ),
          Container(
            child: patient1Bid_button(context),
          ),
        ],
      ),
    );
  }

  Widget patient2Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist2List_name(context),
          ),
          SizedBox(
            width: 176,
          ),
          Container(
            // photos icon
            child: patientPhIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // comments icon
            child: patientComIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // xray icon
            child: patientXrayIcon(context),
          ),
          SizedBox(
            width: 130,
          ),
          Container(
            child: patient2Bid_button(context),
          ),
        ],
      ),
    );
  }

  Widget patient3Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist3List_name(context),
          ),
          SizedBox(
            width: 155,
          ),
          Container(
            // rating
            child: patientPhIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: patientComIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // price
            child: patientXrayIcon(context),
          ),
          SizedBox(
            width: 130,
          ),
          Container(
            child: patient3Bid_button(context),
          ),
        ],
      ),
    );
  }

  Widget patient4Card(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 150),
      alignment: Alignment.center,
      height: 180,
      margin: EdgeInsets.fromLTRB(46, 0, 0, 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(mainCol),
            // blurRadius: 5,
            offset: new Offset(0, 10),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            child: Dentist4List_name(context),
          ),
          SizedBox(
            width: 140,
          ),
          Container(
            // rating
            child: patientPhIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            //star icon
            child: patientComIcon(context),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // price
            child: patientXrayIcon(context),
          ),
          SizedBox(
            width: 130,
          ),
          Container(
            child: patient4Bid_button(context),
          ),
        ],
      ),
    );
  }

  Widget patient1Bid_button(BuildContext context) {
    return FlatButton(
      child:
          Text("Bid Now", style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/patient1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget patient2Bid_button(BuildContext context) {
    return FlatButton(
      child:
          Text("Bid Now", style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/patient1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget patient3Bid_button(BuildContext context) {
    return FlatButton(
      child:
          Text("Bid Now", style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/patient1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget patient4Bid_button(BuildContext context) {
    return FlatButton(
      child:
          Text("Bid Now", style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/patient1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget Dentist1List_name(BuildContext context) {
    return Text(
      patient1Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist2List_name(BuildContext context) {
    return Text(
      patient2Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist3List_name(BuildContext context) {
    return Text(
      patient3Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist4List_name(BuildContext context) {
    return Text(
      patient4Name,
      style: TextStyle(
        color: Colors.white,
        fontSize: 32,
      ),
    );
  }

  Widget Dentist1List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          patient1Card(context),
          patient1Img,
        ],
      ),
    );
  }

  Widget Dentist2List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          patient2Card(context),
          patient2Img,
        ],
      ),
    );
  }

  Widget Dentist3List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          patient3Card(context),
          patient3Img,
        ],
      ),
    );
  }

  Widget Dentist4List_row(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          patient4Card(context),
          patient4Img,
        ],
      ),
    );
  }

  Widget patientPhIcon(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {},
      tooltip: "Patient's account contains photos",
      icon: Image.asset(photoIcon),
      iconSize: 50,
    );
  }

  Widget patientComIcon(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {},
      tooltip: "Patient's account contains treatment comments",
      icon: Image.asset(commentIcon),
      iconSize: 50,
    );
  }

  Widget patientXrayIcon(BuildContext context) {
    return IconButton(
      color: Colors.white,
      onPressed: () {},
      tooltip: "Patient's account contains X-Ray pictures",
      icon: Image.asset(xrayIcon),
      iconSize: 50,
    );
  }
}

final List<String> imgList = [
  '/photo1.png',
  '/photo2.png',
  '/photo3.png',
  '/photo4.png',
  '/photo5.png',
  '/photo6.png'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Patient1Page();
  }
}

class Patient1Page extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          title: Text('Patient - Profile',
              style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Image.asset('/cropped_logo.png'),
                  iconSize: 70.0,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/dentistHomePage');
                  })),
        ),
        // body: SizedBox(
        //   height: 300,
        //   width: 533,
        //   child: photoCarousel(context),
        // ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                patient1QuickButtons(context),
                SizedBox(height: 30),
                SizedBox(
                  child: photoCarousel(context),
                  height: 400,
                  width: 708,
                ),
                SizedBox(height: 30),
                patient1TreatmentInfo(context),
              ],
            ),
            SizedBox(
              width: 60,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                patient1Img(context),
                SizedBox(height: 10),
                p1Name(context),
                SizedBox(height: 60),
                patient1BidAmount(context),
                SizedBox(height: 10),
                patient1BidNowButton(context),
              ],
            )
          ],
        ),
        drawer: PersistentDrawerDentist());
  }

  Widget photoCarousel(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.map(
          (url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          },
        ).toList(),
      ),
    ]);
  }

  final Text patientInfo = Text(
    "I have noticed that the top row of my teeth are slightly slanted. I would like to come in for a consult.",
    style: TextStyle(fontSize: 20),
  );

  Widget patient1TreatmentInfo(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: patientInfo,
          width: 700,
          height: 300,
          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 204, 255), width: 1),
            borderRadius: BorderRadius.circular(5),
            shape: BoxShape.rectangle,
          ),
        ),
        Positioned(
            left: 50,
            top: 6,
            child: Container(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
              color: Color(logoGreen),
              child: Text(
                "Treatment Information",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )),
      ],
    );
  }

  Widget patient1QuickButtons(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: <Widget>[
            FlatButton(
              onPressed: () => {},
              color: Color(logoGreen),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Patient Information",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 80,
        ),
        Column(
          children: <Widget>[
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () =>
                  {Navigator.popAndPushNamed(context, '/dentistPC')},
              color: Color(logoGreen),
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Request More Information",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Widget patient1Img(BuildContext context) {
    return Container(
      height: 320,
      width: 260,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(
            patient1Photo,
          ),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Color(mainCol),
          width: 5,
        ),
      ),
    );
  }

  Widget p1Name(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            patient1Name,
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            "Age: 24",
            style: new TextStyle(
              fontSize: 22.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget patient1BidNowButton(BuildContext context) {
    //bid now button
    return FlatButton(
      child:
          Text("Bid Now", style: TextStyle(color: Colors.white, fontSize: 26)),
      onPressed: () {
        Navigator.popAndPushNamed(context, '/patient1Page');
      },
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      color: Color(miscCol3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

  Widget patient1BidAmount(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 300,
      child: TextField(
        showCursor: true,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 5,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            fillColor: Color(0xFFF2F3F5),
            hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 16,
            ),
            hintText: "Enter bid amount in dollars"),
      ),
    );
  }
}

class HomePagePatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100.0,
          title: Text('Home - Patient',
              style: TextStyle(fontWeight: FontWeight.bold)),
          flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
              alignment: Alignment.topRight,
              child: IconButton(
                  icon: Image.asset('/cropped_logo.png'),
                  iconSize: 70.0,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/dentistHomePage');
                  })),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(67, 55, 67, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(accIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Account",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/account');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(55, 55, 55, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(treatmentIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Treatment",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/treatment');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(75, 55, 75, 55),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(dentistIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Dentist",
                            style: TextStyle(
                                color: Color(mainCol),
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/dentist');
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    color: Colors.white,
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: ImageIcon(
                              AssetImage(insuranceIcon),
                              color: Color(mainCol),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Insurance",
                            style: TextStyle(
                              color: Color(mainCol),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/insurance');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        drawer: PersistentDrawer());
  }
}

class PersistentDrawerDentist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome, doctor!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(logoGreen),
            ),
          ),
          ListTile(
            title: Text(
              'Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              // move to account page when clicked
              Navigator.popAndPushNamed(context, '/dentistAccount');
            },
          ),
          ListTile(
            title: Text(
              'Treatment',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              // move to treatment page when clicked
              Navigator.popAndPushNamed(context, '/dentistHomePage');
            },
          ),
          ListTile(
            title: Text(
              'Payments Due',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // move to dentist page when clicked
              Navigator.popAndPushNamed(context, '/dentistHomePage');
            },
          ),
          ListTile(
            title: Text(
              'Patients',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // move to insurance page
              Navigator.popAndPushNamed(context, '/patients');
            },
          ),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/landing');
            },
          ),
        ],
      ),
    );
  }
}

class PersistentDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome, patient!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
            decoration: BoxDecoration(
              color: Color(logoGreen),
            ),
          ),
          ListTile(
            title: Text(
              'Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              // move to account page when clicked
              Navigator.popAndPushNamed(context, '/account');
            },
          ),
          ListTile(
            title: Text(
              'Treatment',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              // move to treatment page when clicked
              Navigator.popAndPushNamed(context, '/treatment');
            },
          ),
          ListTile(
            title: Text(
              'Dentist',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // move to dentist page when clicked
              Navigator.popAndPushNamed(context, '/dentist');
            },
          ),
          ListTile(
            title: Text(
              'Insurance Information',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // move to insurance page
              Navigator.popAndPushNamed(context, '/insurance');
            },
          ),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, '/landing');
            },
          ),
        ],
      ),
    );
  }
}
