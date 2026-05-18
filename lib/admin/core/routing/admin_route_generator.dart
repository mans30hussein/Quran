import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/admin/core/routing/admin_route_args.dart';
import 'package:quran_app/admin/core/routing/admin_routes.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_event.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_program.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/home_program.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/program_details.dart';

import '../../../core/di/dependency_injection.dart';
import '../../home_admin/prsentation/maneger/program_cubit.dart';

Route<dynamic> generateAdminRoute(RouteSettings settings) {
  switch (settings.name) {
    case AdminRoutes.home:
      return MaterialPageRoute(
        builder: (_) => BlocProvider<ProgramCubit>(
          create: (_) => getIt<ProgramCubit>()..getProgram(),
          child:   HomeProgram(),
        ),
      );

    case AdminRoutes.programDetails:
      final args = settings.arguments as ProgramDetailsArgs;
      return MaterialPageRoute(
        builder: (_) => ProgramDetails(program: args.program),
      );

    case AdminRoutes.addProgram:
      return MaterialPageRoute(builder: (_) => const AddProgram());

    case AdminRoutes.addEvent:
      final args = settings.arguments as AddEventArgs;
      return MaterialPageRoute(
        builder: (_) => AddEventScreen(programId: args.programId),
      );

    default:
      return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
