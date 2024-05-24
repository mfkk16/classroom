import 'package:classroom/application/classrooms/classrooms_bloc.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomsPage extends StatelessWidget {
  const ClassroomsPage({super.key});

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
        const Text("Class Rooms",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Expanded(child: _blockBuilder()),
      ],
    );
  }

  Widget _blockBuilder() {
    return BlocBuilder<ClassroomsBloc, ClassroomsState>(
      builder: (context, state) {
        if (state is ClassroomsLoadedState) {
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

  ListView _listBuilder(ClassroomsLoadedState state) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: state.list.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        var item = state.list[index];
        return ListTile(
          tileColor: ColorCont.grey,
          title: Text(item.name!),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          subtitle: Text(item.layout!),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${item.size!}", style: const TextStyle(fontSize: 16)),
              const Text("Seats"),
            ],
          ),
        );
      },
    );
  }
}
