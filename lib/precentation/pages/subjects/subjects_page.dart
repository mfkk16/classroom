import 'package:classroom/application/subject/subject_bloc.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectsPage extends StatelessWidget {
  SubjectsPage({super.key, this.isSelection = false});
  bool isSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }

  _body() {
    return Column(
      children: [
        const Text("Subjects",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Expanded(child: _blockBuilder()),
      ],
    );
  }

  Widget _blockBuilder() {
    return BlocBuilder<SubjectBloc, SubjectState>(
      builder: (context, state) {
        if (state is SubjectsLoadedState) {
          return _listBuilder(state);
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text("Something wrong"),
          );
        }
      },
    );
  }

  ListView _listBuilder(SubjectsLoadedState state) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: state.list.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        var item = state.list[index];
        return ListTile(
          onTap: () {
            if (isSelection) {
              Navigator.pop(context, item);
            } else {
              Navigator.pushNamed(context, subjectDetailsPage, arguments: item);
            }
          },
          tileColor: ColorCont.grey,
          title: Text(item.name!),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          subtitle: Text(item.teacher!),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${item.credits!}", style: const TextStyle(fontSize: 16)),
              const Text("Creddit"),
            ],
          ),
        );
      },
    );
  }
}
