import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  // get collection of orders.
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // Save order info
  Future<void> saveOrderToDatabase(String reciept) async {
    await orders.add({'date': DateTime.now(), 'order': reciept});
  }
}
