import 'package:blowe_bloc/blowe_bloc.dart';
import 'package:flugram/app/repositories/jelly_bean/jelly_bean_repository.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';

class JellyBeanSearchBloc
    extends BloweSearchBloc<JellyBeanModel, JellyBeanSearchParams> {
  JellyBeanSearchBloc(this.jellyBeanRepository) : super();

  final JellyBeanRepository jellyBeanRepository;

  @override
  Future<BlowePaginationModel<JellyBeanModel>> load(
    JellyBeanSearchParams params,
    int page,
  ) =>
      jellyBeanRepository.loadJellyBeansByGroupName(page, params.query);

  @override
  JellyBeanModel fromJson(Map<String, dynamic> json) =>
      JellyBeanModel.fromJson(json);
}

class JellyBeanSearchParams extends BloweSearchParams {
  const JellyBeanSearchParams(super.query);
}
