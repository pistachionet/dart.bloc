import 'package:flutter/material.dart';

import 'dart:math' as math;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}





class Animation5 extends StatefulWidget {
  @override
  _Animation5State createState() => _Animation5State();
}

class _Animation5State extends State<Animation5> {
  bool selected = false;
  double iconSize = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 5"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180.0,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
            height: 180.0 + iconSize / 3,
            child: AnimatedAlign(
              alignment: selectAlignment(),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: changeAlignment,
                child: profilePicture(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profilePicture() => Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.account_circle_sharp,
          size: iconSize,
          color: Colors.blue,
        ),
      );

  changeAlignment() {
    setState(() {
      selected = !selected;
    });
  }

  selectAlignment() => selected ? Alignment.bottomLeft : Alignment.bottomCenter;
}





class Animation6 extends StatefulWidget {
  @override
  _Animation6State createState() => _Animation6State();
}

class _Animation6State extends State<Animation6> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _instagramView = false;
  List<String> urlList = [
    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://images.unsplash.com/photo-1543486958-d783bfbf7f8e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://image.winudf.com/v2/image1/Y29tLmdvbGRkZXguaGRzZWxmaWVjYW1lcmFfc2NyZWVuXzNfMTU1Mjg3ODE0N18wOTA/screen-3.jpg?fakeurl=1&type=.jpg",
    "https://images.unsplash.com/photo-1598966739654-5e9a252d8c32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHNlbGZpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
    "https://ak.picdn.net/shutterstock/videos/17533732/thumb/1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Animation 6",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                _instagramView = !_instagramView;
              });
            },
            icon: Icon(Icons.swap_horizontal_circle_outlined),
          )
        ],
      ),
      body: _instagramView ? _buildInstagramView() : _buildCenter(),
    );
  }

  Widget _buildInstagramView() {
    double size = 130;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          urlList.length,
          (index) => Container(
            margin:
                EdgeInsets.only(top: 10, left: index == 0 ? 10 : 0, right: 10),
            width: size,
            height: size,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.purple],
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
                    );
                  },
                ),
                Center(
                  child: CircleAvatar(
                    radius: size * 0.44,
                    backgroundImage: NetworkImage(urlList[index]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget circleColors() => Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: textCenter(),
      );

  Widget textCenter() => Center(
        child: Text(
          'TEXT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _buildCenter() => Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: circleColors(),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        ),
      );
}




class Animation4 extends StatefulWidget {
  @override
  _Animation4State createState() => _Animation4State();
}

class _Animation4State extends State<Animation4> {
  bool largeView = false;
  bool hideText = false;
  bool buttonLock = false;
  String text =
      "Today I picture this amazing location with my camera. This is one of the most beautiful place I have ever seen. I will go back on day to take a new picture";
  List<String> _urlList = [
    "https://assets.hongkiat.com/uploads/nature-photography/autumn-poolside.jpg",
    "https://www.mickeyshannon.com/photos/fine-art-nature-photography.jpg",
    "https://composeclick.com/wp-content/uploads/2018/05/nature-1.jpg",
    "https://cdn.theatlantic.com/media/img/photo/2020/11/top-shots-2020-international-landsc/a01_Yuen_MagicalNight-1/original.jpg",
    "https://static.boredpanda.com/blog/wp-content/uploads/2015/05/travel-nature-photography-depression-rescue-william-patino6.jpg",
    "https://www.69dropsstudio.co.uk/wp-content/uploads/2018/05/nature-photography-at-its-best.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 4"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: buttonLock || !largeView
                        ? null
                        : () {
                            setState(() {
                              largeView = false;
                              buttonLock = true;
                              hideText = true;
                            });
                          },
                    icon: RotatedBox(
                      child: Icon(
                        Icons.view_agenda_outlined,
                        color: Colors.white,
                      ),
                      quarterTurns: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: buttonLock || largeView
                        ? null
                        : () {
                            setState(() {
                              largeView = true;
                              buttonLock = true;
                            });
                          },
                    icon: Icon(
                      Icons.view_agenda_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ...List.generate(
              _urlList.length,
              (index) => Wrap(
                alignment: WrapAlignment.start,
                children: [
                  AnimatedContainer(
                    onEnd: changeView,
                    width: changeWidth(width),
                    height: changeHeight(),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOutQuart,
                    child: Image.network(
                      _urlList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  showText() ? textWidget(width) : SizedBox()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textWidget(width) => Container(
        width: width / 2,
        padding: EdgeInsets.all(5),
        child: Text(
          text,
        ),
      );
  showText() => !largeView && !hideText;
  changeHeight() => largeView ? 250.0 : 150.0;
  changeWidth(width) => largeView ? width : width / 2;
  changeView() {
    setState(() {
      hideText = false;
      buttonLock = false;
    });
  }
}



class Animation3 extends StatefulWidget {
  @override
  _Animation3State createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
  bool selected = false;
  TextStyle textStyle1 = TextStyle(
    color: Colors.blue,
    fontSize: 90,
    letterSpacing: 2,
    fontWeight: FontWeight.w900,
  );
  TextStyle textStyle2 = TextStyle(
    color: Colors.orange,
    fontSize: 140,
    fontWeight: FontWeight.w300,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 3"),
      ),
      body: GestureDetector(
        onTap: changeTextStyle,
        child: Center(
          child: AnimatedDefaultTextStyle(
            child: Text("TEXT"),
            style: selected ? textStyle1 : textStyle2,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }

  changeTextStyle() {
    setState(() {
      selected = !selected;
    });
  }
}



List<String> urlList = [
  "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllJTIwZ2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://images.unsplash.com/photo-1543486958-d783bfbf7f8e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2VsZmllfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://image.winudf.com/v2/image1/Y29tLmdvbGRkZXguaGRzZWxmaWVjYW1lcmFfc2NyZWVuXzNfMTU1Mjg3ODE0N18wOTA/screen-3.jpg?fakeurl=1&type=.jpg",
  "https://images.unsplash.com/photo-1598966739654-5e9a252d8c32?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHNlbGZpZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  "https://ak.picdn.net/shutterstock/videos/17533732/thumb/1.jpg",
];

class Animation7 extends StatefulWidget {
  @override
  _Animation7State createState() => _Animation7State();
}

class _Animation7State extends State<Animation7> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double opacityLevel = 1.0;

  bool _instagramView = false;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  void _changeOpacityInstagram({required int index}) {
    setState(() =>
        opacityLevelInsta[index] = opacityLevelInsta[index] == 0 ? 1.0 : 0.0);
  }

  List<double> opacityLevelInsta =
      List.generate(urlList.length, (index) => 1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Animation 7",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              setState(() {
                _instagramView = !_instagramView;
              });
            },
            icon: Icon(Icons.swap_horizontal_circle_outlined),
          )
        ],
      ),
      body: _instagramView
          ? _buildInstagramView()
          : Center(
              child: AnimatedOpacity(
                opacity: opacityLevel,
                duration: const Duration(seconds: 2),
                child: GestureDetector(
                  onTap: _changeOpacity,
                  child: flutterLogo(),
                ),
              ),
            ),
    );
  }

  Widget flutterLogo() => const FlutterLogo(
        size: 200,
      );

  Widget _buildInstagramView() {
    double size = 130;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          urlList.length,
          (index) => Container(
            margin:
                EdgeInsets.only(top: 10, left: index == 0 ? 10 : 0, right: 10),
            width: size,
            height: size,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: opacityLevelInsta[index],
                  duration: const Duration(seconds: 1),
                  child: AnimatedBuilder(
                    animation: _controller,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.purple],
                        ),
                      ),
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * math.pi,
                        child: child,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _changeOpacityInstagram(index: index);
                  },
                  child: Center(
                    child: CircleAvatar(
                      radius: size * 0.44,
                      backgroundImage: NetworkImage(urlList[index]),
                    ),
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




class Animation2 extends StatefulWidget {
  @override
  _Animation2State createState() => _Animation2State();
}

enum Positions { Bottom, Top, All }

class _Animation2State extends State<Animation2> {
  Positions _position = Positions.Bottom;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 2"),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              child: AnimatedPositioned(
                top: topPosition(height),
                bottom: bottomPosition(height),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: GestureDetector(
                  onTap: changePosition,
                  child: _customBottomAppBar(width),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bottomPosition(double height) =>
      _position == Positions.Top ? height - 150.0 : 0.0;

  topPosition(double height) =>
      _position == Positions.Bottom ? height - 180.0 : 0.0;

  changePosition() {
    setState(() {
      switch (_position) {
        case Positions.Bottom:
          _position = Positions.Top;
          break;
        case Positions.Top:
          _position = Positions.All;
          break;
        case Positions.All:
          _position = Positions.Bottom;
          break;
      }
    });
  }

  Widget _customBottomAppBar(double width) => Container(
        width: width,
        color: Colors.blue,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
}




class Animation1 extends StatefulWidget {
  @override
  _Animation1State createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 1"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NextPage(),
              ),
            );
          },
          child: Text(
            "Next Page",
            style: TextStyle(
              fontSize: 60,
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> with TickerProviderStateMixin {
  String url =
      "https://images.unsplash.com/photo-1609017910188-993211b015d6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fHBhcnJvdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: AnimatedSize(
          vsync: this,
          duration: Duration(seconds: 1),
          child: Container(
            child: Image.network(
              url,
            ),
          ),
        ),
      ),
    );
  }
}
