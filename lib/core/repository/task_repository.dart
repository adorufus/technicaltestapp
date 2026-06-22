import 'package:technicaltest/core/models/task_data_model.dart';
import 'package:technicaltest/core/services/firebase/firestore_service.dart';

class TaskRepository {
  final FirestoreService _firestoreService;

  TaskRepository({required this._firestoreService});

  final String _collection = "tasks";

  Future<List<TaskModel>> getTasks() async {
    return await _firestoreService.getData<TaskModel>(collection: _collection, fromFirestore: TaskModel.fromFirestore);
  }

  Future<void> addTask(TaskModel task) async {
    return await _firestoreService.addData<TaskModel>(_collection, task);
  }

  Stream<List<TaskModel>> streamTasks() {
    return _firestoreService.streamData<TaskModel>(collection: _collection, fromFirestore: TaskModel.fromFirestore);
  }
  
  Future<void> updateTask(TaskModel task) async {
    return await _firestoreService.updateData(collection: _collection, data: task);
  }

  Future<void> deleteTask(taskId) async {
    return await _firestoreService.deleteData(_collection, taskId);
  }
}