import 'item.dart';

class PlayerInventory {
  final List<Item> items;
  const PlayerInventory({this.items = const [],});

  PlayerInventory copyWith({
    List<Item>? items,
  }) {
    return PlayerInventory(
      items: items ?? this.items,
    );
  }

  PlayerInventory addItem(Item item) => copyWith(items: List.unmodifiable(items.toList()..add(item)));

  @override
  String toString() => items.toString();

}