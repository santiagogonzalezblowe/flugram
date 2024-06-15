import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';

class JellyBeanBloc extends BloweLoadBloc<JellyBeanModel, int> {
  JellyBeanBloc(this._jellyBeanRepository);

  final JellyBeanRepository _jellyBeanRepository;

  @override
  Future<JellyBeanModel> load(int params) =>
      _jellyBeanRepository.loadJellyBean(params);
}
