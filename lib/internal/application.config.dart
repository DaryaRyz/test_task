// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_task_flutter/data/repository/geolocation_repository.dart'
    as _i6;
import 'package:test_task_flutter/data/repository/products_repository.dart'
    as _i8;
import 'package:test_task_flutter/data/services/dio_client/dio_client.dart'
    as _i4;
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart'
    as _i3;
import 'package:test_task_flutter/domain/bloc/category_cubit.dart' as _i9;
import 'package:test_task_flutter/domain/bloc/dishes_bloc.dart' as _i10;
import 'package:test_task_flutter/domain/bloc/geolocator_cubit.dart' as _i11;
import 'package:test_task_flutter/domain/repository/i_geolocation_repository.dart'
    as _i5;
import 'package:test_task_flutter/domain/repository/i_products_repository.dart'
    as _i7;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.IDioClient>(() => _i4.DioClient());
    gh.factory<_i5.IGeoLocationRepository>(() => _i6.GeoLocationRepository());
    gh.factory<_i7.IProductsRepository>(
        () => _i8.ProductsRepository(gh<_i3.IDioClient>()));
    gh.factory<_i9.CategoryCubit>(
        () => _i9.CategoryCubit(gh<_i7.IProductsRepository>()));
    gh.factory<_i10.DishesBloc>(
        () => _i10.DishesBloc(gh<_i7.IProductsRepository>()));
    gh.factory<_i11.GeoLocatorCubit>(
        () => _i11.GeoLocatorCubit(gh<_i5.IGeoLocationRepository>()));
    return this;
  }
}
