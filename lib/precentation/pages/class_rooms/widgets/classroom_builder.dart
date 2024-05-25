import 'package:classroom/domain/constants/assets_const.dart';
import 'package:flutter/material.dart';

class ClassroomBuilder extends StatelessWidget {
  final int count;

  const ClassroomBuilder({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (count / 2).ceil(),
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ImageIcon(AssetImage(AssetsConst.sitRight)),
            Container(height: 50, width: 200, color: Colors.grey),
            if (index * 2 + 1 < count)
              const ImageIcon(AssetImage(AssetsConst.sitLeft))
            else
              const SizedBox(width: 24)
          ],
        );
      },
    );
  }
}
