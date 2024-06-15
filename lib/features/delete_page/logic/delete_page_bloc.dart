import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/page_repository.dart';

class DeletePageBloc extends BloweLoadBloc<void, BloweNoParams> {
  DeletePageBloc(this._flugramId, this._pageId, this._pageRepository);

  final String _flugramId;
  final String _pageId;
  final PageRepository _pageRepository;

  @override
  Future<void> load(BloweNoParams params) =>
      _pageRepository.deletePage(_flugramId, _pageId);
}
