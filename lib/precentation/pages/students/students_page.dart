import 'package:classroom/application/student/student_bloc.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

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
        const Text("Students"),
        Expanded(child: _blockBuilder()),
      ],
    );
  }

  Widget _blockBuilder() {
    return BlocBuilder<StudentBloc, StudentState>(
      builder: (context, state) {
        if (state is StudentsLoadedState) {
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

  ListView _listBuilder(StudentsLoadedState state) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: state.list.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        var item = state.list[index];
        return ListTile(
          onTap: () => Navigator.pushNamed(context, studentsDetailsPage,
              arguments: item),
          tileColor: ColorCont.grey,
          title: Text(item.name!),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          subtitle: Text(item.email!),
          trailing:  Text("Age : ${item.age!}"),
        );
      },
    );
  }
}
