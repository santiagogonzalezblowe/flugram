abstract class BlowePaginationModel<T> {
  const BlowePaginationModel({
    required this.items,
    required this.totalCount,
  });

  final List<T> items;
  final int totalCount;
}
