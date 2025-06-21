import 'dart:async';

/// A utility class to debounce function calls.
///
/// It delays the execution of a function until a specified duration
/// has passed since the last call. This ensures that only the final
/// call in a rapid sequence is executed.
///
/// Commonly used in text input fields or live search scenarios,
/// where you want to wait until the user has stopped typing before
/// performing an action (like firing an API request).
///
/// ---
///
/// ### Example:
/// ```dart
/// final debouncer = Debouncer<String>(Duration(milliseconds: 300));
///
/// debouncer.action = (searchTerm) async {
///   // Simulates an API call delay
///   final results = await fakeApiSearch(searchTerm);
///   print('Results for "$searchTerm": $results');
/// };
///
/// // Mock API function that returns results after 1 second
/// Future<List<String>> fakeApiSearch(String query) async {
///   await Future.delayed(const Duration(seconds: 1));
///   return List.generate(3, (index) => '$query result $index');
/// }
///
/// // Simulated rapid calls (user typing)
/// debouncer.call('Fl');
/// debouncer.call('Flu');
/// debouncer.call('Flutt');
/// debouncer.call('Flutter'); // Only this will trigger after delay
/// ```
///
/// ---
///
/// ### Notes:
/// - Only the **last call** will be executed after the delay.
/// - If a new call is made before the delay ends, the timer resets.
/// - Useful for optimizing performance and avoiding unnecessary processing.

class Debouncer<T> {
  final Duration delay;
  void Function(T value)? action;
  Timer? _timer;

  Debouncer(this.delay);

  void call(T value) {
    _timer?.cancel();

    _timer = Timer(delay, () => action?.call(value));
  }
}

/// A utility class to throttle function calls.
///
/// It ensures a function is called **at most once** in a defined interval,
/// ignoring any additional calls made during that time window.
///
/// Ideal for scenarios where you want to prevent rapid repeated execution,
/// such as double-tapping buttons or sending multiple form submissions.
///
/// ---
///
/// ### Example:
/// ```dart
/// final throttler = Throttler<String>(Duration(seconds: 1));
/// throttler.action = (value) => print('Clicked: $value');
///
/// throttler.call('Button 1'); // Executes
/// throttler.call('Button 2'); // Ignored (within 1s)
/// ```
///
/// ---
///
/// ### Notes:
/// - Only the **first call** is executed within the interval.
/// - All subsequent calls are ignored until the interval resets.
/// - Great for preventing accidental repeated user actions.

class Throttler<T> {
  final Duration interval;
  void Function(T value)? action;
  bool _ready = true;

  Throttler(this.interval);

  void call(T value) {
    if (_ready) {
      _ready = false;

      action?.call(value);

      Timer(interval, () => _ready = true);
    }
  }
}
