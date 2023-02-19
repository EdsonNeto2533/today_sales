abstract class UIState<T> {}

class SuccessUIState<T> implements UIState<T> {
  T value;
  SuccessUIState(this.value);
}

class FailureUIstate<T> implements UIState<T> {
  String errorMessage;
  FailureUIstate(this.errorMessage);
}

class LoadingUIState<T> implements UIState<T> {}
