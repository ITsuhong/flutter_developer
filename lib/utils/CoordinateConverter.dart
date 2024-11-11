import 'dart:math';

class CoordinateConverter {
  static const double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
  static const double pi = 3.1415926535897932384626;

  // GCJ-02 to BD-09
  static List<double> gcj02ToBd09(double lat, double lon) {
    double z = sqrt(lon * lon + lat * lat) + 0.00002 * sin(lat * x_pi);
    double theta = atan2(lat, lon) + 0.000003 * cos(lon * x_pi);
    double bdLon = z * cos(theta) + 0.0065;
    double bdLat = z * sin(theta) + 0.006;
    return [bdLat, bdLon];
  }
}