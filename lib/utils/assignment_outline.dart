import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/themes.dart';

class OutlineItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String work;
  OutlineItem(
      {required this.name,
      required this.imageUrl,
      required this.work});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        height: 95,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffFFFFFF),
              Color(0xffFFFFFF),
            ],
          ),
          color: Colors.purple[900],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                '$imageUrl',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$work',
                      style: greyTextStyle.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/images/arrow1.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
