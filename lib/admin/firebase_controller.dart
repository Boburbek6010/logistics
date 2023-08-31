import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;
import 'model/item_model.dart';

class FirebaseApi {
  static List<Future<String>> _getDownloadLinks(List<Reference> ref) =>
      ref.map((ref) => ref.getDownloadURL()).toList();

  static Future<List<ItemModel>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = _getDownloadLinks(result.items);
    return urls.asMap().map((index, url) {
      final ref = result.items[index];
      final name = ref.name;
      final file = ItemModel(
        ref: ref,
        name: name,
        url: url.toString(),
      );
      return MapEntry(index, file);
    }).values.toList();
  }

  static Future<void> download(Reference ref) async {
    final url = await ref.getDownloadURL();

    final anchor = html.AnchorElement(href: url)
      // ..target = 'blank'
      ..download = ref.name;
    anchor.click();
  }
}
