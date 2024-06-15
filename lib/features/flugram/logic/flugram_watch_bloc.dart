import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class FlugramWatchBloc extends BloweWatchBloc<FlugramModel, String> {
  FlugramWatchBloc(this._flugramRepository);

  final FlugramRepository _flugramRepository;

  @override
  Stream<FlugramModel> watch(String params) =>
      _flugramRepository.watchFlugram(params);
}
