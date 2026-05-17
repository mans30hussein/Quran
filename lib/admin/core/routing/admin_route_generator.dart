import 'package:flutter/material.dart';
import 'package:quran_app/admin/core/routing/admin_route_args.dart';
import 'package:quran_app/admin/core/routing/admin_routes.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_event.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/add_program.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/home_program.dart';
import 'package:quran_app/admin/home_admin/prsentation/view/program_details.dart';

Route<dynamic> generateAdminRoute(RouteSettings settings) {
  switch (settings.name) {
    case AdminRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeProgram());

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
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
