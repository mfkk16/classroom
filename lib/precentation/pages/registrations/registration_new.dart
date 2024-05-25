import 'package:classroom/application/registration_new/registration_new_bloc.dart';
import 'package:flutter/material.dart';
import 'package:classroom/domain/constants/color_cont.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationNew extends StatelessWidget {
  const RegistrationNew({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationNewBloc, RegistrationNewState>(
      listener: (context, state) {
        if (state is ErrorRegNew) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error), duration: const Duration(seconds: 2)));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: _body(context),
      ),
    );
  }

  _body(context) {
    RegistrationNewBloc registrationNewBloc = BlocProvider.of<RegistrationNewBloc>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Column(
        children: [
          const Text("New Registration", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _selectStudent(registrationNewBloc, context),
          const SizedBox(height: 10),
          _selectSubject(registrationNewBloc, context),
          const SizedBox(height: 20),
          _registerButton(registrationNewBloc, context),
        ],
      ),
    );
  }

  Widget _registerButton(RegistrationNewBloc registrationNewBloc, context) {
    return BlocBuilder<RegistrationNewBloc, RegistrationNewState>(
      builder: (context, state) {
        if (state is LoadingRegistrationNew) {
          return const Center(child: const CircularProgressIndicator());
        } else {
          return ElevatedButton(
            onPressed: () {
              registrationNewBloc.add(Register(context: context));
            },
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), backgroundColor: ColorCont.greenLight),
            child: const Text("Register", style: TextStyle(color: Colors.white)),
          );
        }
      },
    );
  }

  Widget _selectStudent(RegistrationNewBloc registrationNewBloc, BuildContext context) {
    return ListTile(
      onTap: () => registrationNewBloc.add(SelectStudent(context: context)),
      tileColor: ColorCont.grey,
      title: Text(registrationNewBloc.studentEntity == null ? "Select a student" : registrationNewBloc.studentEntity!.name!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }

  Widget _selectSubject(RegistrationNewBloc registrationNewBloc, BuildContext context) {
    return ListTile(
      onTap: () => registrationNewBloc.add(SelectSubject(context: context)),
      tileColor: ColorCont.grey,
      title: Text(registrationNewBloc.subjectEntity == null ? "Select a subject" : registrationNewBloc.subjectEntity!.name!),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
