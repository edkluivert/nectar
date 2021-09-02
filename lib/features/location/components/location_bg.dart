import 'package:flutter/cupertino.dart';

class LocationBg extends StatelessWidget{
  const LocationBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/location_bg.png'),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    );
  }
}