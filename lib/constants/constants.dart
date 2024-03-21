import 'package:flutter/material.dart';

double height(context) => MediaQuery.of(context).size.height;

double width(context) => MediaQuery.of(context).size.width;

void navigateTo(context, screen) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen;
        },
      ),
    );

void navigateToFinish(context, screen) =>
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return screen;
    }), (route) => false);

String api = "v2/top-headlines";

String apiKey = "f60b2e6c3b3b496f9b06472617b573ff";
