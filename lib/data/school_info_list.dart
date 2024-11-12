class SchoolListInfo {
  static List<String> schoolSHList = [
    'assets/school/SH/1.png',
    'assets/school/SH/2.png',
    'assets/school/SH/3.png',
    'assets/school/SH/4.png',
    'assets/school/SH/5.png',
    'assets/school/SH/6.png',
    'assets/school/SH/7.png',
    'assets/school/SH/8.png',
    'assets/school/SH/9.png',
    'assets/school/SH/10.png',
    'assets/school/SH/11.png',
    'assets/school/SH/12.png',
    'assets/school/SH/13.png',
    'assets/school/SH/14.png',
  ];
  static List<String> schoolDCGList = [
    'assets/school/DCG/1.png',
    'assets/school/DCG/2.png',
    'assets/school/DCG/3.png',
    'assets/school/DCG/4.png',
    'assets/school/DCG/5.png',
    'assets/school/DCG/6.png',
    'assets/school/DCG/7.png',
    'assets/school/DCG/8.png',
    'assets/school/DCG/9.png',
    'assets/school/DCG/10.png',
    'assets/school/DCG/11.png',
    'assets/school/DCG/12.png',
    'assets/school/DCG/13.png',
    'assets/school/DCG/14.png',
    'assets/school/DCG/15.png',
  ];
  static List<String> schoolHMList = [
    'assets/school/HM/1.png',
    'assets/school/HM/2.png',
    'assets/school/HM/3.png',
    'assets/school/HM/4.png',
    'assets/school/HM/5.png',
    'assets/school/HM/6.png',
    'assets/school/HM/7.png',
  ];
  static List<String> schoolPTSList = [
    'assets/school/PTS/1.png',
    'assets/school/PTS/2.png',
    'assets/school/PTS/3.png',
    'assets/school/PTS/4.png',
    'assets/school/PTS/5.png',
    'assets/school/PTS/6.png',
    'assets/school/PTS/7.png',
    'assets/school/PTS/8.png',
    'assets/school/PTS/9.png',
    'assets/school/PTS/10.png',
    'assets/school/PTS/11.png',
    'assets/school/PTS/12.png',
    'assets/school/PTS/13.png',
  ];
  static List<String> schoolCHList = [
    'assets/school/CH/1.png',
    'assets/school/CH/2.png',
    'assets/school/CH/3.png',
    'assets/school/CH/4.png',
    'assets/school/CH/5.png',
    'assets/school/CH/6.png',
    'assets/school/CH/7.png',
  ];
  static List<String> schoolSCList = [
    'assets/school/SC/1.png',
    'assets/school/SC/2.png',
    'assets/school/SC/3.png',
    'assets/school/SC/4.png',
    'assets/school/SC/5.png',
    'assets/school/SC/6.png',
    'assets/school/SC/7.png',
    'assets/school/SC/8.png',
    'assets/school/SC/9.png',
    'assets/school/SC/10.png',
    'assets/school/SC/11.png',
    'assets/school/SC/12.png',
  ];
  static List<String> schoolSXList = [
    'assets/school/SX/1.png',
    'assets/school/SX/2.png',
    'assets/school/SX/3.png',
    'assets/school/SX/4.png',
    'assets/school/SX/5.png',
    'assets/school/SX/6.png',
    'assets/school/SX/7.png',
    'assets/school/SX/8.png',
    'assets/school/SX/9.png',
    'assets/school/SX/10.png',
  ];
  static List<String> schoolSYList = [
    'assets/school/SY/1.png',
    'assets/school/SY/2.png',
    'assets/school/SY/3.png',
    'assets/school/SY/4.png',
    'assets/school/SY/5.png',
    'assets/school/SY/6.png',
    'assets/school/SY/7.png',
    'assets/school/SY/8.png',
    'assets/school/SY/9.png',
    'assets/school/SY/10.png',
    'assets/school/SY/11.png',
    'assets/school/SY/12.png',
    'assets/school/SY/13.png',
    'assets/school/SY/14.png',
    'assets/school/SY/15.png',
    'assets/school/SY/16.png',
    'assets/school/SY/17.png',
  ];
  static List<String> QYList = [
    'assets/school/QY/1.png',
    'assets/school/QY/2.png',
    'assets/school/QY/3.png',
  ];

  getList(String name) {
    Map<String, List> schoolMap = {
      '成都市石室联合中学蜀华分校': schoolSHList,
      '成都市东城根街小学': schoolDCGList,
      '成都市回民小学': schoolHMList,
      '成都市泡桐树小学': schoolPTSList,
      '成都市彩虹小学': schoolCHList,
      '成都市少城小学': schoolSCList,
      '成都市胜西小学': schoolSXList,
      '成都市实验小学': schoolSYList,
      "青羊二区": QYList,
    };
    return schoolMap[name];
  }
}
