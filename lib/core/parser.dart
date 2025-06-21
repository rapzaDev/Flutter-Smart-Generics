typedef FromJson<T> = T Function(Map<String, dynamic>);

/// Parses a JSON map into an object of type [T] using the provided [converter] function.
///
/// This generic function takes a [Map<String, dynamic>] representing JSON data and a [FromJson<T>] converter,
/// which is a function responsible for transforming the JSON map into an instance of type [T].
///
/// ## Usage
/// Use this function when you want to decouple the parsing logic from specific model classes,
/// enabling reusable and scalable deserialization across your codebase. By passing different converter
/// functions, you can parse various types of objects without duplicating parsing logic.
///
///---------------------------------------------
/// ## Example
/// ```dart
/// class User {
///   final String name;
///   User({required this.name});
///   factory User.fromJson(Map<String, dynamic> json) => User(name: json['name']);
/// }
///
/// final userJson = {'name': 'Alice'};
/// final user = parseData<User>(userJson, User.fromJson);
/// print(user.name); // Alice
/// ```
///---------------------------------------------
///
/// ## Scalability
/// This approach promotes scalability by allowing you to add new model types and their respective
/// converters without modifying the parsing function itself. It adheres to the Open/Closed Principle,
/// making your codebase easier to maintain and extend as your application grows.
///
/// ## Clean Implementation
/// The function exemplifies clean code practices by:
/// - Keeping the parsing logic generic and reusable.
/// - Separating concerns between data parsing and model instantiation.
/// - Reducing code duplication and improving testability.
///
/// Prefer this pattern in projects where multiple data models require parsing from JSON,
/// and you want to maintain a clean, scalable, and maintainable codebase.

T parseData<T>(Map<String, dynamic> json, FromJson<T> converter) =>
    converter(json);
