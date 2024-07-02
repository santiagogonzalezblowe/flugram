import 'package:collection/collection.dart';
import 'package:flugram/app/services/jelly_bean/jelly_bean_service.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/app/services/jelly_bean/models/jelly_bean_response_model.dart';

class JellyBeanRepository {
  JellyBeanRepository(this.service);

  final JellyBeanService service;

  JellyBeansResponseModel? _lastJellyBeansResponseModel;
  JellyBeansResponseModel? _lastSearchJellyBeansResponseModel;

  Future<JellyBeansResponseModel> loadJellyBeans(int page) async {
    final jellyBeansResponseModel = await service.loadJellyBeans(page);

    if (page != 0) {
      final items = _lastJellyBeansResponseModel?.items ?? [];

      jellyBeansResponseModel.items.insertAll(0, items);
    }

    _lastJellyBeansResponseModel = jellyBeansResponseModel;

    return jellyBeansResponseModel;
  }

  Future<JellyBeansResponseModel> loadJellyBeansByGroupName(
    int page,
    String groupName,
  ) async {
    final jellyBeansResponseModel = await service.loadJellyBeansByGroupName(
      page,
      groupName,
    );

    if (page != 0) {
      final items = _lastSearchJellyBeansResponseModel?.items ?? [];

      jellyBeansResponseModel.items.insertAll(0, items);
    }

    _lastSearchJellyBeansResponseModel = jellyBeansResponseModel;

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
