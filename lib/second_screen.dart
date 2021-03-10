import 'package:flutter/material.dart';
import 'package:petadopter/list_specifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SecondScreen extends StatefulWidget {
  static const String secondScreenRouteName = "Second Screen";
  bool isAdopted;
  String name;
  String location;
  String breed;
  String age;
  String typeOfAnimal;
  String docID;

  SecondScreen({this.isAdopted, this.age,this.name,this.breed,this.location,this.typeOfAnimal,this.docID});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height/20.0,
            ),
            Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: height/10.0,
                )
            ),
            SizedBox(
              height: height/45.0,
            ),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30.0
                ),
              ),
            ),
            SizedBox(
              height: height/15.0,
            ),
            ListSpecification(title: 'Type of Animal', trailName: widget.typeOfAnimal,),
            ListSpecification(title: 'Age', trailName: '${widget.age} Yrs'),
            ListSpecification(title: 'Breed', trailName: widget.breed),
            ListSpecification(title: 'Location', trailName: widget.location),
            SizedBox(
              height: height/15.0,
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                 FirebaseFirestore.instance.collection('pets').doc(widget.docID).update({
                   'isAdopted': !widget.isAdopted,
                 });
                });
                Navigator.pop(context,widget.isAdopted);
              },
              child: Center(
                child: Container(
                  height: height/10.0,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: widget.isAdopted?Colors.grey:Colors.white
                  ),
                  child: Center(
                    child: Text(
                      widget.isAdopted?'Already Adopted':'Adopt!!',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey[900]
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
