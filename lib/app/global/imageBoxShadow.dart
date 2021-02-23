import 'package:flutter/material.dart';
import 'package:marcopolo/app/modules/animatedHome/controllers/animated_home_controller.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

class ImageBoxShadow extends StatelessWidget {
  final String imgUrl;
  final String title;
  final AnimatedHomeController homeController;
  ImageBoxShadow({this.imgUrl, this.title, this.homeController});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          homeController.secondPage.value = true;
          homeController.selectedImg = imgUrl;
          homeController.selectedText = title;
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Text(
                title,
                style: AppTextTheme.normalBText(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
