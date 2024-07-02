import 'package:blowe_bloc/blowe_bloc.dart';

class JellyBeanModel extends BloweSerializableItem {
  JellyBeanModel({
    required this.beanId,
    required this.groupName,
    required this.ingredients,
    required this.flavorName,
    required this.description,
    required this.colorGroup,
    required this.backgroundColor,
    required this.imageUrl,
    required this.glutenFree,
    required this.sugarFree,
    required this.seasonal,
    required this.kosher,
  });

  factory JellyBeanModel.fromJson(Map<String, dynamic> json) => JellyBeanModel(
        beanId: json['beanId'] as int,
        groupName: (json['groupName'] as List<dynamic>?)
                ?.map((item) => item as String)
                .toList() ??
            [],
        ingredients: (json['ingredients'] as List<dynamic>?)
                ?.map((item) => item as String)
                .toList() ??
            [],
        flavorName: json['flavorName'] as String,
        description: json['description'] as String,
        colorGroup: json['colorGroup'] as String,
        backgroundColor: json['backgroundColor'] as String,
        imageUrl: json['imageUrl'] as String,
        glutenFree: json['glutenFree'] as bool,
        sugarFree: json['sugarFree'] as bool,
        seasonal: json['seasonal'] as bool,
        kosher: json['kosher'] as bool,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'beanId': beanId,
      'groupName': groupName,
      'ingredients': ingredients,
      'flavorName': flavorName,
      'description': description,
      'colorGroup': colorGroup,
      'backgroundColor': backgroundColor,
      'imageUrl': imageUrl,
      'glutenFree': glutenFree,
      'sugarFree': sugarFree,
      'seasonal': seasonal,
      'kosher': kosher,
    };
  }

  final int beanId;
  final List<String> groupName;
  final List<String> ingredients;
  final String flavorName;
  final String description;
  final String colorGroup;
  final String backgroundColor;
  final String imageUrl;
  final bool glutenFree;
  final bool sugarFree;
  final bool seasonal;
  final bool kosher;

  @override
  List<Object> get props => [beanId];
}
