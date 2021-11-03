import 'package:flutter/material.dart';
import 'package:flutter_application_1/Tabs/chat_room.dart';
import 'package:flutter_application_1/utils/themes.dart';

class OutlineItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String code;
  final String time;
  OutlineItem(
      {required this.name,
      required this.imageUrl,
      required this.code,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatRoom()),
          );
        },
        child: Container(
          height: 90,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFFFFF),
                Color(0xffFFFFFF),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    '$imageUrl',
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$name',
                        style: blackTextStyle.copyWith(
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '$code',
                            style: greyTextStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  '$time',
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
