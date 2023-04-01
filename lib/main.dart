import 'package:anime_list_app/ui/pages/home/bloc/home_bloc.dart';
import 'package:anime_list_app/ui/pages/home/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/pages/home/bloc/home_state.dart';
import 'ui/pages/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: BlocProvider(
        create: (context) =>
            HomeBloc(HomeLoadingState())..add(InitialListEvent()),
        child: const HomePage(),
      ),
    );
  }
}
