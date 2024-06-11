import 'package:flugram/app/repositories/authenticated/subpages_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';

class SubpagesBloc extends BloweWatchBloc<List<PageModel>, BloweNoParams> {
  SubpagesBloc(
    this._subpagesRepository,
    this._flugramId,
    this._parentPageIds,
  );

  final SubpagesRepository _subpagesRepository;
  final String _flugramId;
  final List<String> _parentPageIds;

  @override
  Stream<List<PageModel>> watch(BloweNoParams params) =>
      _subpagesRepository.watchSubpages(_flugramId, _parentPageIds);
}
