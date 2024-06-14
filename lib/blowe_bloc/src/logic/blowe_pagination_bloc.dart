import 'package:flugram/blowe_bloc/blowe_bloc.dart';

abstract class BlowePaginationBloc<T extends BlowePaginationModel, P>
    extends BloweBloc<T, P> {
  BlowePaginationBloc([super.initialData]);

  Future<T> load(P params, int page);

  int _page = 0;

  @override
  Future<void> onFetch(
    BloweFetch event,
    Emitter<BloweBlocState> emit,
  ) async {
    _page = 0;

    emit(BloweInProgress());

    try {
      final data = await load(event.params!, _page);
      add(BloweUpdateData(data));
    } catch (e) {
      emit(
        BloweError(
          e is Exception ? e : Exception('An error occurred'),
        ),
      );
    }
  }

  @override
  Future<void> onFetchMore(
    BloweFetchMore event,
    Emitter<BloweBlocState> emit,
  ) async {
    final state = this.state;
    if (state is! BloweCompleted<T>) return;

    _page++;

    emit(BloweCompleted(state.data, isLoadingMore: true));

    try {
      final data = await load(event.params!, _page);
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
