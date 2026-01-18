import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getEskuls() {
    return _db.collection('eskuls').snapshots();
  }

  Future<void> joinEskul(String eskulId, String eskulName, String? schedule) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _db
          .collection('users')
          .doc(user.uid)
          .collection('my_eskuls')
          .doc(eskulId)
          .set({
        'name': eskulName,
        'schedule': schedule ?? '-',
        'joinedAt': DateTime.now(),
      });
    }
  }

  Future<void> leaveEskul(String eskulId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _db
          .collection('users')
          .doc(user.uid)
          .collection('my_eskuls')
          .doc(eskulId)
          .delete();
    }
  }

  Future<bool> isJoined(String eskulId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    var doc = await _db
        .collection('users')
        .doc(user.uid)
        .collection('my_eskuls')
        .doc(eskulId)
        .get();

    return doc.exists;
  }
}
