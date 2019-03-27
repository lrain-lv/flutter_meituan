import 'http_manager.dart';
import 'package:dio/dio.dart';

class GankApiService {
  static const String API_GANK_HOST = "http://gank.io";

  static const String API_GANK_CATEGORIES = "$API_GANK_HOST/api/data/";

  static getCategoryData(String category, int page, {count = 20}) async {
    String url = "/api/data/$category/$count/$page";

    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static getBannerData() async {
    String url =
        "https://admobile.meituan.com/api/v3/adverts?smId=&new=0&MAC=20%3AA6%3A80%3ADF%3A49%3A02&devid=866693026442025&cityid=1&clienttp=android&app=group&AndroidID=6debce985c92588b&IMEI=866693026442025&useJungleCate=0&topic_session_id=a4b50901-0cb8-49cc-8b4b-ddd605a53d47&apptype=0&category=9999&version=8.8.2&movieid=&uid=-1&latlng=39.984362%2C116.308474&partner=0&utm_source=qq&utm_medium=android&utm_term=582&version_name=8.8.2&utm_content=866693026442025&utm_campaign=AgroupBgroupC0E0&ci=1&msid=8666930264420251515043305914&uuid=5789D239EBA0CFE0E73C1E8C5CC98E31DD64E799B1570EC6AEE02B33FB53D888&lat=39.984362&lng=116.308474&userid=-1&__reqTraceID=a9f48cb5-ef51-4496-9891-7e3636c8e9af&__skck=6a375bce8c66a0dc293860dfa83833ef&__skts=1515043744080&__skua=bcc93f8e24fdc05ba9535f5701eee027&__skno=f4647ea4-a301-4664-8422-fc30f90c65c0&__skcy=jtxwM26S7w%2FTJArtDii4fNgQ6iI%3D";

    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static getRecommendData({String offset = "0"}) async {
    String url =
        "http://api.meituan.com/group/v1/poi/select/cate/1?cityId=1&sort=smart&coupon=all&mpt_cate1=20&mpt_cate2=79&offset=" +
            offset +
            "&limit=15";
    print(url);
    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static getNearbyRecommentData(String cate, {String offset = "0"}) async {
    String url = "http://api.meituan.com/group/v1/poi/select/cate/" +
        cate +
        "?cityId=1&sort=smart&coupon=all&mpt_cate1=20&mpt_cate2=79&offset=" +
        offset +
        "&limit=20";
    print(url);
    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static getNewsData(
      {String title = "%E6%8E%A8%E8%8D%90", int pageNum = 1}) async {
    String str;
    switch (title) {
      case "推荐":
        str = "%E6%8E%A8%E8%8D%90";
        break;
      case "热点":
        str = "%E7%83%AD%E7%82%B9";
        break;
      case "评测":
        str = "%E8%AF%84%E6%B5%8B";
        break;
      case "攻略":
        str = "%E6%94%BB%E7%95%A5";
        break;
    }
    String url =
        "http://headline.leishenyouxi.com/rest/data/android/articles?deviceType=Anroid&artLens=20&specifyStr=" +
            str +
            "&pageNum=" +
            pageNum.toString();

    print(url);
    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static getMealDetail(String poiid) async {
    String url = 'http://api.meituan.com/meishi/poi/v1/poi/deallist/' +
        poiid +
        '?poiid=' +
        poiid +
        '&ci=1&__vhost=api.meishi.meituan.com';
    print(url);
    var result = await HttpManager.instance.getRequest(url);

    return result;
  }

  static nearByRecomment(String poiid) async {
    String url =
        'http://api.meituan.com/group/v1/recommend/nearstoredeals/poi/' + poiid;
    print(url);
    var result = await HttpManager.instance.getRequest(url);

    return result;
  }
}
