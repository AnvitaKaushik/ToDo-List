import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Task/task_bloc.dart';
import 'package:to_do_app/Task/task_event.dart';
import 'package:to_do_app/Task/task_state.dart';

import 'Task/task_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TaskBloc(),
        child: const TaskListScreen(),
      ),
    );
  }
}


