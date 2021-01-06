import 'package:flutter/material.dart';
import 'package:indoindians/Models/NavItem.dart';
import 'package:indoindians/Models/SubNavItem.dart';

class ExpandableListView extends StatefulWidget {
  final String title;
  final List<SubNavItem> itemList;
  const ExpandableListView({Key key, this.title , this.itemList}) : super(key: key);

  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 1.0),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 5.0),
            child : InkWell(
              onTap : (){
                setState((){
                  expandFlag = !expandFlag;
                });
              },
              child : Container(
                  width : MediaQuery.of(context).size.width,
                  child : Row(
                    mainAxisAlignment : MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child : Row(
                            mainAxisAlignment : MainAxisAlignment.start,
                            children: <Widget>[
                              Text(widget.title , style : TextStyle(
                                  color : Colors.white,
                                  fontSize : 13,
                                  fontFamily : "Times New Roman"
                              ))
                            ],
                          )
                      ),
                      InkWell(
                          onTap : (){
                            setState((){
                              expandFlag = !expandFlag;
                            });
                          },
                          child : Icon(
                              expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              size : 20,
                              color : Colors.white
                          )
                      )
                    ],
                  )
              )
            )
          ),
          new ExpandableContainer(
              expanded: expandFlag,
              child: new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration:
                    new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.grey), color: Colors.black),
                    child: new ListTile(
                      title: new Text(
                        widget.itemList[index].teks,
                        style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      leading: new Icon(
                        Icons.local_pizza,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: widget.itemList.length,
              ))
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}