import 'package:flutter/widgets.dart';

/// Builds a customizable [ListView] for any type of item, enabling scalable and reusable list rendering.
///
/// This generic function simplifies the creation of scrollable lists by accepting a list of items of type [T]
/// and a builder function that defines how each item should be displayed as a [Widget].
///
/// The function supports customization of scroll direction, shrink wrapping, and scroll physics,
/// making it suitable for a wide range of use cases, from simple vertical lists to complex nested or horizontal lists.
///
/// ### Parameters:
/// - [items]: The list of data items to display. Each item will be passed to the [builder] function.
/// - [builder]: A function that takes an item of type [T] and returns a [Widget] representing that item.
/// - [scrollDirection]: The axis along which the list scrolls. Defaults to [Axis.vertical].
/// - [shrinkWrap]: Whether the extent of the scroll view in the scrollDirection should be determined by the contents being viewed. Defaults to `false`.
/// - [physics]: Optional scroll physics for customizing the scroll behavior.
///
/// ### Usage:
/// Use this function to avoid repetitive boilerplate when building lists of different data types in your app.
/// It promotes clean, scalable, and maintainable code by abstracting the list-building logic into a single reusable function.
///
/// ```dart
/// buildList<String>(
///   items: ['Apple', 'Banana', 'Cherry'],
///   builder: (item) => ListTile(title: Text(item)),
/// )
/// ```
///
/// This approach is especially useful in large codebases or when building generic UI components,
/// as it encourages code reuse and separation of concerns.

Widget buildList<T>({
  required List<T> items,
  required Widget Function(T item) builder,
  Axis scrollDirection = Axis.vertical,
  bool shrinkWrap = false,
  ScrollPhysics? physics,
}) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) => builder(items[index]),
    scrollDirection: scrollDirection,
    shrinkWrap: shrinkWrap,
    physics: physics,
  );
}
