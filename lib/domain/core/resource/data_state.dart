import 'package:classroom/domain/core/resource/data_exception.dart';

abstract class DataState<T> {
  final T? data;
  final DataError? dataError;

  const DataState({this.data, this.dataError});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DataError error) : super(dataError: error);
}
