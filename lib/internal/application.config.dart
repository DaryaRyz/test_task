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
import 'package:test_task_flutter/data/repository/bag_repository.dart' as _i5;
import 'package:test_task_flutter/data/repository/geolocation_repository.dart'
    as _i9;
import 'package:test_task_flutter/data/repository/products_repository.dart'
    as _i11;
import 'package:test_task_flutter/data/services/dio_client/dio_client.dart'
    as _i7;
import 'package:test_task_flutter/data/services/dio_client/i_dio_client.dart'
    as _i6;
import 'package:test_task_flutter/data/storage/bag_storage.dart' as _i3;
import 'package:test_task_flutter/domain/bloc/bag_bloc.dart' as _i12;
import 'package:test_task_flutter/domain/bloc/category_cubit.dart' as _i13;
import 'package:test_task_flutter/domain/bloc/dishes_bloc.dart' as _i14;
import 'package:test_task_flutter/domain/bloc/geolocator_cubit.dart' as _i15;
import 'package:test_task_flutter/domain/repository/i_bag_repository.dart'
    as _i4;
import 'package:test_task_flutter/domain/repository/i_geolocation_repository.dart'
    as _i8;
import 'package:test_task_flutter/domain/repository/i_products_repository.dart'
    as _i10;

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
    gh.factory<_i3.BagStorage>(() => _i3.BagStorage());
    gh.factory<_i4.IBagRepository>(
        () => _i5.BagRepository(gh<_i3.BagStorage>()));
    gh.factory<_i6.IDioClient>(() => _i7.DioClient());
    gh.factory<_i8.IGeoLocationRepository>(() => _i9.GeoLocationRepository());
    gh.factory<_i10.IProductsRepository>(
        () => _i11.ProductsRepository(gh<_i6.IDioClient>()));
    gh.singleton<_i12.BagBloc>(_i12.BagBloc(gh<_i4.IBagRepository>()));
    gh.factory<_i13.CategoryCubit>(
        () => _i13.CategoryCubit(gh<_i10.IProductsRepository>()));
    gh.factory<_i14.DishesBloc>(
        () => _i14.DishesBloc(gh<_i10.IProductsRepository>()));
    gh.factory<_i15.GeoLocatorCubit>(
        () => _i15.GeoLocatorCubit(gh<_i8.IGeoLocationRepository>()));
    return this;
  }
}
