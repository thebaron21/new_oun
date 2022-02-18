
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Page extends GetPage{
  Page({@required String name,@required GetView page,@required Bindings binding}) : super(
    
    name: name,
    page: () => page,
    binding: binding
  );

}