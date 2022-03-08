import 'package:front_developer_test/models/feed_response.dart';
import 'package:front_developer_test/models/post.dart';
import 'package:front_developer_test/services/feed_service.dart';

///class stores and manages all data about the posts.
///It makes a get request to the Feed Service.
///Modifies and organises the data accordingly.
///Then notifies the Feed Provider that the data has been received.

class FeedRepository {
  final FeedService _feedService = FeedService();
  List<Post> _feed = []; //where posts are stored.

  int get numberOfPosts => _feed.length;

  Future<FeedResponse> getFeedResponse() async {
    List<dynamic>? jsonList = await _feedService.getFeedJson();
    if (jsonList != null) {
      final List<Post> newFeed = [];
      for (var json in jsonList) {
        newFeed.add(
          Post.fromJson(json: json),
        );
        _feed = newFeed;
      }
      return FeedResponse.success();
    }
    return FeedResponse.error();
  }

  ///like and unlike post are separated as a specific post request may need to be made to the feed service.
  void likePost({required int index}) {
    _feed[index].isLiked = true;
  }

  void unlikePost({required int index}) {
    _feed[index].isLiked = false;
  }

  ///save and unsave post are separated as a specific post request may need to be made to the feed service.
  void savePost({required int index}) {
    _feed[index].saved = true;
  }

  void unSavePost({required int index}) {
    _feed[index].saved = false;
  }

  ///uses an index to get specific post.
  Post getPost({required int index}) {
    return _feed[index];
  }
}