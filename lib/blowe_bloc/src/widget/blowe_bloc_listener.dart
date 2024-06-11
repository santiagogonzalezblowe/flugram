import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flutter/widgets.dart';

typedef BloweBlocWidgetListener<S extends BloweBlocState> = void Function(
  BuildContext context,
  S state,
);

class BloweBlocListener<B extends BloweBloc, T>
    extends BlocListenerBase<B, BloweBlocState> {
  BloweBlocListener({
    super.key,
    super.child,
    BloweBlocWidgetListener<BloweCompleted<T>>? onCompleted,
    BloweBlocWidgetListener<BloweError>? onError,
    BloweBlocWidgetListener<BloweInProgress>? onLoading,
    BloweBlocWidgetListener<BloweInitial>? onInitial,
  }) : super(
          listener: (context, state) {
            if (state is BloweCompleted<T>) onCompleted?.call(context, state);
            if (state is BloweError) onError?.call(context, state);
            if (state is BloweInProgress) onLoading?.call(context, state);
            if (state is BloweInitial) onInitial?.call(context, state);
          },
        );
}
