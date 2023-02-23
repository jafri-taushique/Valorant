import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/core/features/agent-screen/domain/agent_data_bloc.dart';

import 'core/features/Dashboard/presentation/Dashboard.dart';
import 'core/features/agent-screen/presentation/agentScreen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (BuildContext context) => AgentDataBloc(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), initialRoute: '/', routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const DashBoard(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/agentScreen': (context) => const AgentScreen(),
    });
  }
}
