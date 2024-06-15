import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_response_model.dart';

class JellyBeansBloc
    extends BlowePaginationBloc<JellyBeansResponseModel, BloweNoParams> {
  JellyBeansBloc(this._jellyBeanRepository);

  final JellyBeanRepository _jellyBeanRepository;

  @override
  Future<JellyBeansResponseModel> load(
    BloweNoParams params,
    int page,
  ) =>
      _jellyBeanRepository.loadJellyBeans(page);
}
