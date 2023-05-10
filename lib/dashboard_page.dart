import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:mobile_shop_app/widget/bottom_navigation_bar_widget.dart';
import 'package:mobile_shop_app/widget/search_bar_widget.dart';
import 'package:mobile_shop_app/widget/tab_slider_widget.dart';

import 'color_palette.dart';
import 'models/coffee_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  // final List<CoffeeItem> coffeeList = [
  //   CoffeeItem(
  //       rating: 4.5,
  //       itemImg: 'assets/images/coffeemain.jpg',
  //       price: 4.21,
  //       subtitle: 'With Oat Milk',
  //       title: 'Cappuccino'),
  //   CoffeeItem(
  //       rating: 4.2,
  //       itemImg: 'assets/images/secondary.jpg',
  //       price: 3.14,
  //       subtitle: 'With Chocolate',
  //       title: 'Cappuccino')
  // ];

  /// top view grid button and profile image
  Widget _getViewAndProfileWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // todo
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7.0),
              height: 42.0,
              width: 42.0,
              decoration: BoxDecoration(
                  color: const Color(0xFF1F242C),
                  borderRadius: BorderRadius.circular(12.0)
              ),
              child: const Iconify(HeroiconsSolid.view_grid, size: 12.0, color: Color(0xFF4D4F52)),
            ),
          ),
          GestureDetector(
            // todo
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7.0),
              height: 42.0,
              width: 42.0,
              decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/images/model.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0)
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// top header text
  Widget _getHeaderText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
      child: Text(
        'Find the best coffee for you',
        style: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 40.0
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getViewAndProfileWidget(),
            _getHeaderText(context),
            const SizedBox(height: 20.0,),
            const SearchBarWidget(),
            const SizedBox(height: 20.0,),
            const TabSliderWidget()
          ],
        ),
      ),
    );
  }
}
