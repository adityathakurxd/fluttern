import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttern/constants/secrets.dart';
import 'package:fluttern/models/member_model.dart';
import 'package:gsheets/gsheets.dart';

class MemberProvider {
  Future<List<Member>> getAll() async {
    final gsheets = GSheets(credentials);
    final ss = await gsheets.spreadsheet(spreadsheetId);
    final sheet = await ss.worksheetByTitle('member');

    final products = await sheet!.values.map.allRows();
    return products!.map((json) => Member.fromGsheets(json)).toList();
  }
}

final memberProvider = FutureProvider<List<Member>>((ref) async {
  return MemberProvider().getAll();
});
