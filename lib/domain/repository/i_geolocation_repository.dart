import 'package:geolocator/geolocator.dart';

abstract class IGeoLocationRepository {
  Future<String> getCity(Position coordinates);
}
