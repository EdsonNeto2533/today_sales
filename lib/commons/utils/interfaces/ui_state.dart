abstract class UIState<T> {}

class Success<T> implements UIState<T> {
  T value;
  Success(this.value);
}

class Failure<T> implements UIState<T> {
  String errorMessage;
  Failure(this.errorMessage);
}

class Loading<T> implements UIState<T> {}
