import 'package:carousel_slider/carousel_slider.dart';
import 'package:clippy_flutter/trapezoid.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:indoindians/Components/ScrollColumnExpandable.dart';
import 'package:indoindians/Models/Model.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState () => HomeState();
}

class HomeState extends State<Home> {
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
  @override
  void initState(){
    super.initState();
    modelList.add(Model(id : 0 , image : 'image_1.jpg', title : 'Elegance' , price : 'IDR 250.000'));
    modelList.add(Model(id : 1 , image : 'image_2.jpg',title : 'Cuddly Love' , price : 'IDR 300.000'));
    modelList.add(Model(id : 2 , image : 'image_3.jpg',title : 'Joyful Toddly' , price : 'IDR 300.000'));

    model2List.add(Model(id : 0 , image : 'image_4.jpg' , title : 'Hamper Set 31' , price : 'IDR 840.000'));
    model2List.add(Model(id : 1 , image : 'image_5.jpg' , title : 'Hamper Set 24' , price : 'IDR 730.000'));
    model2List.add(Model(id : 2 , image : 'image_6.jpg' , title : 'Hamper Set 18' , price : 'IDR 790.000'));
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
      body : Container(
        color : Color.fromARGB(255 , 27 , 42 , 61),
        child : SafeArea(
          child : new Container(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child : Container(
                        color : Colors.white,
                        child : Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
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
                                  width : double.infinity,
                                  height : 230,
                                  margin : EdgeInsets.only(left : 20),
                                  child : ListView.builder(
                                      itemCount : modelList.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder : ( context , position ){
                                        var model = modelList[position];
                                        return Container(
                                            margin : EdgeInsets.only(right : 10),
                                            decoration : BoxDecoration(
                                              color : Colors.white,
                                              border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61)),
                                            ),
                                            child : Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    width : 150,
                                                    height : 150,
                                                    decoration : BoxDecoration(
                                                        image : DecorationImage(
                                                            image : AssetImage(model.image),
                                                            fit : BoxFit.cover
                                                        )
                                                    )
                                                ),
                                                Text(model.title , style : TextStyle(
                                                    fontSize : 12,
                                                    fontWeight : FontWeight.bold,
                                                    fontFamily : "Times New Roman"
                                                )),
                                                Text(model.price , style : TextStyle(
                                                    fontSize : 11,
                                                    fontWeight : FontWeight.bold,
                                                    fontFamily : "Times New Roman"
                                                )),
                                                Container(
                                                    width : 150,
                                                    height : 53,
                                                    decoration : BoxDecoration(
                                                        border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                                    ),
                                                    child : InkWell(
                                                        onTap : (){

                                                        },
                                                        child : Center(
                                                            child : Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Image.asset("icon_keranjang.png" , width : 15 , height : 15),
                                                                Text("Add to Cart" , style : TextStyle(
                                                                  color : Color.fromARGB(255 , 27 , 42 , 61),
                                                                  fontSize : 13,
                                                                  fontFamily : "Times New Roman"
                                                                ))
                                                              ],
                                                            )
                                                        )
                                                    )
                                                )
                                              ],
                                            )
                                        );
                                      }
                                  )
                                ),
                                SizedBox(height : 10),
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
                                    width : double.infinity,
                                    height : 230,
                                    margin : EdgeInsets.only(left : 20),
                                    child : ListView.builder(
                                        itemCount : model2List.length,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemBuilder : ( context , position ){
                                          var model = model2List[position];
                                          return Container(
                                              margin : EdgeInsets.only(right : 10),
                                              decoration : BoxDecoration(
                                                color : Colors.white,
                                                border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61)),
                                              ),
                                              child : Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      width : 150,
                                                      height : 150,
                                                      decoration : BoxDecoration(
                                                          image : DecorationImage(
                                                              image : AssetImage(model.image),
                                                              fit : BoxFit.cover
                                                          )
                                                      )
                                                  ),
                                                  Text(model.title , style : TextStyle(
                                                      fontSize : 12,
                                                      fontWeight : FontWeight.bold,
                                                      fontFamily : "Times New Roman"
                                                  )),
                                                  Text(model.price , style : TextStyle(
                                                      fontSize : 11,
                                                      fontWeight : FontWeight.bold,
                                                      fontFamily : "Times New Roman"
                                                  )),
                                                  Container(
                                                      width : 150,
                                                      height : 53,
                                                      decoration : BoxDecoration(
                                                          border : Border.all(width : 1 , color : Color.fromARGB(255 , 27 , 42 , 61))
                                                      ),
                                                      child : InkWell(
                                                          onTap : (){

                                                          },
                                                          child : Center(
                                                              child : Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: <Widget>[
                                                                  Image.asset("icon_keranjang.png" , width : 15 , height : 15),
                                                                  Text("Add to Cart" , style : TextStyle(
                                                                      color : Color.fromARGB(255 , 27 , 42 , 61),
                                                                      fontSize : 13,
                                                                      fontFamily : "Times New Roman"
                                                                  ))
                                                                ],
                                                              )
                                                          )
                                                      )
                                                  )
                                                ],
                                              )
                                          );
                                        }
                                    )
                                )
                              ],
                            ),
                            Column(
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
                                                margin : EdgeInsets.only(left : 40 , right : 30 , bottom : 30),
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
                            ),
                          ],
                        )
                      )
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      )
    );
  }
}