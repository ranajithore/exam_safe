import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AndroidMobile1 extends StatelessWidget {
  AndroidMobile1({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-1.0, 0.0),
                child: SvgPicture.string(
                  _svg_8tqi6f,
                  allowDrawingOutsideViewBox: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const String _svg_8tqi6f =
    '<svg viewBox="-1.0 0.0 369.4 639.7" ><path  d="M 0 108.310302734375 C 51.34614562988281 160.208984375 106.5432434082031 164.7219085693359 183.5624694824219 154.5678253173828 C 224.613525390625 149.1557159423828 282.5613403320313 154.8136138916016 313.2115173339844 168.1066131591797 C 353.0047607421875 185.0301055908203 368.4086303710938 208.7229766845703 368.4086303710938 208.7229766845703 L 368.4086303710938 0 L 0 0 L 0 108.310302734375 Z" fill="#f6e7fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 368.41, 639.72)" d="M 0 108.310302734375 C 51.48551940917969 160.208984375 106.8324432373047 164.7219085693359 184.0607299804688 154.5678253173828 C 225.2232208251953 149.1557159423828 283.3283081054688 154.8136138916016 314.0616760253906 168.1066131591797 C 353.9629821777344 185.0301055908203 369.4086303710938 208.7229766845703 369.4086303710938 208.7229766845703 L 369.4086303710938 0 L 0 0 L 0 108.310302734375 Z" fill="#f6e7fc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
