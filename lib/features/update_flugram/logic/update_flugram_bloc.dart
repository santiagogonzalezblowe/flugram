import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class UpdateFlugramBloc extends BloweLoadBloc<void, FlugramModel> {
  UpdateFlugramBloc(this._flugramRepository);

  final FlugramRepository _flugramRepository;

  @override
  Future<void> load(FlugramModel params) {
    return _flugramRepository.updateFlugram(params);
  }
}
