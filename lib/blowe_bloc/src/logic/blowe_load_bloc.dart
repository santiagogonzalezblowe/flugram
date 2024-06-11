import 'package:flugram/blowe_bloc/blowe_bloc.dart';

abstract class BloweLoadBloc<T, P> extends BloweBloc<T, P> {
  BloweLoadBloc([super.initialData]);

  Future<T> load(P params);

  @override
  Future<void> onFetch(
    BloweFetch event,
    Emitter<BloweBlocState> emit,
  ) async {
    emit(BloweInProgress());

    try {
      final data = await load(event.params!);
      add(BloweUpdateData(data));
    } catch (e) {
      emit(
        BloweError(
          e is Exception ? e : Exception('An error occurred'),
        ),
      );
    }
  }
}
