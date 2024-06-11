import 'dart:async';

import 'package:flugram/blowe_bloc/blowe_bloc.dart';

abstract class BloweWatchBloc<T, P> extends BloweBloc<T, P> {
  BloweWatchBloc([super.initialData]);

  StreamSubscription? _streamSubscription;

  Stream<T> watch(P params);

  @override
  Future<void> onFetch(
    BloweFetch event,
    Emitter<BloweBlocState> emit,
  ) async {
    emit(BloweInProgress());

    _streamSubscription?.cancel();

    final completer = Completer<void>();

    _streamSubscription = watch(event.params).listen(
      (data) {
        if (!emit.isDone) {
          add(BloweUpdateData(data));
        }
      },
      onError: (e) {
        if (!emit.isDone) {
          emit(
            BloweError(
              e is Exception ? e : Exception('An error occurred'),
            ),
          );
        }
      },
      onDone: () {
        if (!completer.isCompleted) {
          completer.complete();
        }
      },
    );

    return completer.future;
  }

  @override
  void onReset(BloweReset event, Emitter<BloweBlocState> emit) {
    emit(BloweInitial());
    _streamSubscription?.cancel();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
