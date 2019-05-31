import 'dart:convert' show json;
import 'package:dio/dio.dart';
import 'package:cloudmusic/model/model.dart';

class CloudMusicApiHelper {
  static const String _apihost = 'https://music.aityp.com';

  static Future<void> login(String phone, String pwd) async {
    String params = '/login/cellphone?phone=$phone&password=$pwd';
    await httpGet(params);
  }

  static Future<BannerModel> getBanners() async {
    String param = "/banner";
    var str = await httpGet(param);
    return new BannerModel(str);
  }

  static Future<PersonalizedModel> getPersonalized(int limit) async {
    String param = '/personalized?limit=$limit';
    var str = await httpGet(param);
    return new PersonalizedModel(str);
  }

  static Future<NewAlbumModel> getNewAlbums(int limit, int offset) async {
    String param ='/top/album?offset=$offset&limit=$limit';
    var str = await httpGet(param);
    return NewAlbumModel(str);
  }
  static Future<MusicPlayList> playListDetial(int id) async {
     String param = '/playlist/detail?id=$id';
    var str = await httpGet(param);
    return MusicPlayList(str);
  }

  static Future<String> httpGet(String params) async {
    var dio = new Dio();
    var response = await dio.get(_apihost + params);
    var _content = json.encode(response.data);
    return _content;
  }
}