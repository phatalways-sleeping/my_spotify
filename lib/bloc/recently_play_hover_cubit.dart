import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';



class RecentlyPlayHoverCubit extends Cubit<int> {
  RecentlyPlayHoverCubit() : super(-1);

  void setHoveredTrack(int index) => emit(index);
}
