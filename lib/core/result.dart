/// A sealed class representing the result of an operation, which can be either a [Success] or a [Failure].
///
/// The [Result] class is a generic abstraction for handling operations that can succeed or fail,
/// providing a unified way to represent both outcomes. This pattern is commonly used to avoid
/// throwing exceptions and to make error handling explicit and type-safe.
///
/// ## Usage
///
/// You can create a [Result] using the provided factory constructors:
///
/// - `Result.success(data)` for a successful result.
/// - `Result.failure(message)` for a failed result.
///
/// ## Example
///
/// ```dart
/// Result<int> divide(int a, int b) {
///   if (b == 0) {
///     return Result.failure('Division by zero');
///   } else {
///     return Result.success(a ~/ b);
///   }
/// }
///
/// void main() {
///   final result = divide(10, 2);
///   if (result is Success<int>) {
///     print('Result: ${result.data}');
///   } else if (result is Failure<int>) {
///     print('Error: ${result.message}');
///   }
/// }
/// ```
///
/// ## Subclasses
///
/// - [Success] represents a successful result and contains the resulting data.
/// - [Failure] represents a failed result and contains an error message.
///
/// ## Type Parameters
///
/// - `T`: The type of the data returned in case of success.
///
/// ## Best Practices
///
/// - Use [Result] to make error handling explicit in your APIs.
/// - Always check the runtime type of [Result] (using `is Success` or `is Failure`) before accessing its properties.
/// - Avoid using exceptions for expected error cases; prefer [Result] for predictable control flow.
///
/// ## See Also
///
/// - [Success]
/// - [Failure]

sealed class Result<T> {
  const Result();
  factory Result.success(T data) = Success;
  factory Result.failure(String message) = Failure;
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  const Failure(this.message);
}
