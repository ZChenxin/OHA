/// Controller for a [BaseView]
abstract class BasePresenter {
  void loadInitialQueries();
}

/// Displays data from a [BasePresenter] to the user through the UI
abstract class BaseView<T> {
  void setPresenter(T presenter);
}