import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/subpage_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class UpdateSubpageBloc extends BloweLoadBloc<void, PageModel> {
  UpdateSubpageBloc(
    this._flugramId,
    this._parentPageIds,
    this._subpageRepository,
  );

  final SubpageRepository _subpageRepository;
  final String _flugramId;
  final List<String> _parentPageIds;

  @override
  Future<void> load(PageModel params) {
    return _subpageRepository.updatePage(
      _flugramId,
      params,
      _parentPageIds,
    );
  }
}
