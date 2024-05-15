class School {
  String title;
  String name;
  String way;
  String system;
  String distance;
  String url;
  String code;
  String? enroll; //招生
  String? unifiedRecruit; //统招
  String? average; //平均分
  String? dispens; //调剂
  School(
      {required this.title,
      required this.name,
      required this.way,
      required this.system,
      required this.distance,
      required this.url,
        required this.code,
      this.average,
      this.enroll,
      this.dispens,
      this.unifiedRecruit});
}
