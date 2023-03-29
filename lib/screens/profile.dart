import 'dart:io';

import 'package:db_hive/db/function/db_function.dart';
import 'package:db_hive/model/data.dart';
import 'package:db_hive/screens/widgets/StudentList.dart';

import 'package:db_hive/screens/widgets/editProfile.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  final double coverHeight = 200;
  final double profileHeight = 160;

  StudentProfile({
    Key? key,
    required this.passValue,
    required this.passId,
  }) : super(key: key);

  Student passValue;
  final int passId;

//functions or widgets========================================================

  Widget top() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(clipBehavior: Clip.none, children: [
      Container(margin: EdgeInsets.only(bottom: bottom), child: CoverImage()),
      Positioned(
        top: top,
        left: 100,
        child: ProfileImage(),
      ),
    ]);
  }

  Widget content() {
    return SizedBox(
      width: 200,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            ' ${passValue.name}',
            style: const TextStyle(fontSize: 28, fontFamily: 'Ubuntu'),
          ),
          Text('Age : ${passValue.age}',
              style: const TextStyle(fontSize: 18, color: Colors.grey)),
          Text('Class : ${passValue.number}',
              style: const TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CoverImage() => Container(
        color: const Color.fromRGBO(234, 236, 238, 2),
        width: double.infinity,
        height: coverHeight,
      );

  // ignore: non_constant_identifier_names
  Widget ProfileImage() => CircleAvatar(
        backgroundImage: FileImage(File(passValue.image)),
        radius: profileHeight / 2,
      );

  Widget floatbtn(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfile(
                        passValueProfile: passValue,
                        index: passId,
                      )));
        },
        child: const Icon(Icons.edit_outlined));
  }

//builder====================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: floatbtn(context),
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
        ),
        body: ListView(children: <Widget>[
          top(),
          content(),
        ]));
  }
}
