// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_node_store/themes/colors.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webChild;
  final Widget mobileChild;
  const ResponsiveLayout({
    Key? key,
    required this.webChild,
    required this.mobileChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryDark, primaryLight],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                // Using for responsive layout
                child: LayoutBuilder(
                  builder: (
                    BuildContext context,
                    BoxConstraints containers,
                  ) {
                    Widget childWidget = mobileChild;
                    if (containers.maxWidth > 800) {
                      childWidget = webChild;
                    }
                    return childWidget;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
