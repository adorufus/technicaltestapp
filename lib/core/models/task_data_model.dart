import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:technicaltest/core/models/abstracts/firestore_model_abstract.dart';

enum TaskStatus {
  pending,
  done,
  onprogress,
}

extension TaskStatusExtension on TaskStatus {
  String get label {
    switch (this) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.onprogress:
        return 'On Progress';
    }
  }

  static TaskStatus fromString(dynamic value) {
    if (value == null) return TaskStatus.pending; // Default fallback
    switch (value.toString().toLowerCase()) {
      case 'pending':
        return TaskStatus.pending;
      case 'done':
        return TaskStatus.done;
      case 'on progress':
      case 'onprogress':
        return TaskStatus.onprogress;
      default:
        return TaskStatus.pending; // Fallback instead of crashing your app
    }
  }
}

// Implements FirestoreModel to fit your generic repository structure
class TaskModel implements FirestoreModel {
  @override
  final String id;
  final String title;
  final String notes;
  final TaskStatus status;

  TaskModel({
    required this.id,
    required this.title,
    required this.notes,
    required this.status,
  });

  // Updated factory signature to match Firestore withConverter
  factory TaskModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return TaskModel(
      id: snapshot.id, // Extracts the document ID from Firestore
      title: data?['title'] as String? ?? '',
      notes: data?['notes'] as String? ?? '',
      status: TaskStatusExtension.fromString(data?['status']),
    );
  }

  // Map representation intended strictly for Firestore updates
  @override
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'notes': notes,
      'status': status.label,
    };
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? notes,
    TaskStatus? status,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      notes: notes ?? this.notes,
      status: status ?? this.status,
    );
  }
}
