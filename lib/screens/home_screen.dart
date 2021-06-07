import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/screens/detail_screen.dart';
import 'package:flutter_ui/widgets/bottom_nav_bar.dart';
import 'package:flutter_ui/widgets/category_card.dart';
import 'package:flutter_ui/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This give at total height and with of the device
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          _buildImageBanner(size),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52.h,
                      width: 52.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Good Morning\nRadi',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 27.sp,
                        ),
                  ),
                  SearchBar(),
                  _buildCategoryMenu(context),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Expanded _buildCategoryMenu(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .85,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          CategoryCard(
            title: 'Diet Recommendation',
            imgSource: 'assets/icons/Hamburger.svg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }),
              );
            },
          ),
          CategoryCard(
            title: 'Kegel Exercises',
            imgSource: 'assets/icons/Excrecises.svg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }),
              );
            },
          ),
          CategoryCard(
            title: 'Maditation',
            imgSource: 'assets/icons/Meditation.svg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }),
              );
            },
          ),
          CategoryCard(
            title: 'Yoga',
            imgSource: 'assets/icons/yoga.svg',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  return DetailScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Container _buildImageBanner(Size size) {
    return Container(
      // Here the height of the container is 45% of our total height
      height: size.height * .45,
      decoration: BoxDecoration(
        color: Color(0xFFF5CEB8),
        image: DecorationImage(
          alignment: Alignment.centerLeft,
          image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
        ),
      ),
    );
  }
}
