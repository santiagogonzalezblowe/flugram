import 'package:flugram/app/repositories/authenticated/flugram_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class DeleteFlugramBloc extends BloweLoadBloc<void, BloweNoParams> {
  DeleteFlugramBloc(
    this._flugramRepository,
    this._flugramId,
  );

  final FlugramRepository _flugramRepository;
  final String _flugramId;

  @override
  Future<void> load(BloweNoParams params) {
    return _flugramRepository.deleteFlugram(_flugramId);
  }
}
