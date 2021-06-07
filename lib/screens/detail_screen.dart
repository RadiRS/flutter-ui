import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/widgets/search_bar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(children: [
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: kBlueLightColor,
            image: DecorationImage(
              image: AssetImage('assets/images/meditation_bg.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * .05),
                  Text(
                    'Meditation',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '3-10 Min Course',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6, // it just take 60% of total width
                    child: Text(
                      'Live happier and healthier by learing the fundamentals of meditation',
                    ),
                  ),
                  SizedBox(
                    width: size.width * .5,
                    child: SearchBar(),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      SessionCard(
                        seassionNum: 1,
                        isDone: true,
                        onPress: () {},
                      ),
                      SessionCard(
                        seassionNum: 2,
                        onPress: () {},
                      ),
                      SessionCard(
                        seassionNum: 3,
                        onPress: () {},
                      ),
                      SessionCard(
                        seassionNum: 4,
                        onPress: () {},
                      ),
                      SessionCard(
                        seassionNum: 5,
                        onPress: () {},
                      ),
                      SessionCard(
                        seassionNum: 6,
                        onPress: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Meditation',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/Meditation_women_small.svg',
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Basic 2',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(height: 10),
                              Text('Start your deepen you practice'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/Lock.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  final void Function()? onPress;

  const SessionCard({
    Key? key,
    required this.seassionNum,
    this.isDone = false,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(13.0),
          child: Container(
            // contraint.maxWdith provide us the available with for this widget
            width: constraint.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 13,
                  spreadRadius: -13,
                  color: kShadowColor,
                )
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPress,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor),
                        ),
                        height: 43,
                        width: 43,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      Text(
                        'Session $seassionNum',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
