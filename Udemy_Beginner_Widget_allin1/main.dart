import 'package:flutter/material.dart';

void main() {
  runApp(new application());
}
/*

class application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Stateless Widget",
      home: new Scaffold(
        body: new Container(
          color: Colors.black12,
          child: new Container(
            color: Colors.purpleAccent,
            margin: const EdgeInsets.all(20),
            child: new Center(
              child:new Text("This is me!"),
            ),
          ),
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {

  String ttext="";
  int i=1;

  @override
  void initState() {
    // TODO: implement initState
    ttext="Click on this button";
    super.initState();
  }

  void method1()
  {
    setState(() {
      ttext="You have clicked this button " + i.toString() + " times";
      i++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Stateful Widget",
      home: new Scaffold(
        body: new Center(
          child: new ElevatedButton(onPressed: (){method1();}, child: new Text(ttext),),
        ),
      ),
    );
  }
}

class application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"Container Widget",
      home: new Scaffold(
        body: new Container(
          child: new Text("This is my container"),
          height: 300.0,
          width: 300.0,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            color: Colors.blueGrey,
          ),
          //transform: new Matrix4.rotationZ(0.5),
          foregroundDecoration: new BoxDecoration(
            color: Colors.cyan,
          ),
        ),
      ),
    );
  }
}

class application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Row & Column Widget",
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.cyan,
          centerTitle: true,
          title: new Text("Row & Column"),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("This's"),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text("This"),
                new Text(" is"),
                new Text(" Row"),
              ],
            ),
            new Text("Column"),
          ],
        ),
      ),
    );
  }
}


class application extends StatefulWidget {

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "List Widget",
      home: new Scaffold(
        appBar: new AppBar(title: new Text("List Widget"),backgroundColor: Colors.tealAccent,),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("Item 1"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text("Item 2"),
              trailing: new Icon(Icons.arrow_forward),
            ),
            new ListTile(
              title: new Text("Item 3"),
              trailing: new Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  List<int> items = [];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 1; i <=50; i++) {
      items.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "List Widget: Array of List",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("List Widget : Array of List"),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return new ListTile(
              title: new Text("Item no: $index"),
              trailing: new Icon(Icons.arrow_forward),
            );
          },
        ),
      ),
    );
  }
}

class application extends StatefulWidget {

  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title:"Stack",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Stack"),
          centerTitle: true,
          backgroundColor: Colors.green,
          elevation: 30.0,
          toolbarOpacity: 0.5,
        ),
        body: new Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new Card(color: Colors.lightGreen,child: new Padding(padding: const EdgeInsets.all(200.0),)),
            new Card(color: Colors.lightGreenAccent,child: new Padding(padding: const EdgeInsets.all(100.0),)),
            new Card(color: Colors.lime,child: new Padding(padding: const EdgeInsets.all(50.0),)),
            new Card(color: Colors.limeAccent,child: new Padding(padding: const EdgeInsets.all(30.0),)),
            new Card(color: Colors.yellow,child: new Padding(padding: const EdgeInsets.all(10.0),)),

          ],
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  String mtext = "Item";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("GridView and AppbBar"),
          leading: new IconButton(
              onPressed: () {
                setState(() {
                  mtext = "Menu Button Pressed";
                });
              },
              icon: new Icon(Icons.menu)),
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(50.0),
          //   child: GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         mtext = "Item";
          //       });
          //     },
          //   ),
          // ),
          flexibleSpace: GestureDetector(
            onTap: () {
              setState(() {
                mtext = "Item";
              });
            },
          ),
          actions: <Widget>[
            new IconButton(
                onPressed: () {
                  setState(() {
                    mtext = "Arrow Icon Button";
                  });
                },
                icon: new Icon(Icons.arrow_forward)),
            new IconButton(
                onPressed: () {
                  setState(() {
                    mtext = "Close Icon Button";
                  });
                },
                icon: new Icon(Icons.close)),
          ],
        ),
        body: new GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.blue.shade100,
              child: Center(
                child: Text(mtext + " $index"),
              ),
            );
          },
        ),
      ),
    );
  }
}
class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Bottom and Top Tabbar",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Top & Bottom Tabbar"),
          //backgroundColor: Colors.blue,
          bottom: new TabBar(
            dividerColor: Colors.indigoAccent,
            indicatorColor: Colors.indigo,
            controller: _tabController,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.home),
              ),
              new Tab(
                icon: new Icon(Icons.supervisor_account),
              ),
              new Tab(
                icon: new Icon(Icons.call),
              ),
            ],
          ),
        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          new Center(
            child: new Text("Welcome to Home"),
          ),
          new Center(
            child: new Text("Welcome to ContactBook"),
          ),
          new Center(
            child: new Text("Welcome to Call History"),
          ),
        ]),
        bottomNavigationBar: new Material(
          child: new TabBar(
            controller: _tabController,
              tabs: <Widget> [
                new Tab(
                  icon: new Icon(Icons.home),
                ),
                new Tab(
                  icon: new Icon(Icons.supervisor_account),
                ),
                new Tab(
                  icon: new Icon(Icons.call),
                ),
          ]),
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String mtext = "";
  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "TextField Widget",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("TextField Widget"),
          bottom: new TabBar(controller: _tabController, tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.account_circle_outlined),
            ),
            new Tab(
              icon: new Icon(Icons.control_point),
            ),
            new Tab(
              icon: new Icon(Icons.event),
            ),
          ]),
        ),
        body: new TabBarView(controller: _tabController, children: <Widget>[
          new Column(children: <Widget>[
            SizedBox(height: 20.0,),
            new TextField(
              onSubmitted: (String txt) {
                setState(() {
                  mtext = txt;
                });
              },
              decoration: new InputDecoration(
                  labelText: "ContactName",
                  hintText: "e.g. Farida Yeasmin",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue.shade200,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            new ListTile(
              title: new Text(mtext),
              trailing: new Icon(Icons.arrow_forward),
            )
          ]),
          new Card(
            color: Colors.orangeAccent,
            child: new Center(
              child: new Text("Hi"),
            ),
          ),
          new GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: Colors.blue.shade100,
                child: Center(
                  child: Text(mtext + " $index"),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  String txt = "";

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Buttons Widget",
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: new Text("Buttons Widget"),
        ),
        body: new Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    txt = "You have pressed elevated button.";
                  });
                },
                child: Text("Elevated Button")),
            TextButton(
                onPressed: () {
                  setState(() {
                    txt = "You have pressed text button.";
                  });
                },
                child: Text("TextButton")),
            OutlinedButton(
                onPressed: () {
                  setState(() {
                    txt = "You have pressed outlined button.";
                  });
                },
                child: Text("Outlined Button")),
            Center(child: Text(txt),),
          ],
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  @override
  bool bool1 = false;
  bool bool2 = false;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CheckBox",
      home: Scaffold(
        appBar: AppBar(
          title: new Text("CheckBox"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Checkbox(
                    value: bool1,
                    onChanged: (bool? cbool) {
                      setState(() {
                        bool1 = cbool ?? false;
                      });
                    }),
                Text(bool1.toString()),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: bool2,
                    onChanged: (bool? cbool) {
                      setState(() {
                        bool2= cbool ?? false;
                      });
                    }),
                Text("Item 2"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class application extends StatefulWidget {
  @override
  State<application> createState() => _applicationState();
}

class _applicationState extends State<application> {
  int value = 0;
  void method1(int cvalue) {
    setState(() {
      value = cvalue;
    });
  }

  double rvalue = 1.0;
  void method2(double crvalue) {
    setState(() {
      rvalue = crvalue;
    });
  }

  bool sbool=false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radio + Slider +Switch",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Radio + Slider +Switch"),
          backgroundColor: Colors.blue.shade200,
        ),
        body: Column(
          children: [
            Text(
              "Radio Button",
              style: TextStyle(
                backgroundColor: Colors.blue.shade50,
              ),
            ),
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: value,
                    onChanged: (int? cvalue) {
                      method1(cvalue ?? 0);
                    }),
                Text("Radio Button of value 1 and GroupValue is currently " +
                    value.toString()),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 2,
                    groupValue: value,
                    onChanged: (int? cvalue) {
                      method1(cvalue ?? 0);
                    }),
                Text("Radio Button of value 2 and GroupValue is currently " +
                    value.toString()),
              ],
            ),
            Text(
              "Slider",
              style: TextStyle(
                backgroundColor: Colors.blue.shade50,
              ),
            ),
            Slider(
                value: rvalue,
                min: 0,
                max: 10,
                onChanged: (double? crvalue) {
                  method2(crvalue ?? 0);
                }),
            Text("Slider Value: $rvalue"),
            SizedBox(height: 50.0,),
            Text(
              "Switch",
              style: TextStyle(
                backgroundColor: Colors.blue.shade50,
              ),
            ),
            Switch(value: sbool, onChanged:(bool? csbool){
              setState(() {
                sbool=csbool??false;
              });
            } ),
            Text('Switch value : $sbool'),
          ],
        ),
      ),
    );
  }
}

class application extends StatelessWidget {

  String userName = "Jannatul Ferdousi";
  String email = "jf@gmail.com";
  String initial = "JF";
  String get initials {
    List<String> words = userName.split(' ');
    return words.map((word) => word[0]).join();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Text(initials),
              ),
              decoration: BoxDecoration(color: Colors.blue.shade200),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("D"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("A"),
                ),
              ],
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=> OpPage("Settings"),),),
            ),
            ListTile(
              title: Text("Help & Feedback"),
              leading: Icon(Icons.help),
              onTap: ()=> Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context)=> OpPage("Help & FeedBack"),),),

            ),
          ],
        ),
      ),

    );
  }
}


class application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer and Routing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Application(),
    );
  }
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  String userName = "Jannatul Ferdousi";
  String email = "jf@gmail.com";

  String get initials {
    List<String> words = userName.split(' ');
    return words.map((word) => word[0]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer & Routing"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userName),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black26,
                child: Text(initials),
              ),
              decoration: BoxDecoration(color: Colors.blue.shade200),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("D"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black26,
                  child: Text("A"),
                ),
              ],
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OpPage("Settings"),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Help & Feedback"),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => OpPage("Help & Feedback"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OpPage extends StatelessWidget {
  final String txt;
  OpPage(this.txt);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(txt),
      ),
      body: Center(
        child: Text(txt),
      ),
    );
  }
}
*/

