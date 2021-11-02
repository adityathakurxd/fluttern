import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttern/constants/secrets.dart';
import 'package:fluttern/models/post_model.dart';
import 'package:gsheets/gsheets.dart';

class PostProvider {
  Future<List<Post>> getAll() async {
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadsheetId);
    final sheet = await ss.worksheetByTitle('sheet');

    final products = await sheet!.values.map.allRows();
    return products!.map((json) => Post.fromGsheets(json)).toList();
  }
}

final postProvider = FutureProvider<List<Post>>((ref) async {
  return PostProvider().getAll();
});
