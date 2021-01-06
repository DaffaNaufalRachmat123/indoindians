import 'package:indoindians/Models/SubNavItem.dart';

class NavItem {
  final String title;
  bool isExpanded;
  final List<SubNavItem> subItemList;
  NavItem({
    this.title,
    this.isExpanded,
    this.subItemList
  });
}