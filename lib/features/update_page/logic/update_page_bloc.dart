import 'package:flugram/app/repositories/authenticated/page_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/page_model.dart';

class UpdatePageBloc extends BloweLoadBloc<void, PageModel> {
  UpdatePageBloc(
    this._flugramId,
    this._pageRepository,
  );

  final PageRepository _pageRepository;
  final String _flugramId;

  @override
  Future<void> load(PageModel params) {
    return _pageRepository.updatePage(_flugramId, params);
  }
}
