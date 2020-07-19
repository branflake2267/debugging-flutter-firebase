import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

// 1. Add a the SingleTickerProviderStateMixin mixin
class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  static const totalPeriodCount = 3;

  AnimationController _controller;
  Animation<int> _animation;

  // 2. Initialize the animation controller and animation counter
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = IntTween(begin: 0, end: totalPeriodCount).animate(_controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          // NOTE: Change the animation counter direction
          _controller.reverse();
        } else if (state == AnimationStatus.dismissed) {
          // NOTE: Change the animation counter direction
          _controller.forward();
        }
      })
      ..addListener(() {
        // NOTE: Update the view
        setState(() {});
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var text = <TextSpan>[TextSpan(text: 'Loading')];

    // 3. Use the animation counter
    int visiblePeriodCount = totalPeriodCount - _animation.value;

    for (int p = 0; p < totalPeriodCount; p++) {
      var periodStyle =
          TextStyle(color: Theme.of(context).textTheme.headline2.color);
      if (visiblePeriodCount <= p) {
        periodStyle =
            TextStyle(color: Theme.of(context).scaffoldBackgroundColor);
      }
      text.add(TextSpan(text: ".", style: periodStyle));
    }

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      children: text,
                      style: Theme.of(context).textTheme.headline2))
            ]),
      ),
    );
  }

  // 4. Tear down the animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
