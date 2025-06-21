/// Attempts to cast the given [value] to type [T].
///
/// If [value] is of type [T], it is returned as [T]. Otherwise, returns `null`.
/// This is useful for safely casting dynamic values without throwing exceptions,
/// especially when working with data from dynamic sources such as JSON or external APIs.
///
/// Example:
/// ```dart
/// dynamic number = 42;
/// int? intValue = tryCast<int>(number); // intValue == 42
///
/// dynamic text = "hello";
/// int? notAnInt = tryCast<int>(text); // notAnInt == null
///
/// dynamic list = [1, 2, 3];
/// List<int>? intList = tryCast<List<int>>(list); // intList == [1, 2, 3]
/// ```
///
/// [T] The type to cast [value] to.
/// [value] The dynamic value to attempt to cast.
///
/// Returns the value as type [T] if the cast is valid, otherwise `null`.

T? tryCast<T>(dynamic value) => value is T ? value : null;

/// Checks whether the given value is not null.
///
/// This generic utility function returns `true` if the provided [value] is not `null`,
/// and `false` otherwise. It is useful for concise null checks in generic contexts,
/// especially when working with nullable types.
///
/// Type parameter:
/// - [T]: The type of the value to check. Can be any type, including custom classes.
///
/// Example:
/// ```dart
/// int? number = 5;
/// if (isNotNull(number)) {
///   print('The number is not null: $number');
/// } else {
///   print('The number is null');
/// }
///
/// String? text;
/// if (isNotNull(text)) {
///   print('The text is not null: $text');
/// } else {
///   print('The text is null');
/// }
/// ```
///
/// Output:
/// ```
/// The number is not null: 5
/// The text is null
/// ```
/// ----------------------------------------
///
/// This function is especially helpful in generic programming, where the type of the value
/// may not be known at compile time, but you still need to ensure it is not null before proceeding.

bool isNotNull<T>(T? value) => value != null;
