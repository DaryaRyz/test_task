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
    as _i7;
import 'package:test_task_flutter/data/repository/products_repository.dart'
    as _i9;
import 'package:test_task_flutter/data/services/dio_client/dio_client.dart'
    as _i5;
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart'
    as _i4;
import 'package:test_task_flutter/domain/bloc/bag_bloc.dart' as _i3;
import 'package:test_task_flutter/domain/bloc/category_cubit.dart' as _i10;
import 'package:test_task_flutter/domain/bloc/dishes_bloc.dart' as _i11;
import 'package:test_task_flutter/domain/bloc/geolocator_cubit.dart' as _i12;
import 'package:test_task_flutter/domain/repository/i_geolocation_repository.dart'
    as _i6;
import 'package:test_task_flutter/domain/repository/i_products_repository.dart'
    as _i8;

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
    gh.singleton<_i3.BagBloc>(_i3.BagBloc());
    gh.factory<_i4.IDioClient>(() => _i5.DioClient());
    gh.factory<_i6.IGeoLocationRepository>(() => _i7.GeoLocationRepository());
    gh.factory<_i8.IProductsRepository>(
        () => _i9.ProductsRepository(gh<_i4.IDioClient>()));
    gh.factory<_i10.CategoryCubit>(
        () => _i10.CategoryCubit(gh<_i8.IProductsRepository>()));
    gh.factory<_i11.DishesBloc>(
        () => _i11.DishesBloc(gh<_i8.IProductsRepository>()));
    gh.factory<_i12.GeoLocatorCubit>(
        () => _i12.GeoLocatorCubit(gh<_i6.IGeoLocationRepository>()));
    return this;
  }
}
