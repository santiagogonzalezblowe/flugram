import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class JellyBeanBloc extends BloweLoadBloc<JellyBeanModel, int> {
  JellyBeanBloc(this._jellyBeanRepository);

  final JellyBeanRepository _jellyBeanRepository;

  @override
  Future<JellyBeanModel> load(int params) =>
      _jellyBeanRepository.loadJellyBean(params);
}
