import 'package:collection/collection.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_response_model.dart';
import 'package:flugram/app/services/jelly_bean/spaceflight_service.dart';

class JellyBeanRepository {
  JellyBeanRepository(this.service);

  final JellyBeanService service;

  JellyBeansResponseModel? _lastJellyBeansResponseModel;

  Future<JellyBeansResponseModel> loadJellyBeans(int page) async {
    final jellyBeansResponseModel = await service.loadJellyBeans(page);

    if (page != 0) {
      final items = _lastJellyBeansResponseModel?.items ?? [];

      jellyBeansResponseModel.items.insertAll(0, items);
    }

    _lastJellyBeansResponseModel = jellyBeansResponseModel;

    return jellyBeansResponseModel;
  }

  Future<JellyBeanModel> loadJellyBean(int id) {
    final jellyBean = _lastJellyBeansResponseModel?.items.firstWhereOrNull(
      (element) => element.beanId == id,
    );

    if (jellyBean != null) return Future.value(jellyBean);

    return service.loadJellyBean(id);
  }
}
