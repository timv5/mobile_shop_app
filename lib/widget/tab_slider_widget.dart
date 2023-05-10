import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color_palette.dart';

class TabSliderWidget extends StatefulWidget {

  const TabSliderWidget({super.key});

  @override
  State<TabSliderWidget> createState() => _TabSliderWidgetState();
}

class _TabSliderWidgetState extends State<TabSliderWidget> {

  int counter = -1;
  String selectedItem = 'Cappuccino';
  final List<String> coffeeTypes = ['Cappuccino', 'Espresso', 'Late', 'Flat White'];

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0 ? const EdgeInsets.only(left: 25.0) : const EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: const Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {setState(() {selectedItem = coffee;});},
              child: Text(
                coffee,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: coffee == selectedItem ? ColorPalette().coffeeSelected : ColorPalette().coffeeUnselected,
                    fontSize: 17.0
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: coffee == selectedItem ? ColorPalette().coffeeSelected : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: ShaderMask(shaderCallback: (Rect bounds) {
        return const LinearGradient(
            begin: Alignment(0.7, -1.0),
            end: Alignment(1.0, -1.0),
            colors: <Color>[Colors.black, Colors.transparent]
        ).createShader(bounds);
      },
        blendMode: BlendMode.dstATop,
        child: Container(
          color: const Color(0xFF0D0F14),
          width: MediaQuery.of(context).size.width - 20.0,
          height: 40.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...coffeeTypes.map((e) {
                counter++;
                if (counter <= 3) {
                  return _buildTypes(e, counter);
                } else {
                  counter = 0;
                  return _buildTypes(e, counter);
                }
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
