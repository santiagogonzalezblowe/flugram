import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';
import 'package:flugram/features/home/models/flugram_model.dart';

class FlugramsBloc extends BloweWatchBloc<List<FlugramModel>, BloweNoParams> {
  FlugramsBloc(this._flugramsRepository);

  final FlugramsRepository _flugramsRepository;

  @override
  Stream<List<FlugramModel>> watch(BloweNoParams params) {
    return _flugramsRepository.watchFlugrams();
  }
}
