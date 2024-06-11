import 'package:flugram/app/repositories/authenticated/flugrams_repository.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class EditSubpageBloc extends BloweLoadBloc<void, CreateAppParams> {
  EditSubpageBloc(this._appsRepository);

  final FlugramsRepository _appsRepository;

  @override
  Future<void> load(CreateAppParams params) {
    // return _appsRepository.createApp(params.name);
    return Future.value();
  }
}

class CreateAppParams {
  CreateAppParams(this.name);

  final String name;
}
