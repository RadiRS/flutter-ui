import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/widgets/bottom_nav_bar.dart';
import 'package:flutter_ui/widgets/category_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

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
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52,
                      width: 52,
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
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  _buildSearchInput(),
                  _buildCategoryMenu(),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Expanded _buildCategoryMenu() {
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
            onPress: () {},
          ),
          CategoryCard(
            title: 'Kegel Exercises',
            imgSource: 'assets/icons/Excrecises.svg',
            onPress: () {},
          ),
          CategoryCard(
            title: 'Maditation',
            imgSource: 'assets/icons/Meditation.svg',
            onPress: () {},
          ),
          CategoryCard(
            title: 'Yoga',
            imgSource: 'assets/icons/yoga.svg',
            onPress: () {},
          ),
        ],
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Search',
          icon: SvgPicture.asset('assets/icons/search.svg'),
          border: InputBorder.none,
        ),
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
