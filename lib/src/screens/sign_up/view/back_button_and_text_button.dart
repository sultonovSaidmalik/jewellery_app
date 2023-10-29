import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';

import '../../../common/constants/text_style.dart';
class BackButtonAndText extends StatelessWidget {
  final void Function() textButton;
  final void Function() backButton;
  const BackButtonAndText({super.key, required this.textButton, required this.backButton});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Back Button
              GestureDetector(
                onTap: backButton,
                child: const SizedBox(
                  width: 46,
                  height: 46,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xFF333B48),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              /// Skip Button
              TextButton(
                onPressed: textButton,
                child:  Text(
                  Strings.skip.text,
                  style: Styles.w400,
                ),
              ),
            ],
          ),

          /// Text
           Text(
            Strings.create.text,
            style: Styles.w700_30,
          )
        ],
      ),
    );
  }
}
