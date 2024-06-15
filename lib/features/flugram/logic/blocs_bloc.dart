import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/blocs_repository.dart';
import 'package:flugram/features/home/models/bloc_model.dart';

class BlocsBloc extends BloweWatchBloc<List<BlocModel>, BloweNoParams> {
  BlocsBloc(
    this._blocsRepository,
    this._flugramId,
    this._parentPageIds,
  );

  final BlocsRepository _blocsRepository;
  final String _flugramId;
  final List<String> _parentPageIds;

  @override
  Stream<List<BlocModel>> watch(BloweNoParams params) =>
      _blocsRepository.watchBlocs(_flugramId, _parentPageIds);
}
