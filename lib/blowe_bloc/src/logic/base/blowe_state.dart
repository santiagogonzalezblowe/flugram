import 'package:equatable/equatable.dart';

abstract class BloweBlocState extends Equatable {
  const BloweBlocState();

  @override
  List<Object?> get props => [];
}

class BloweInitial extends BloweBlocState {}

class BloweInProgress extends BloweBlocState {}

class BloweCompleted<T> extends BloweBlocState {
  const BloweCompleted(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class BloweError extends BloweBlocState {
  const BloweError(this.error);

  final Exception error;

  @override
  List<Object> get props => [error];
}
