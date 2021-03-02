import 'package:flutter/material.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onTap;
  final Widget heading;
  const FatButton(
      {Key key,
      this.text,
      this.textColor = Colors.black,
      this.buttonColor = Colors.white,
      this.onTap,
      this.heading})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(70 / 2)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.decative.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: ButtonTheme(
          height: 70,
          child: RaisedButton(
            elevation: 0,
            color: buttonColor,
            onPressed: () => onTap(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heading ?? Container(),
                  ],
                )),
                Text(
                  text,
                  style:
                      AppTextTheme.superLargBText().copyWith(color: textColor),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
