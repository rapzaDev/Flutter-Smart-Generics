# Flutter Smart Generics 💡

A powerful, open-source Flutter package offering **ready-to-use generic functions**, **data utilities**, and **stateless helpers** to **accelerate development**, **reduce boilerplate**, and **boost app maintainability**.

---

## ✨ Why Smart Generics?

* ✅ Eliminate repetitive boilerplate (e.g. parsing, casting, list rendering)
* 🧠 Improve type safety with reusable patterns
* 🚀 Build apps faster with fewer lines of code
* 🧪 Easier testing with consistent logic structures
* 🌍 Open source and ready for community contribution

---

## 📦 Package Structure

```
lib/
├── core/
│   ├── parser.dart             # Generic JSON parsing
│   ├── list_builder.dart       # Type-safe list rendering widget
│   ├── type_utils.dart         # Safe casting helpers
│   ├── result.dart             # Result<T> pattern for success/failure
│   ├── comparator.dart         # Generic sorting helpers
│   └── debounce_throttle.dart  # Debouncer and Throttler utilities
example/
└── main.dart                   # Usage examples
```

---

## 🚀 Getting Started

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_smart_generics: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🔧 Features

### 1. 🔄 Generic JSON Parser

```dart
typedef FromJson<T> = T Function(Map<String, dynamic>);
T parseData<T>(Map<String, dynamic> json, FromJson<T> converter) => converter(json);
```

**Use:**

```dart
final user = parseData<User>(json, User.fromJson);
```

### 2. 🧱 Reusable List Widget (with builder)

```dart
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
```

**Use:**

```dart
buildList<User>(items: users, builder: (u) => ListTile(title: Text(u.name)));
```

### 3. 🧪 Safe Type Casting

```dart
T? tryCast<T>(dynamic value) => value is T ? value : null;
bool isNotNull<T>(T? value) => value != null;
```

**Use:**

```dart
final age = tryCast<int>(json['age']);
```

### 4. ✅ Functional Result Pattern

```dart
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
```

**Use:**

```dart
Future<Result<User>> fetchUser() async {
  try {
    final json = await api.get();
    return Result.success(parseData<User>(json, User.fromJson));
  } catch (e) {
    return Result.failure(e.toString());
  }
}
```

### 5. 📊 Generic Comparator

```dart
List<T> sortBy<T>(List<T> items, Comparable Function(T) keySelector, {bool descending = false}) {
  final sorted = [...items];
  sorted.sort((a, b) => descending
    ? keySelector(b).compareTo(keySelector(a))
    : keySelector(a).compareTo(keySelector(b)));
  return sorted;
}
```

**Use:**

```dart
final sorted = sortBy<User>(users, (u) => u.name);
```

### 6. ⏱️ Debouncer and Throttler

```dart
final debouncer = Debouncer<String>(Duration(milliseconds: 300));
debouncer.action = (searchTerm) async {
  final results = await fakeApiSearch(searchTerm);
  print('Results for "$searchTerm": $results');
};
```

```dart
final throttler = Throttler<String>(Duration(seconds: 1));
throttler.action = (value) => print('Clicked: $value');
```

---

## 📲 Example

Check [`example/main.dart`](example/main.dart) to see how to integrate the utilities into a working Flutter app.

---

## 🧪 Testing

Run all tests with:

```bash
flutter test
```

---

## 🤝 Contributing

Pull requests are welcome! Please write tests and follow [Conventional Commits](https://www.conventionalcommits.org/).

---

## 📜 License

MIT License © 2025 Rafael Arango Pérez — see [LICENSE](LICENSE).

---

Built with ❤️ to help Flutter devs ship faster and smarter.
