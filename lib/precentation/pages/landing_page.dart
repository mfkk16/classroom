import 'package:classroom/domain/constants/assets_const.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:classroom/domain/models/home_item.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String iconAppbar = AssetsConst.list;
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          _topSection(),
          const SizedBox(height: 30),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _topSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: ColorCont.black),
              children: [
                TextSpan(text: "Hello,", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                TextSpan(text: "\n"),
                TextSpan(text: "Good Morning", style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              _isGridView = !_isGridView;
              iconAppbar = _isGridView ? AssetsConst.grid : AssetsConst.list;
              setState(() {});
            },
            icon: ImageIcon(AssetImage(iconAppbar)))
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: homeItems.length,
      itemBuilder: (context, index) {
        var item = homeItems[index];

        return InkWell(
          onTap: () => Navigator.pushNamed(context, item.rootName, arguments: false),
          child: Card(
            color: item.bgColor,
            child: Center(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(AssetImage(item.iconString), size: 40, color: item.iconColor),
                    const SizedBox(height: 10),
                    Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      itemCount: homeItems.length,
      separatorBuilder: (context, index) => SizedBox(height: 20),
      itemBuilder: (context, index) {
        var item = homeItems[index];
        return InkWell(
          onTap: () => Navigator.pushNamed(context, item.rootName),
          child: Card(
            color: item.bgColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        );
      },
    );
  }
}
