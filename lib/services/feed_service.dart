import 'dart:convert';
import 'package:feed_tab_spotlas/services/status_codes.dart';
import 'package:http/http.dart' as http;

///Feed service that contains functions to make API calls to database
///to do different requests such as get and post.
///This class returns the data to the Feed Repository for data manipulation.

class FeedService {
  static final FeedService _instance = FeedService._();

  FeedService._();

  factory FeedService() {
    return _instance;
  }
  ///makes a request to get feed data, it can return a json object or a null object.
  ///It is possible to return responses for each specific response status code.
  ///But client only needs to know whether the response has been successful or failed.

  Future<dynamic> getFeedJson({required int page}) async {
    final String _url =
        "http://161.35.162.216:1210/interview/home/reel?lat=51.5&lon=-0.17&page=$page";
    final http.Response response = await http.get(Uri.parse(_url));
    final int statusCode = response.statusCode;
    if (statusCode == StatusCodes.success) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
