import 'package:equatable/equatable.dart';

abstract class BloweEvent extends Equatable {
  const BloweEvent();

  @override
  List<Object?> get props => [];
}

class BloweFetch<P> extends BloweEvent {
  const BloweFetch(this.params);

  final P params;

  @override
  List<Object?> get props => [params];
}

class BloweUpdateData<T> extends BloweEvent {
  const BloweUpdateData(this.data);

  final T data;

  @override
  List<Object?> get props => [data];
}

class BloweReset extends BloweEvent {}
