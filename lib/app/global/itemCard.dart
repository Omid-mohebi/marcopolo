import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marcopolo/app/theme/AppColors.dart';
import 'package:marcopolo/app/theme/TextTheme.dart';

class ItemCards extends StatelessWidget {
  final String photoUrl;
  final Map<String, dynamic> description;
  final bool hasDots;
  // final
  const ItemCards({
    this.photoUrl,
    this.description,
    this.hasDots = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          child: Row(
            crossAxisAlignment:
                hasDots ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Image.asset(
                  'assets/images/3.jpg',
                  height: 110,
                  width: 110,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Serena',
                            style: AppTextTheme.normalBText()
                                .copyWith(color: Colors.black),
                          ),
                          // Spacer(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween
                        children: [
                          Text(
                            'City: Kabul',
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Stars: 4',
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Price: >\$50',
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Status: Available',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              hasDots
                  ? IconButton(
                      icon: Icon(
                        Entypo.dots_three_vertical,
                        size: 20,
                        color: AppColors.strongDecative,
                      ),
                      onPressed: () {})
                  : IconButton(
                      icon: Icon(
                        Entypo.chevron_right,
                        color: Colors.black,
                        size: 37,
                      ),
                      onPressed: null,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
