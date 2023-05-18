import 'package:clone_spotify/route.dart';
import 'package:flutter/material.dart';
import 'bloc/selected_screen_cubit.dart';
import 'screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedScreenCubit(),
      child: MaterialApp(
        title: 'Spotify',
        theme: ThemeData(fontFamily: 'Gotham'),
        debugShowCheckedModeBanner: false,
        // initialRoute: RouteGenerator.login,
        // onGenerateRoute: RouteGenerator.generateRoute,
        home: const MainScreen(),
      ),
    );
  }
}
