import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';

class DeleteSubpageBloc extends BloweLoadBloc<void, BloweNoParams> {
  DeleteSubpageBloc(
    this._flugramId,
    this._pageId,
    this._parentPageIds,
    this._pageRepository,
  );

  final String _flugramId;
  final String _pageId;
  final List<String> _parentPageIds;
  final SubpageRepository _pageRepository;

  @override
  Future<void> load(BloweNoParams params) => _pageRepository.deleteSubpage(
        _flugramId,
        _pageId,
        _parentPageIds,
      );
}
