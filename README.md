# Test project

This project is test project with minimal functions. This is a Flutter application that fetches and
displays a list of categories dishes and dishes with the help of an external API. The project also
lets us look each dish on individual popup. Also you can add or remove each dish to basket. The data
of basket save in the local storage.

### Technologies Used:

* Clean Architecture pattern
* Bloc for state management
* Retrofit with Dio for the Network layer
* Hive for local storage
* Injectable and GetIt for dependencies injection
* AutoRoute for navigation
* CachedNetworkImage for caching network images
* EasyLocalization for localization in the application
* FlutterGen for generating assets

Before running the app, you have to run: `flutter pub run build_runner build`
