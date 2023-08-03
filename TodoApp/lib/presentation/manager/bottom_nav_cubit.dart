// bottom_navigation_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void updateCurrentIndex(int index) {
    emit(index);
  }
}
