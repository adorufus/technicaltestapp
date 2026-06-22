

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreService extends GetxService {
  late FirebaseFirestore firestore;

  Future<FirestoreService> init() async {
    firestore = FirebaseFirestore.instance;
    return this;
  }

  Future<void> addData(String collection, Map<String, dynamic> data) async {
    await firestore.collection(collection).add(data);
  }

  Future<QuerySnapshot> getData(String collection) async {
    return await firestore.collection(collection).get();
  }

  Future<void> updateData(String collection, String docId, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(docId).update(data);
  }

  Stream<QuerySnapshot> streamData(String collection) {
    return firestore.collection(collection).snapshots();
  }

}