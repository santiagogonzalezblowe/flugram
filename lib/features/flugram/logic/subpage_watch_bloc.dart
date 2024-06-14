import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';

class SubpageWatchBloc extends BloweWatchBloc<PageModel, BloweNoParams> {
  SubpageWatchBloc(
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
  Stream<PageModel> watch(BloweNoParams params) => _subpageRepository.watchPage(
        _flugramId,
        _pageId,
        _parentPageIds,
      );
}
