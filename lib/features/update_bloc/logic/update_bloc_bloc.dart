import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/bloc_model.dart';

class UpdateBlocBloc extends BloweLoadBloc<void, BlocModel> {
  UpdateBlocBloc(
    this._flugramId,
    this._parentPageIds,
    this._blocRepository,
  );

  final BlocRepository _blocRepository;
  final String _flugramId;
  final List<String> _parentPageIds;

  @override
  Future<void> load(BlocModel params) {
    return _blocRepository.updateBloc(
      _flugramId,
      params,
      _parentPageIds,
    );
  }
}