class application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notification: SnackBar, Alert Dialog, Simple Dialog.",
      home: Application(),
    );
  }
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  void snackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text("Tis is a SnackBar!"),
      action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Undo action is triggered!")),
          );
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showAlertDialog(BuildContext context) {
    TextButton cancelButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("Cancel"),
    );
    TextButton continueButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
        showAlertDialog(context);
      },
      child: Text("Continue"),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text("AlertDialog Title"),
      content: Text("This is a simple alert dialog."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  void showSimpleDialog(BuildContext context){
    SimpleDialog simpleDialog=SimpleDialog(
      title: Text("Select an option."),
      children: [
        SimpleDialogOption(
          child: Text("Option 1"),
          onPressed: (){
            showDialog(context: context, builder: (BuildContext context)
                {
                  return AlertDialog(
                    content: Text("Option 1 selected!"),
                  );
                },
            );
          },
        ),
        SimpleDialogOption(
          child: Text("Close"),
          onPressed: (){Navigator.of(context).pop();},
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return simpleDialog;
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification: SnackBar, Alert Dialog, Simple Dialog."),
          backgroundColor: Colors.purple.shade100,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Press for SnackBar"),
                onPressed: () {
                  snackBar(context);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text("Press for Alert Dialog"),
              ),
              ElevatedButton(
                onPressed: (){
                  showSimpleDialog(context);
                },
                child: Text("Press for Simple Dialog"),
              ),
            ],
          ),
        ));
  }
}
