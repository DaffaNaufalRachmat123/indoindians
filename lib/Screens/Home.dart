import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy_flutter/trapezoid.dart';
import 'package:clippy_flutter/trapezoid.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:indoindians/Components/ExpandableListView.dart';
import 'package:indoindians/Components/NavigationDrawer.dart';
import 'package:indoindians/Components/ScrollColumnExpandable.dart';
import 'package:indoindians/Models/Model.dart';
import 'package:indoindians/Models/NavItem.dart';
import 'package:indoindians/Models/SubNavItem.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState () => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  static final List<String> imgList = [
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg',
    'Banner.jpg'
  ];
  static final List<Model> modelList = [
    Model(id : 0 , image : 'image_1.jpg', title : 'Elegance' , price : 'IDR 250.000'),
    Model(id : 1 , image : 'image_2.jpg',title : 'Cuddly Love' , price : 'IDR 300.000'),
    Model(id : 2 , image : 'image_3.jpg',title : 'Joyful Toddly' , price : 'IDR 300.000')
  ];
  static final List<Model> model2List = [
    Model(id : 0 , image : 'image_4.jpg' , title : 'Hamper Set 31' , price : 'IDR 840.000'),
    Model(id : 1 , image : 'image_5.jpg' , title : 'Hamper Set 24' , price : 'IDR 730.000'),
    Model(id : 2 , image : 'image_6.jpg' , title : 'Hamper Set 18' , price : 'IDR 790.000')
  ];
  List<NavItem> itemList = new List<NavItem>();

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
      key : scaffoldKey,
      drawer : NavigationDrawer(),
      body : Container(
        child : Stack(
          children: <Widget>[
            Container(
              width : MediaQuery.of(context).size.width,
              height : MediaQuery.of(context).size.height / 1.9,
              color : Color.fromARGB(255 , 27 , 42 , 61)
            ),
            Container(
              margin : EdgeInsets.only(bottom : 80),
              child : SafeArea(
                child : Container(
                  color : Colors.white,
                  child: SingleChildScrollView(
                      child : Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width : MediaQuery.of(context).size.width,
                                child : Row(
                                  mainAxisAlignment : MainAxisAlignment.spaceBetween ,
                                  children: <Widget>[
                                    InkWell(
                                      onTap : (){

                                      },
                                      child : Container(
                                        margin : EdgeInsets.only(left : 10),
                                        child : InkWell(
                                          onTap : (){
                                            scaffoldKey.currentState.openDrawer();
                                          },
                                          child : Image.asset("icon_dashboard.png" , width : 25 , height : 25 , color : Colors.black)
                                        )
                                      )
                                    ),
                                    Expanded(
                                        child : Row(
                                          mainAxisAlignment : MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                margin : EdgeInsets.only(left : 60 , bottom : 3),
                                                child : Trapezoid(
                                                    cutLength : 25.0,
                                                    edge : Edge.BOTTOM,
                                                    child : GestureDetector(
                                                        child : Container(
                                                            padding : EdgeInsets.only(left : 50, right : 50),
                                                            decoration : BoxDecoration(
                                                                color: Color.fromARGB(255 , 27 , 42 , 61),
                                                                borderRadius : BorderRadius.only(topLeft : Radius.circular(-10) , topRight : Radius.circular(-10))
                                                            ),
                                                            height : 30.0,
                                                            child : Row(
                                                              mainAxisAlignment : MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text("IND" , style : TextStyle(
                                                                    color : Colors.white,
                                                                    fontSize : 10,
                                                                    fontWeight : FontWeight.bold
                                                                )),
                                                                Image.asset("indoindians_logo.png" , width : 20 , height : 20),
                                                                Text("INDIANS" , style : TextStyle(
                                                                    color : Colors.white,
                                                                    fontSize : 10,
                                                                    fontWeight : FontWeight.bold
                                                                ))
                                                              ],
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                          ],
                                        )
                                    ),
                                    Row(
                                      mainAxisAlignment : MainAxisAlignment.end,
                                      children: <Widget>[
                                        InkWell(
                                            onTap : (){

                                            },
                                            child : Image.asset("icon_keranjang.png" , width : 25 , height : 25 , color : Colors.black)
                                        ),
                                        SizedBox(width : 10),
                                        InkWell(
                                            onTap : (){

                                            },
                                            child : Image.asset("icon_wishlist.png" , width : 25 , height : 25 , color : Colors.black)
                                        ),
                                        InkWell(
                                            onTap : (){

                                            },
                                            child : Image.asset("icon_notification.png" , width : 25 , height : 25 , color : Colors.black)
                                        ),
                                        SizedBox(width : 10)
                                      ],
                                    )
                                  ],
                                )
                              ),
                              AspectRatio(
                                aspectRatio : 2.1,
                                child : Container(
                                    child : Column(
                                      children: <Widget>[
                                        CarouselSlider(
                                          items: imageSliders,
                                          options: CarouselOptions(
                                              autoPlay: true,
                                              aspectRatio: 2.1,
                                              viewportFraction: 1.0,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _current = index;
                                                });
                                              }
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              SizedBox(height : 30),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width : 30),
                                  Text("Gift to India" , style : TextStyle(
                                      color : Color.fromARGB(255 , 27 , 42 , 61),
                                      fontSize : 14,
                                      fontFamily : "Times New Roman"
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width : 20),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                          width : 100,
                                          height : 2,
                                          decoration : BoxDecoration(
                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                          )
                                      ),
                                      Triangle.isosceles(
                                        edge: Edge.BOTTOM,
                                        child: Container(
                                          color: Color.fromARGB(255 , 27 , 42 , 61),
                                          width: 20.0,
                                          height: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height : 10),
                              Container(
                                margin : EdgeInsets.only(left : 20),
                                child : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child : Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children : modelList.asMap().map((index , item) => MapEntry(index ,
                                            Container(
                                                margin : EdgeInsets.only(right : 10),
                                                decoration : BoxDecoration(
                                                    color : Colors.white,
                                                    border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61)),
                                                    borderRadius : BorderRadius.circular(5)
                                                ),
                                                child : Column(
                                                  children: <Widget>[
                                                    Image.asset(item.image , width : 130 , height : 130 , fit : BoxFit.cover),
                                                    Row(
                                                      mainAxisAlignment : MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(item.title , style : TextStyle(
                                                            color : Colors.black,
                                                            fontSize : 12,
                                                            fontFamily : "Times New Roman"
                                                        ))
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(item.price , style : TextStyle(
                                                            color : Colors.black,
                                                            fontSize : 11,
                                                            fontFamily : "Times New Roman"
                                                        ))
                                                      ],
                                                    ),
                                                    Container(
                                                        width : 130,
                                                        padding : EdgeInsets.all(7),
                                                        decoration : BoxDecoration(
                                                            border : Border(
                                                                top : BorderSide(
                                                                    width : 1, color : Color.fromARGB(255 , 27 , 42 , 61)
                                                                )
                                                            )
                                                        ),
                                                        child : GestureDetector(
                                                            onTap : (){

                                                            },
                                                            child : Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Image.asset("icon_keranjang.png" , width : 10 , height : 10),
                                                                Text("Add to Cart" , style : TextStyle(
                                                                    color : Color.fromARGB(255 , 27 , 42 , 61),
                                                                    fontSize : 12
                                                                ))
                                                              ],
                                                            )
                                                        )
                                                    )
                                                  ],
                                                )
                                            ))).values.toList()
                                    )
                                ),
                              ),
                              SizedBox(height : 20),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width : 30),
                                  Text("Christmas" , style : TextStyle(
                                      color : Color.fromARGB(255 , 27 , 42 , 61),
                                      fontSize : 14,
                                      fontFamily : "Times New Roman"
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment : MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(width : 20),
                                  Column(
                                    children: <Widget>[
                                      Container(
                                          width : 100,
                                          height : 2,
                                          decoration : BoxDecoration(
                                              color : Color.fromARGB(255 , 27 , 42 , 61)
                                          )
                                      ),
                                      Triangle.isosceles(
                                        edge: Edge.BOTTOM,
                                        child: Container(
                                          color: Color.fromARGB(255 , 27 , 42 , 61),
                                          width: 20.0,
                                          height: 10.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height : 10),
                              Container(
                                margin : EdgeInsets.only(left : 20),
                                child : SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child : Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children : model2List.asMap().map((index , item) => MapEntry(index ,
                                            Container(
                                                margin : EdgeInsets.only(right : 10),
                                                decoration : BoxDecoration(
                                                    color : Colors.white,
                                                    border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61)),
                                                    borderRadius : BorderRadius.circular(5)
                                                ),
                                                child : Column(
                                                  children: <Widget>[
                                                    Image.asset(item.image , width : 130 , height : 130),
                                                    Row(
                                                      mainAxisAlignment : MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(item.title , style : TextStyle(
                                                            color : Colors.black,
                                                            fontSize : 12,
                                                            fontFamily : "Times New Roman"
                                                        ))
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(item.price , style : TextStyle(
                                                            color : Colors.black,
                                                            fontSize : 11,
                                                            fontFamily : "Times New Roman"
                                                        ))
                                                      ],
                                                    ),
                                                    Container(
                                                        width : 130,
                                                        padding : EdgeInsets.all(7),
                                                        decoration : BoxDecoration(
                                                            border : Border(
                                                                top : BorderSide(
                                                                    width : 1, color : Color.fromARGB(255 , 27 , 42 , 61)
                                                                )
                                                            )
                                                        ),
                                                        child : GestureDetector(
                                                            onTap : (){

                                                            },
                                                            child : Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Image.asset("icon_keranjang.png" , width : 10 , height : 10),
                                                                Text("Add to Cart" , style : TextStyle(
                                                                    color : Color.fromARGB(255 , 27 , 42 , 61),
                                                                    fontSize : 12
                                                                ))
                                                              ],
                                                            )
                                                        )
                                                    )
                                                  ],
                                                )
                                            ))).values.toList()
                                    )
                                ),
                              ),
                              SizedBox(height : 20),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
              )
            )
          ],
        )
      )
    );
  }
}