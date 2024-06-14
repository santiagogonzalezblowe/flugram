import 'package:flugram/app/repositories/authenticated/bloc_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class DeleteBlocBloc extends BloweLoadBloc<void, BloweNoParams> {
  DeleteBlocBloc(
    this._flugramId,
    this._blocId,
    this._parentPageIds,
    this._pageRepository,
  );

  final String _flugramId;
  final String _blocId;
  final List<String> _parentPageIds;
  final BlocRepository _pageRepository;

  @override
  Future<void> load(BloweNoParams params) => _pageRepository.deleteBloc(
        _flugramId,
        _blocId,
        _parentPageIds,
      );
}
