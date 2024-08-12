import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/slider_screen.dart';

class SliderController extends GetxController {
  int selectedIndex = 0;
  int totalIndex = 0;
  PageController imagePageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  PageController textPageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  List<SliderData> sliderList = [];

  changeIndex(value) {
    selectedIndex = value;
    update();
  }

  @override
  void onInit() {
    var sliderData = SliderData();
    sliderData.heading = "Access Global Content";
    sliderData.desc =
        "Break through geo-restrictions and access content from anywhere in the world. Stream your favorite shows, movies, and sports without any limitations. Enjoy the internet without borders";
    sliderData.image = "assets/slider/Internet Day-bro.svg";
    sliderList.add(sliderData);
    sliderData = SliderData();
    sliderData.heading = "Fast and Reliable Servers";
    sliderData.desc =
        "Enjoy lightning-fast connection speeds with our extensive global server network. Stream, browse, and download with no buffering or lag. Experience the internet at its best, wherever you are";
    sliderData.image = "assets/slider/Internet on the go-bro.svg";
    sliderList.add(sliderData);
    sliderData = SliderData();
    sliderData.heading = "Browse Anonymously";
    sliderData.desc =
        "Keep your online activities private with our IP masking technology. Surf the web without leaving a trace, free from trackers and advertisers. Your privacy is always protected with us";
    sliderData.image = "assets/slider/Internet on the go-rafiki.svg";
    sliderList.add(sliderData);
    super.onInit();
  }
}
