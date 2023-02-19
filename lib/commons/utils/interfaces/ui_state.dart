abstract class UIState<T> {}

class Success<T> extends UIState<T> {
  T value;
  Success(this.value);
}

class Failure<T> extends UIState<T> {
  String errorMessage;
  Failure(this.errorMessage);
}

class Loading<T> extends UIState<T> {}
