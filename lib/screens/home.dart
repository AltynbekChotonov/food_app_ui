import 'package:flutter/material.dart';
import 'package:food_app_ui/screens/details.dart';

import '../conststant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    var buttonBar4 = ButtonBar();
    var buttonBar3 = buttonBar4;
    var buttonBar2 = buttonBar3;
    var buttonBar = buttonBar2;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopBar(),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: '    Дени сак', style: kHeading),
                    TextSpan(text: '\n     Тамак-аш', style: kHeadingLight),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
            ],
          ),
        ),
        Stack(
          children: <Widget>[
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                color: Colors.white,
                width: screenWidth,
                height: screenHeight * 0.695,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Items(
                  screenHeight: screenHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      buttonBar,
                      buttonBar,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonIcon, required this.press});

  final Icon buttonIcon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 100;
    clippedPath.moveTo(0.0 + curveDistance, 0.0);
    clippedPath.quadraticBezierTo(0.0, 0.0, 0.0, 0.0 + curveDistance);
    clippedPath.lineTo(0.0, size.height);
    clippedPath.lineTo(size.width, size.height);
    clippedPath.lineTo(size.width, 0.0);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Items extends StatelessWidget {
  const Items({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(),
                ),
              );
            },
            child: Iteam(
              screenHeight: screenHeight,
              itemName: "Татым тамак",
              itemPrice: 200,
              itemPic: "assets/Images/plate1.png",
            ),
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Салат тамак",
            itemPrice: 250,
            itemPic: "assets/Images/plate3.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Авокадо салат",
            itemPrice: 300,
            itemPic: "assets/Images/plate4.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Авокадо салат",
            itemPrice: 350,
            itemPic: "assets/Images/plate4.png",
          ),
          Iteam(
            screenHeight: screenHeight,
            itemName: "Джаз салат",
            itemPrice: 400,
            itemPic: "assets/Images/plate3.png",
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

class Iteam extends StatelessWidget {
  const Iteam({
    required this.screenHeight,
    required this.itemName,
    required this.itemPrice,
    required this.itemPic,
  });

  final double screenHeight;
  final String itemName;
  final double itemPrice;
  final String itemPic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 50,
          backgroundImage: AssetImage("$itemPic"),
        ),
        Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$itemName',
                style: kHeadingSmall,
                maxLines: 1,
              ),
              Text('\сом. $itemPrice', style: kPriceText),
            ],
          ),
        ),
        Icon(
          Icons.add,
          size: 30,
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.filter_list,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 15,
            ),
            Icon(
              Icons.more_horiz,
              size: 20,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}
