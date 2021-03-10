import 'package:flutter/material.dart';
import 'constants.dart';
class ListSpecification extends StatelessWidget {
  final title;
  final trailName;

  ListSpecification({@required this.title,@required this.trailName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              '$title:',
              style: kSecondScreenListStyle
          ),
          Text(
              trailName,
              style: kSecondScreenListStyle
          )
        ],
      ),
    );
  }
}
