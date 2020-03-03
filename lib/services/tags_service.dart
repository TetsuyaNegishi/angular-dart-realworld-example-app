import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class TagsService {
  static final _url = 'https://conduit.productionready.io/api/tags';

  final Client _http;

  TagsService(this._http);

  Future<List<String>> getAll() async {
    try {
      final response = await _http.get(_url);

      final tags = (_extractTags(response) as List).cast<String>();
      return tags;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractTags(Response resp) => json.decode(resp.body)['tags'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}
