import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/constants/assets_const.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';

class HomeItem {
  final String name;
  final String iconString;
  final Color bgColor;
  final Color iconColor;
  final String rootName;

  HomeItem({
    required this.name,
    required this.iconString,
    required this.bgColor,
    required this.iconColor,
    required this.rootName,
  });
}

List<HomeItem> homeItems = [
  HomeItem(
      name: "Students",
      iconString: AssetsConst.student,
      bgColor: ColorCont.greenDark,
      iconColor: ColorCont.greenLight,
      rootName: studentsPage),
  HomeItem(
    name: "Subjects",
    iconString: AssetsConst.subject,
    bgColor: ColorCont.blueLight,
    iconColor: ColorCont.blueDark,
    rootName: subjectsPage,
  ),
  HomeItem(
    name: "Class Rooms",
    iconString: AssetsConst.classroom,
    bgColor: ColorCont.redLight,
    iconColor: ColorCont.redDark,
    rootName: classroomsPage,
  ),
  HomeItem(
    name: "Registration",
    iconString: AssetsConst.registration,
    bgColor: ColorCont.yellowLight,
    iconColor: ColorCont.yellowDark,
    rootName: registrationsPage,
  ),
];
