import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreenBackground extends StatelessWidget {
  LoginScreenBackground({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Container(
        child: Stack(
              children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(-1.0, 0.0),
                            child: SvgPicture.string(
                              _svg_d8vxyj,
                              allowDrawingOutsideViewBox: true,
                              width: double.infinity,
                              alignment: Alignment.topLeft,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
            ),
        ),
      );
  }
}

const color = '"#d580ff"';
const String _svg_d8vxyj =
    '<svg viewBox="-1.0 0.0 361.9 639.7" ><path  d="M 0 108.310302734375 C 50.29469299316406 160.208984375 104.3614807128906 164.7219085693359 179.8035278320313 154.5678253173828 C 220.0139465332031 149.1557159423828 276.7751159667969 154.8136138916016 306.7976379394531 168.1066131591797 C 345.7760314941406 185.0301055908203 360.8644409179688 208.7229766845703 360.8644409179688 208.7229766845703 L 360.8644409179688 0 L 0 0 L 0 108.310302734375 Z" fill=$color stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 359.86, 639.72)" d="M 0 108.310302734375 C 50.29469299316406 160.208984375 104.3614807128906 164.7219085693359 179.8035278320313 154.5678253173828 C 220.0139465332031 149.1557159423828 276.7751159667969 154.8136138916016 306.7976379394531 168.1066131591797 C 345.7760314941406 185.0301055908203 360.8644409179688 208.7229766845703 360.8644409179688 208.7229766845703 L 360.8644409179688 0 L 0 0 L 0 108.310302734375 Z" fill=$color stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
