import 'package:dio/dio.dart';

class TodoRemoteDataSource<T> with ShiftWrapper<T> {}

mixin ShiftWrapper<T> {
  late Dio _dio = Dio();

  Future<T> getData(T Function(Map<String, dynamic> data) json) async {
    final res = await _dio.get("https://jsonplaceholder.typicode.com/todos/1");
    return json(res.data);
  }

  Future<Response> setData(Map<String, dynamic> data) async {
    return _dio.post(
      "https://jsonplaceholder.typicode.com/todos/1",
      data: data,
    );
  }

  Future<Response> updateData(Map<String, dynamic> data) async {
    return _dio.put(
      "https://jsonplaceholder.typicode.com/todos/1",
      data: data,
    );
  }

  Future<Response> patchData(Map<String, dynamic> data) async {
    return _dio.patch(
      "https://jsonplaceholder.typicode.com/todos/1",
      data: data,
    );
  }

  void setDio(Dio dio) {
    _dio = dio;
  }
}


class TodoRemote {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoRemote({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory TodoRemote.fromMap(Map<String, dynamic> json) => TodoRemote(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
