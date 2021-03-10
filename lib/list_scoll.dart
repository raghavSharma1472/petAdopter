import 'package:flutter/material.dart';
class ListScroll extends StatelessWidget {
  final name;
  final age;
  final isAdopted;
  final onTap;

  ListScroll({@required this.name,@required this.age,@required this.isAdopted,this.onTap});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height/6,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25.0)
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                //backgroundImage: AssetImage('asset/image'),
                backgroundColor: Colors.grey,
                radius: height/15,
              ),
            ),
            SizedBox(
              width: width/10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 30.0
                  ),
                ),
                Text(
                  'Age: ${age} Yrs',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20.0
                  ),
                ),
                Text(
                  isAdopted?'Adopted':'Looking for Adopter',
                  style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 20.0
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
