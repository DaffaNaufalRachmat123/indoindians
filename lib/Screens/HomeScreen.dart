import 'package:clippy_flutter/trapezoid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState () => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build ( BuildContext context ){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body : Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              child: Container(
                color : Colors.red,
                child : SafeArea(
                  child : Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap : (){

                            },
                            child : IconButton(
                                icon : Image.asset("icon_dashboard.png" , width : 30 , height : 30 , color : Colors.white)
                            )
                          ),
                          Expanded(
                            child : Row(
                              mainAxisAlignment : MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                    margin : EdgeInsets.only(left : 40 , right : 40 , bottom : 30),
                                    child : Trapezoid(
                                      cutLength: 25.0,
                                      edge: Edge.BOTTOM,
                                      child: GestureDetector(
                                        child: Container(
                                            color: Color.fromARGB(255 , 27 , 42 , 61),
                                            width: 150.0,
                                            height: 30.0,
                                            child : Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                        ),
                                      ),
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
                                  child : Image.asset("icon_keranjang.png" , width : 25 , height : 25 , color : Colors.white)
                              ),
                              SizedBox(width : 10),
                              InkWell(
                                  onTap : (){

                                  },
                                  child : Image.asset("icon_wishlist.png" , width : 25 , height : 25 , color : Colors.white)
                              ),
                              InkWell(
                                  onTap : (){

                                  },
                                  child : Image.asset("icon_notification.png" , width : 25 , height : 25 , color : Colors.white)
                              ),
                              SizedBox(width : 10)
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                )
              ),
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