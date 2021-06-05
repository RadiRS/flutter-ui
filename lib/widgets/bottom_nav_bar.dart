import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBottomNavItem(
            title: 'Today',
            imgSource: 'assets/icons/calendar.svg',
            onPress: () {},
          ),
          _buildBottomNavItem(
            isActive: true,
            title: 'All Exercises',
            imgSource: 'assets/icons/gym.svg',
            onPress: () {},
          ),
          _buildBottomNavItem(
            title: 'Settings',
            imgSource: 'assets/icons/Settings.svg',
            onPress: () {},
          ),
        ],
      ),
    );
  }

  GestureDetector _buildBottomNavItem({
    required String title,
    required String imgSource,
    Function()? onPress,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            imgSource,
            color: isActive ? kActiveIconColor : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(
              color: isActive ? kActiveIconColor : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
