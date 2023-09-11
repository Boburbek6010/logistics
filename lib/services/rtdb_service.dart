import 'package:firebase_database/firebase_database.dart';
import 'package:logistics_company/admin/model/interview_user.dart';

class RTDBService {
  static final database = FirebaseDatabase.instance.ref();

  static Future<Stream<DatabaseEvent>> storePost(InterviewUser user) async {
    database.push().set(user);
    // String? key = database.child("user").push().key;
    // user.postKey = key!;
    // await database.child("user").child(user.postKey).set(user.toJson());
    return database.onChildAdded;
  }

  static Future<Iterable<DataSnapshot>> loadPosts() async {
    List<InterviewUser> items = [];
    Query query = database.child("user");
    DatabaseEvent databaseEvent = await query.once();
    var result = databaseEvent.snapshot.children;
    return result;
  }


  static Future<void> deletePost(String postKey) async {
    await database.child("user").child(postKey).remove();
  }

  // static Future<Stream<DatabaseEvent>> updatePost(InterviewUser post) async {
  //   await database.child("user").child(post.postKey).set(post.toJson());
  //   return database.onChildAdded;
  // }
}