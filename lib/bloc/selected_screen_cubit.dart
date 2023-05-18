import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class SelectedScreenCubit extends Cubit<int> {
  SelectedScreenCubit() : super(0);

  void changeScreen(int key) => emit(key);
}
