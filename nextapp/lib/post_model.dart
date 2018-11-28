import 'dart:async';
import 'dart:convert';

import 'dart:io';

class Post {
  // uid: 작성자의 고유 아이디(익명아이디:해시값)
  // author: 작성자 이름
  // title: 글 제목
  // body: 글 내용
  // --------------------
  // likeCount: 좋아요 갯수
  // likes: Map<String, Boolean> 누가 좋아요 했는지 기록
  final String uid;
  final String author;
  final String title;
  final String body;
  String imageUrl;
  int likeCount = 0;

  Post(this.uid, this.author, this.title, this.body);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }
    // Get an Image
    HttpClient http = new HttpClient();
    try {
      var uri = new Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      var decoded = json.decode(responseBody);
      var url = decoded['message'];
      imageUrl = url;
    } catch (exception) {
      print(exception);
    }
  }
}
