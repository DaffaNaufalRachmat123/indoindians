import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy_flutter/trapezoid.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:indoindians/Models/Model.dart';
import 'package:indoindians/Screens/AccountScreen.dart';
import 'package:indoindians/Screens/Home.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState () => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  static final List<String> imgList = [
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg'
  ];

  static final List<Model> modelList = new List<Model>();
  static final List<Model> model2List = new List<Model>();
  static final List<Widget> pageList = [
    Home(),
    AccountScreen()
  ];
  int page_index = 0;
  @override
  void initState(){
    super.initState();
    modelList.add(Model(id : 0 , image : 'image_1.jpg', title : 'Elegance' , price : 'IDR 250.000'));
    modelList.add(Model(id : 1 , image : 'image_2.jpg',title : 'Cuddly Love' , price : 'IDR 300.000'));
    modelList.add(Model(id : 2 , image : 'image_3.jpg',title : 'Joyful Toddly' , price : 'IDR 300.000'));
  }

  final List<Widget> imageSliders = imgList.map((item) => Container(
    child: Container(
      child: ClipRRect(
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.cover , width : 1000),
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
          )
      ),
    ),
  )).toList();
  var _current = 0;
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body : Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child : pageList[page_index]
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap : (){
                        setState((){
                          page_index = 0;
                        });
                      },
                      child : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("Home.png" , width : 30 , height : 30),
                          Text("Home" , style : TextStyle(
                            color : Colors.black,
                            fontSize : 14 ,
                          ))
                        ],
                      )
                    ),
                    InkWell(
                        onTap : (){

                        },
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("offer_logo.png" , width : 30 , height : 30),
                            Text("Offers" , style : TextStyle(
                              color : Colors.black,
                              fontSize : 14 ,
                            ))
                          ],
                        )
                    ),
                    InkWell(
                        onTap : (){

                        },
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("e_news.png" , width : 30 , height : 30),
                            Text("e News" , style : TextStyle(
                              color : Colors.black,
                              fontSize : 14 ,
                            ))
                          ],
                        )
                    ),
                    InkWell(
                        onTap : (){

                        },
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("Cart.png" , width : 30 , height : 30),
                            Text("Cart" , style : TextStyle(
                              color : Colors.black,
                              fontSize : 14 ,
                            ))
                          ],
                        )
                    ),
                    InkWell(
                        onTap : (){
                          setState((){
                            page_index = 1;
                          });
                        },
                        child : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset("Account.png" , width : 30 , height : 30),
                            Text("Account" , style : TextStyle(
                              color : Colors.black,
                              fontSize : 14 ,
                            ))
                          ],
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}