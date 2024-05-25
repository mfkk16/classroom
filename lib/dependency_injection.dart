import 'package:classroom/application/classroom_details/classroom_details_bloc.dart';
import 'package:classroom/application/classrooms/classrooms_bloc.dart';
import 'package:classroom/application/registration/registration_bloc.dart';
import 'package:classroom/application/registration_details/registration_details_bloc.dart';
import 'package:classroom/application/registration_new/registration_new_bloc.dart';
import 'package:classroom/application/student/student_bloc.dart';
import 'package:classroom/application/subject/subject_bloc.dart';
import 'package:classroom/domain/usecases/delete_registration_usecase.dart';
import 'package:classroom/domain/usecases/get_all_classroom_usecase.dart';
import 'package:classroom/domain/usecases/get_all_registration_usecase.dart';
import 'package:classroom/domain/usecases/get_all_students_usecase.dart';
import 'package:classroom/domain/usecases/get_all_subjects_usecase.dart';
import 'package:classroom/domain/usecases/get_classroom_by_id.dart';
import 'package:classroom/domain/usecases/get_student_by_id_usecase.dart';
import 'package:classroom/domain/usecases/get_subject_bt_id.dart';
import 'package:classroom/domain/usecases/new_registration_usecase.dart';
import 'package:classroom/domain/usecases/set_classroom_subject.dart';
import 'package:classroom/infrastructure/network_repi_impli.dart';
import 'package:classroom/infrastructure/network_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network class
  sl.registerSingleton<NetworkRepo>(NetworkRepoImpli());

  // Usecases
  sl.registerSingleton<GetAllSubjectsUsecase>(GetAllSubjectsUsecase(sl()));
  sl.registerSingleton<GetAllRegistrationUsecase>(GetAllRegistrationUsecase(sl()));
  sl.registerSingleton<GetAllStudentsUsecase>(GetAllStudentsUsecase(sl()));
  sl.registerSingleton<GetAllClassroomUsecase>(GetAllClassroomUsecase(sl()));

  sl.registerSingleton<GetClassroomByIdUsecase>(GetClassroomByIdUsecase(sl()));
  sl.registerSingleton<GetStudentByIdUsecase>(GetStudentByIdUsecase(sl()));
  sl.registerSingleton<GetSubjectByIdUsecase>(GetSubjectByIdUsecase(sl()));
  sl.registerSingleton<SetClassroomSubjectUsecase>(SetClassroomSubjectUsecase(sl()));
  sl.registerSingleton<DeleteRegistrationUsecase>(DeleteRegistrationUsecase(sl()));
  sl.registerSingleton<NewRegistrationUsecase>(NewRegistrationUsecase(sl()));

  // Bloc Classes
  sl.registerLazySingleton<SubjectBloc>(() => SubjectBloc(sl()));
  sl.registerLazySingleton<StudentBloc>(() => StudentBloc(sl()));
  sl.registerLazySingleton<RegistrationBloc>(() => RegistrationBloc(sl()));
  sl.registerLazySingleton<ClassroomsBloc>(() => ClassroomsBloc(sl()));
  sl.registerLazySingleton<ClassroomDetailsBloc>(() => ClassroomDetailsBloc(sl(), sl(), sl()));
  sl.registerLazySingleton<RegistrationDetailsBloc>(() => RegistrationDetailsBloc(sl(), sl(), sl()));
  sl.registerLazySingleton<RegistrationNewBloc>(() => RegistrationNewBloc(sl()));
}
