import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/domain/repository/i_geolocation_repository.dart';

@Injectable(as: IGeoLocationRepository)
class GeoLocationRepository implements IGeoLocationRepository {
  @override
  Future<String> getCity(Position position) async {
    final placeMark = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
      localeIdentifier: "ru_RU",
    );
    if (placeMark[0].locality != null && placeMark[0].locality!.isNotEmpty) {
      return placeMark[0].locality!;
    }
    return placeMark[0].administrativeArea!;
  }
}
