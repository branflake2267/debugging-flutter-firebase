import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Loading());
  }
}

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  static const totalPeriodCount = 3;

  AnimationController _controller;
  Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = IntTween(begin: 0, end: totalPeriodCount).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          _controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..addListener(() {
        // Update the view
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var text = <TextSpan>[TextSpan(text: 'Loading')];

    int visiblePeriodCount = totalPeriodCount - _animation.value;

    for (int p = 0; p < totalPeriodCount; p++) {
      var periodStyle =
          TextStyle(color: Theme.of(context).textTheme.headline1.color);
      if (visiblePeriodCount <= p) {
        periodStyle =
            TextStyle(color: Theme.of(context).scaffoldBackgroundColor);
      }
      text.add(TextSpan(text: ".", style: periodStyle));
    }

    return FutureBuilder(
        // Wait until Flutter fire is initialized
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            print('Loading error.... ${snapshot.error}');
            return LoadingError();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MyApp();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            children: text,
                            style: Theme.of(context).textTheme.headline1))
                  ]),
            ),
          );
        });
  }
}

class LoadingError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Loading problem... Please try again...');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _serverMessage = 'before';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Try local api request'),
                onPressed: () {
                  // TODO
                },
              ),
              Text(
                '$_serverMessage',
                style: Theme.of(context).textTheme.headline4,
              ),
            ]),
      ),
    );
  }
}
