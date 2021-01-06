import 'package:flutter/material.dart';
import 'package:indoindians/Components/ExpandableListView.dart';
import 'package:indoindians/Models/NavItem.dart';
import 'package:indoindians/Models/SubNavItem.dart';

class NavigationDrawer extends StatelessWidget {
  List<NavItem> initItemList = [
    NavItem(
        title : 'Gift to India',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Gift to Jakarta',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Artworks',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Home & Living',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Health & Beauty',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Fashion',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Festive',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    ),
    NavItem(
        title : 'Food',
        isExpanded : false,
        subItemList : [
          SubNavItem(teks : 'Dropdown')
        ]
    )
  ];
  @override
  Widget build ( BuildContext context ){
    return Drawer(
        child : Stack(
          children: <Widget>[
            Container(
              color : Color.fromARGB(255 , 27 , 42 , 61),
            ),
            SafeArea(
                child : Container(
                    margin : EdgeInsets.only(left : 20 , right : 20),
                    child : Column(
                      children: <Widget>[
                        SizedBox(height : 20),
                        Row(
                          mainAxisAlignment : MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap : (){
                                  Navigator.pop(context);
                                },
                                child : Container(
                                    width : 30,
                                    height : 30,
                                    decoration : BoxDecoration(
                                        shape : BoxShape.circle,
                                        color : Colors.white
                                    ),
                                    child : Center(
                                        child : Icon(Icons.arrow_back , color : Color.fromARGB(255 , 27 , 42 , 61) , size : 15)
                                    )
                                )
                            ),
                            SizedBox(width : 10),
                            Text("Menu Utama" , style : TextStyle(
                                color : Colors.white,
                                fontWeight : FontWeight.bold,
                                fontFamily : "Times New Roman"
                            ))
                          ],
                        ),
                        SizedBox(height : 20),
                        Row(
                          children: <Widget>[
                            Container(
                                width : 60 ,
                                height : 60,
                                decoration : BoxDecoration(
                                    shape : BoxShape.circle
                                ),
                                child : Image.asset("user_icon_vector.png")
                            ),
                            Expanded(
                                child : Container(
                                    margin : EdgeInsets.only(left : 10),
                                    width : MediaQuery.of(context).size.height,
                                    child : Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                                Icons.person,
                                                color : Colors.white,
                                                size : 18
                                            ),
                                            SizedBox(width : 5),
                                            Text("Jakha Surya" , overflow : TextOverflow.ellipsis , style : TextStyle(
                                                color : Colors.white,
                                                fontSize : 13 ,
                                                fontFamily : "Times New Roman"
                                            ))
                                          ],
                                        ),
                                        SizedBox(height : 5),
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                                Icons.monetization_on,
                                                color : Color.fromARGB(255 , 217 , 124 , 54),
                                                size : 18
                                            ),
                                            SizedBox(width : 5),
                                            Text("Rp 2.000.000" , overflow : TextOverflow.ellipsis ,  style : TextStyle(
                                                color : Color.fromARGB(255 , 217 , 124 , 54),
                                                fontSize : 13 ,
                                                fontFamily : "Times New Roman"
                                            ))
                                          ],
                                        ),
                                        SizedBox(height : 15),
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("Toko saya : " , style : TextStyle(
                                                color : Colors.white,
                                                fontSize : 13,
                                                fontFamily : "Times New Roman"
                                            )),
                                            Text("Khare Digital" , overflow : TextOverflow.ellipsis ,  style : TextStyle(
                                                color : Colors.white,
                                                fontSize : 13,
                                                fontFamily : "Times New Roman",
                                                fontWeight : FontWeight.bold
                                            ))
                                          ],
                                        )
                                      ],
                                    )
                                )
                            ),
                            Row(
                              mainAxisAlignment : MainAxisAlignment.center,
                              children: <Widget>[
                                InkWell(
                                    onTap : (){

                                    },
                                    child : Icon(Icons.settings , color : Colors.white)
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height : 30),
                        Expanded(
                            child : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                primary: false,
                                shrinkWrap: true,
                                itemCount : initItemList.length,
                                itemBuilder : ( context , position ){
                                  return ExpandableListView(title : initItemList[position].title , itemList : initItemList[position].subItemList);
                                }
                            )
                        )
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}