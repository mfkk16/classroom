import 'package:classroom/domain/constants/assets_const.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';

class ConferenceBuilder extends StatelessWidget {
  final int count;

  const ConferenceBuilder({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: count,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(color: ColorCont.black)),
          child: const ImageIcon(AssetImage(AssetsConst.sitLeft)),
        );
      },
    );
  }
}
