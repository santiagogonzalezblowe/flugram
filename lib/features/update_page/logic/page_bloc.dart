import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/page_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class PageBloc extends BloweLoadBloc<PageModel, BloweNoParams> {
  PageBloc(this._flugramId, this._pageId, this._pageRepository);

  final String _flugramId;
  final String _pageId;
  final PageRepository _pageRepository;

  @override
  Future<PageModel> load(BloweNoParams params) =>
      _pageRepository.getPage(_flugramId, _pageId);
}
