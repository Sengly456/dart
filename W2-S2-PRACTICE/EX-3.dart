class MyDuration {
  final int _totalMilliseconds; // Renamed from _milliseconds

  MyDuration({required int totalMilliseconds})
      : _totalMilliseconds = totalMilliseconds;
  
  int get totalMilliseconds => _totalMilliseconds; // Renamed from milliseconds

  MyDuration.fromHours(int hours)
      : this(totalMilliseconds: hours * 60 * 60 * 1000);
  
  MyDuration.fromMinutes(int minutes)
      : this(totalMilliseconds: minutes * 60 * 1000);
  
  MyDuration.fromSeconds(int seconds)
      : this(totalMilliseconds: seconds * 1000);

  MyDuration operator +(MyDuration other) {
    return MyDuration(
        totalMilliseconds: totalMilliseconds + other.totalMilliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = totalMilliseconds - other.totalMilliseconds;
    return result < 0
        ? throw ArgumentError("The result can't be negative")
        : MyDuration(totalMilliseconds: result);
  }

  bool operator >(MyDuration other) {
    return this.totalMilliseconds > other.totalMilliseconds;
  }

  @override
  String toString() {
    int totalSeconds = (_totalMilliseconds / 1000).round(); // Renamed from seconds
    int totalMinutes = (totalSeconds / 60).floor(); // Renamed from minutes
    totalSeconds = totalSeconds % 60;
    int totalHours = (totalMinutes / 60).floor(); // Renamed from hours
    totalMinutes = totalMinutes % 60;
    return '$totalHours hours, $totalMinutes minutes, $totalSeconds seconds';
  }
}

void main() {
  MyDuration dur1 = MyDuration.fromHours(30);
  MyDuration dur2 = MyDuration.fromMinutes(90);
  print(dur1 - dur2);
}
