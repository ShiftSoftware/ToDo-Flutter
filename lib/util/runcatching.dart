
typedef OnSuccess<T> = void Function(T result);
typedef CallBack<T> = Future<T> Function();
typedef OnError = void Function(Exception error);

Future<void> runCatching<T>(
    {required CallBack<T> callback,
    required OnSuccess success,
    OnError? error}) async {
  try {
    final res = callback();
    success(res);
  } on Exception catch (e) {
    if (error != null) error(e);
  }
}
