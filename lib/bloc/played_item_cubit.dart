import 'package:bloc/bloc.dart';
import 'package:clone_spotify/data/content.dart';
import 'package:meta/meta.dart';

class PlayedItemCubit extends Cubit<Content?> {
  bool _stop = false;
  PlayedItemCubit() : super(forYouData[0]);

  void playTrack(Content track) => emit(track);

  void pause() {
    if (state != null) _stop = true;
  }

  void play() {
    if(state != null) _stop = true;
  }

  bool isPlaying() => state != null && _stop == false;
}
