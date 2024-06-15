import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class SubpageBloc extends BloweLoadBloc<PageModel, BloweNoParams> {
  SubpageBloc(
    this._flugramId,
    this._pageId,
    this._parentPageIds,
    this._subpageRepository,
  );

  final String _flugramId;
  final String _pageId;
  final List<String> _parentPageIds;
  final SubpageRepository _subpageRepository;

  @override
  Future<PageModel> load(BloweNoParams params) =>
      _subpageRepository.getPage(_flugramId, _pageId, _parentPageIds);
}
