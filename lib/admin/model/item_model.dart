import 'package:firebase_storage/firebase_storage.dart';

class ItemModel{
  final Reference ref;
  String name;
  String? registeredTime;
  String? uploadedTime;
  String url;
  int? group;
  int? id;

  ItemModel(
      {required this.ref,
      required this.name,
      this.registeredTime,
      this.uploadedTime,
      required this.url,
      this.group,
      this.id});
}