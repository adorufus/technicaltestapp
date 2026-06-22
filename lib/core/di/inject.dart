import 'package:get/get.dart';
import 'package:technicaltest/core/services/firebase/firestore_service.dart';

Future<void> initService() async {
  await Get.putAsync(() => FirestoreService().init());
}