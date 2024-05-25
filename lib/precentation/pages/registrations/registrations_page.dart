// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:classroom/application/registration_new/registration_new_bloc.dart';
import 'package:classroom/domain/config/route/routes_constants.dart';
import 'package:classroom/precentation/widgets/error_tryagain_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:classroom/application/registration/registration_bloc.dart';
import 'package:classroom/domain/constants/color_cont.dart';

class RegistrationsPage extends StatelessWidget {
  const RegistrationsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          Expanded(child: _blockBuilder(context)),
          _newRegButton(context),
        ],
      ),
    );
  }

  ElevatedButton _newRegButton(context) {
    return ElevatedButton(
      onPressed: () async {
        BlocProvider.of<RegistrationNewBloc>(context).add(Reset());

        bool isRegistered = await Navigator.pushNamed(context, registrationNewPage) as bool;
        if (isRegistered) {
          BlocProvider.of<RegistrationBloc>(context).add(FetchRegistrations());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully Registered'), duration: Duration(seconds: 2)));
        }
      },
      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)), backgroundColor: ColorCont.blueLight),
      child: const Text("New Registration", style: TextStyle(color: ColorCont.blueDark)),
    );
  }

  Widget _blockBuilder(contextMain) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state is RegLoadedState) {
          return _listBuilder(state);
        } else if (state is RegLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ErrorTryagainWidget(
            onPressed: () => BlocProvider.of<RegistrationBloc>(context).add(FetchRegistrations()),
          );
        }
      },
    );
  }

  Widget _listBuilder(RegLoadedState state) {
    if (state.listRegistrations.isEmpty) {
      return const Center(child: Text("No Data", style: TextStyle(fontSize: 18)));
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: state.listRegistrations.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) {
        var item = state.listRegistrations[index];

        return ListTile(
          onTap: () async {
            var isDeleted = await Navigator.pushNamed(context, registrationDetailsPage, arguments: item) as bool;
            if (isDeleted) {
              BlocProvider.of<RegistrationBloc>(context).add(FetchRegistrations());
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration deleted successfully'), duration: Duration(seconds: 2)));
            }
          },
          tileColor: ColorCont.grey,
          title: Text("Registration ID : #${item.id!}"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
        );
      },
    );
  }
}
