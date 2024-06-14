import 'package:flugram/app/services/jelly_bean/models/jelly_bean_model.dart';
import 'package:flugram/blowe_bloc/blowe_bloc.dart';

class JellyBeansResponseModel extends BlowePaginationModel<JellyBeanModel> {
  const JellyBeansResponseModel({
    required super.totalCount,
    required super.items,
  });

  factory JellyBeansResponseModel.fromJson(Map<String, dynamic> json) {
    return JellyBeansResponseModel(
      totalCount: json['totalCount'] as int,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                (item) => JellyBeanModel.fromJson(
                  item as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );
  }
}
