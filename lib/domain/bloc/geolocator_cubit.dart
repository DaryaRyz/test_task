import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task_flutter/domain/repository/i_geolocation_repository.dart';

@injectable
class GeoLocatorCubit extends Cubit<GeoLocatorState> {
  final IGeoLocationRepository repository;

  GeoLocatorCubit(this.repository) : super(GeoLocatorLoadingState()) {
    getCity();
  }

  FutureOr<void> getCity() async {
    emit(GeoLocatorLoadingState());
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      emit(GeoLocatorReadyState('unknown'.tr()));
    } else {
      try {
        final userPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        final city = await repository.getCity(userPosition);
        emit(GeoLocatorReadyState(city));
      } catch (e) {
        emit(GeoLocatorErrorState('geoPositionError'.tr()));
      }
    }
  }
}

abstract class GeoLocatorState {}

class GeoLocatorLoadingState extends GeoLocatorState {}

class GeoLocatorReadyState extends GeoLocatorState {
  final String city;

  GeoLocatorReadyState(this.city);
}

class GeoLocatorErrorState extends GeoLocatorState {
  final String errorText;

  GeoLocatorErrorState(this.errorText);
}
