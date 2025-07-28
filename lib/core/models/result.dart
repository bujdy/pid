abstract class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;

  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String? message;
  final int? statusCode;

  const Failure({this.message, this.statusCode});
}

extension ResultX<T> on Result<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String? message) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      final fail = this as Failure<T>;
      return failure(fail.message);
    } else {
      throw Exception('Unhandled Result type');
    }
  }
}
