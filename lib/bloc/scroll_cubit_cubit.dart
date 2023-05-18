import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class ScrollCubit extends Cubit<double> {
  ScrollCubit() : super(0.0);

  void changeOffset(double offset) => emit(offset);
}
