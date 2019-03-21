class CommonUtil {
  static String formatDateStr(String date) {
    DateTime moonLanding = DateTime.parse(date);
    return '${moonLanding.year}-${moonLanding.month}-${moonLanding.day}';
  }

  static const meishi = ['全部', '面包甜点', '小吃快餐', '川湘菜', '日韩料理', '台湾菜'];
  static const hotel = ['全部', '青年旅社', '经济酒店', '豪华酒店', '主题酒店', '公寓型酒店'];
  static const aiwanle = [
    '全部',
    'KTV',
    '足疗按摩',
    '洗浴/汗蒸',
    '其他娱乐',
    '运动健身',
    '桌游/电玩'
  ];
}
