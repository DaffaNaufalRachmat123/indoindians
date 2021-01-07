import 'package:flutter/material.dart';
import 'package:indoindians/Blocs/Models/ChangePage.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class PageState extends Equatable {
  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {}

class OnPageChange extends PageState {
  final int index;
  OnPageChange({@required this.index});
  @override
  List<Object> get props => [ index ];
}