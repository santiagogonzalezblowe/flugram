import 'package:flugram/blowe_bloc/blowe_bloc.dart';

abstract class BloweBloc<T, P> extends Bloc<BloweEvent, BloweBlocState> {
  BloweBloc([T? initialData])
      : super(
          initialData != null ? BloweCompleted<T>(initialData) : BloweInitial(),
        ) {
    on<BloweFetch>(_onFetch);
    on<BloweUpdateData>(_onUpdateData);
    on<BloweReset>(onReset);
    on<BloweFetchMore>(_onFetchMore);
  }

  Future<void> onFetch(
    BloweFetch event,
    Emitter<BloweBlocState> emit,
  );

  Future<void> _onFetch(
    BloweFetch event,
    Emitter<BloweBlocState> emit,
  ) {
    if (event.params == null && P != BloweNoParams) {
      throw Exception('Params cannot be null');
    }

    return onFetch(event, emit);
  }

  Future<void> onFetchMore(
    BloweFetchMore event,
    Emitter<BloweBlocState> emit,
  ) =>
      throw UnimplementedError();

  Future<void> _onFetchMore(
    BloweFetchMore event,
    Emitter<BloweBlocState> emit,
  ) {
    if (event.params == null && P != BloweNoParams) {
      throw Exception('Params cannot be null');
    }

    return onFetchMore(event, emit);
  }

  void _onUpdateData(
    BloweUpdateData event,
    Emitter<BloweBlocState> emit,
  ) =>
      emit(BloweCompleted<T>(event.data));

  void onReset(
    BloweReset event,
    Emitter<BloweBlocState> emit,
  ) =>
      emit(BloweInitial());
}
