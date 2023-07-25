import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:surf_practice_magic_ball/screen/cubit/ball_state.dart';
import 'package:surf_practice_magic_ball/screen/domain/repository.dart';

class MagicBallCubit extends Cubit<MagicBallState> {
  final MagicBallRepository _repository;
  final ShakeRepository _shakeRepository;

  StreamSubscription<bool>? _sub;

  // создание воспроизведения ответа
  FlutterTts flutterTts = FlutterTts();

  MagicBallCubit(this._repository, this._shakeRepository)
      : super(const MagicBallState.init()) {
    _sub = _shakeRepository.listen((_) => sendRequest());
  }

  Future<void> sendRequest() async {
    emit(state.copyWith(loading: true));
    try {
      final result = await _repository.getPrediction();
      // настройка воспроизведения ответа
      flutterTts.setLanguage('eng');
      flutterTts.setPitch(0.8);
      flutterTts.speak(result);
      emit(state.copyWith(prediction: result));
    } catch (_) {
      emit(state.copyWith(error: 'error'));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
