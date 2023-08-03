import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_flutter/resource_manager/route_manager.dart';

import '../manager/bottom_nav_cubit.dart';
import '../manager/todo_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: BlocProvider(
          create: (context) => BottomNavigationCubit(),
          child: BlocBuilder<BottomNavigationCubit, int>(
            builder: (context, state) {

              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Todo App'),
                  ),
                  body: pages[state],
                  bottomNavigationBar: BlocBuilder<BottomNavigationCubit, int>(
                    builder: (context, state) {
                      print("Current BottomNav:: $state");
                      return BottomNavigationBar(
                        currentIndex: state,
                        onTap: (int index) {
                          context.read<BottomNavigationCubit>().updateCurrentIndex(index);
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.list),
                            label: 'Todo List',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.add),
                            label: 'Screen Two',
                          )
                        ],
                      );
                    },
                  ));
            },
          ),
        ));
  }

}
