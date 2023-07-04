import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_tdd/features/spacx/domain/repositories/launch_history_repository.dart';
import 'features/spacx/presentation/pages/home_page.dart';

void main() {
  runApp(

      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
    home:RepositoryProvider(
      create: (context) => LaunchHistoryRepository(),
      child: const Home(),
    ),
    );
  }
}

