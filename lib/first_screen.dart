import 'package:flutter/material.dart';
import 'package:petadopter/list_scoll.dart';
import 'package:petadopter/second_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isAdopted = false;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    'petadopter.company.com',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height/35,
              ),
              Container(
                height: MediaQuery.of(context).size.height/1.12,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('pets').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView(
                      children: snapshot.data.docs.map((petData) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
                          child: ListScroll(
                            name: petData['name'],
                            age: petData['age'],
                            isAdopted: petData['isAdopted'],
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(
                                isAdopted: petData['isAdopted'],
                                name: petData['name'],
                                age: petData['age'],
                                location: petData['location'],
                                breed: petData['breed'],
                                typeOfAnimal: petData['typeOfAnimal'],
                                docID: petData.id
                              )));
                            },
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
