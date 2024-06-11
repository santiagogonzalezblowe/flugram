import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class FlugramLoadBloc extends BloweLoadBloc<FlugramModel, String> {
  FlugramLoadBloc(this._flugramRepository);

  final FlugramRepository _flugramRepository;

  @override
  Future<FlugramModel> load(String params) {
    return _flugramRepository.loadFlugram(params);
  }
}
