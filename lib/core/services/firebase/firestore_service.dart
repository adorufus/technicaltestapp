import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:technicaltest/core/models/abstracts/firestore_model_abstract.dart';

class FirestoreService extends GetxService {
  late FirebaseFirestore firestore;

  Future<FirestoreService> init() async {
    firestore = FirebaseFirestore.instance;
    return this;
  }

  CollectionReference<T> _getRef<T extends FirestoreModel>({
    required String collection,
    required T Function(
      DocumentSnapshot<Map<String, dynamic>>,
      SnapshotOptions?,
    )
    fromFirestore,
  }) {
    return firestore
        .collection(collection)
        .withConverter(
          fromFirestore: fromFirestore,
          toFirestore: (model, _) => model.toFirestore(),
        );
  }

  Future<void> addData<T extends FirestoreModel>(
    String collection,
    T data,
  ) async {
    await firestore.collection(collection).add(data.toFirestore());
  }

  Future<List<T>> getData<T extends FirestoreModel>({
    required String collection,
    required T Function(
      DocumentSnapshot<Map<String, dynamic>>,
      SnapshotOptions?,
    )
    fromFirestore,
  }) async {
    final ref = _getRef<T>(
      collection: collection,
      fromFirestore: fromFirestore,
    );
    final querySnapshot = await ref.get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateData<T extends FirestoreModel>({
    required String collection,
    required T data,
  }) async {
    await firestore
        .collection(collection)
        .doc(data.id)
        .update(data.toFirestore());
  }

  Stream<List<T>> streamData<T extends FirestoreModel>({
    required String collection,
    required T Function(
      DocumentSnapshot<Map<String, dynamic>>,
      SnapshotOptions?,
    )
    fromFirestore,
  }) {
    final ref = _getRef(collection: collection, fromFirestore: fromFirestore);
    return ref.snapshots().map(
      (querySnapshot) => querySnapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Future<void> deleteData(String collection, String docId) async {
    await firestore.collection(collection).doc(docId).delete();
  }
}
