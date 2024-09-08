import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';
import 'presentation/blocs/state_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() {
  final injection = InjectionContainer();
  runApp(MyApp(stateBloc: injection.stateBloc));
}

class MyApp extends StatelessWidget {
  final StateBloc stateBloc;

  MyApp({required this.stateBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => stateBloc,
      child: MaterialApp(
        title: 'Malaysia States',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
