import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main(){
  runApp(
    SplashUI()
  );
}

class SplashUI extends StatelessWidget{
  double op=0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      runApp(
          TestUI()
      );
    }
    );

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_advertisers.png'),
                    fit:BoxFit.fill
                )
            ),
            child: Center(
                child:Image.asset('assets/images/logo.png'),
            ),
          )
      ),
    );
  }
}

class TestUI extends StatelessWidget{
  static const platform = MethodChannel('caramel.flutter/native');
  @override
  Widget build(BuildContext context) {
    caramelInitialize();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/advertisers_illustration2.png'),
                    fit:BoxFit.fill
                )
            ),

            child: Stack(
              children: [
                Align(
                  child: Image.asset('assets/images/logo.png'),
                  alignment: Alignment(0,-0.64),
                ),

                Align(
                  child: Image.asset('assets/images/cloudleft.png'),
                  alignment: Alignment(-1,-0.9),
                ),

                Align(
                  child: Image.asset('assets/images/cloudleft.png'),
                  alignment: Alignment(-1,-0.1),
                ),

                Align(
                  child: Image.asset('assets/images/cloudright.png'),
                  alignment: Alignment(1,-0.9),
                ),

                GestureDetector(
                  onTap: () async {
                    if(await platform.invokeMethod('isloaded').then((value) => value??false))
                      runApp(AnotherUI());
                  },
                  child: Align(
                    child: ButtonAnimation(),
                    alignment: Alignment(0,-0.3),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Future<void> caramelInitialize() async {
    await platform.invokeMethod('initialize');
  }
}

//============================================================================================
class ButtonAnimation extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return ButtonAnimationState();
  }
}

class ButtonAnimationState extends State<ButtonAnimation> with SingleTickerProviderStateMixin{
  late AnimationController acontroller;
  late Animation<double> animValues;

  @override
  void initState(){
    super.initState();
    acontroller=AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
      value: 0.1,
    );

    animValues=CurvedAnimation(parent: acontroller, curve: Curves.bounceInOut);
    acontroller.forward();
    acontroller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: acontroller,
      child: Image.asset('assets/images/button.png'),
    );
  }
}

//============================================================================================

class AnotherUI extends StatelessWidget{
  static const platform = MethodChannel('caramel.flutter/native');
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/about_illustration.png'),
                      fit:BoxFit.fill
                  )
              ),


              child:GestureDetector(
                onTap: () async {
                  runApp(TestUI());
                  await platform.invokeMethod('cache');
                },
                child: Align(
                  alignment: Alignment(0,-0.9),
                  child:Text("Back to main",style: TextStyle(fontSize: 60,color:Color.fromARGB(0xff, 0x86, 0x1f, 0x1a) ),),
                ),
              )
          )
      ),
    );
  }

}
