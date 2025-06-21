/// Sorts a list of items based on a specified key selector function.
///
/// This function returns a new sorted list without modifying the original list.
/// The sorting is performed using the provided [keySelector] function, which
/// extracts a [Comparable] key from each item. You can specify whether the
/// sorting should be in ascending (default) or descending order by setting
/// the [descending] parameter.
///
/// This utility is generic and can be used with any type [T], as long as the
/// [keySelector] returns a [Comparable] value. It is efficient for small to
/// medium-sized lists, as it leverages Dart's optimized `List.sort()` method,
/// which has an average time complexity of O(n log n).
///
/// ------
///
/// ### Example
/// ```dart
/// class User {
///   final String name;
///   final int age;
///   User(this.name, this.age);
/// }
///
/// final users = [
///   User('Alice', 30),
///   User('Bob', 25),
///   User('Charlie', 35),
/// ];
///
/// // Sort users by age in ascending order
/// final sortedByAge = sortBy(users, (user) => user.age);
///
/// // Sort users by name in descending order
/// final sortedByNameDesc = sortBy(users, (user) => user.name, descending: true);
/// ```
///
///------
///
/// ### Performance Tips
/// - For large lists, avoid calling [keySelector] with expensive computations.
///   If the key extraction is costly, consider precomputing the keys and
///   sorting a list of tuples or indices.
/// - This function creates a shallow copy of the input list to avoid mutating
///   the original data. If memory usage is a concern, you may want to sort
///   the list in place using `List.sort()` directly.

List<T> sortBy<T>(
  List<T> items,
  Comparable Function(T) keySelector, {
  bool descending = false,
}) {
  final sorted = [...items];

  sorted.sort((a, b) => descending
      ? keySelector(b).compareTo(keySelector(a))
      : keySelector(a).compareTo(keySelector(b)));

  return sorted;
}
