import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/authenticated/pages_repository.dart';
import 'package:flugram/features/home/models/page_model.dart';

class PagesBloc extends BloweWatchBloc<List<PageModel>, BloweNoParams> {
  PagesBloc(this._pagesRepository, this.flugramId);

  final PagesRepository _pagesRepository;
  final String flugramId;

  @override
  Stream<List<PageModel>> watch(BloweNoParams params) =>
      _pagesRepository.watchPages(flugramId);
}
