import 'package:classroom/application/registration_details/registration_details_bloc.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:classroom/domain/core/entity/registration_entity.dart';
import 'package:classroom/precentation/widgets/error_tryagain_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationDetailsPage extends StatelessWidget {
  final RegistrationEntity registrationEntity;

  const RegistrationDetailsPage({super.key, required this.registrationEntity});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RegistrationDetailsBloc>(context).add(FetchRegistrationDetails(registrationEntity));

    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }

  _body(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const Text("Registration", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          Expanded(child: _blockBuilder()),
          _deleteButton(context),
        ],
      ),
    );
  }

  ElevatedButton _deleteButton(context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<RegistrationDetailsBloc>(context).add(DeleteRegistration(registrationId: registrationEntity.id!, context: context));
      },
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), backgroundColor: Colors.red),
      child: const Text("Delete Registration", style: TextStyle(color: Colors.white)),
    );
  }

  Widget _blockBuilder() {
    return BlocBuilder<RegistrationDetailsBloc, RegistrationDetailsState>(
      builder: (context, state) {
        if (state is LoadedRegDetails) {
          return _listBuilder(state);
        } else if (state is LoadingRegDetails) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ErrorTryagainWidget(
            onPressed: () => BlocProvider.of<RegistrationDetailsBloc>(context).add(FetchRegistrationDetails(registrationEntity)),
          );
        }
      },
    );
  }

  Widget _listBuilder(LoadedRegDetails state) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ListTile(
          tileColor: ColorCont.grey,
          title: const Text("Student Details"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.studentEntity.name!),
              Text(state.studentEntity.email!),
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: Text("Age : ${state.studentEntity.age}", style: const TextStyle(fontSize: 15)),
        ),
        const SizedBox(height: 15),
        ListTile(
          tileColor: ColorCont.grey,
          title: const Text("Subject Details"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.subjectEntity.name!),
              Text(state.subjectEntity.teacher!),
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: Text("Credit : ${state.subjectEntity.credits}", style: const TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
