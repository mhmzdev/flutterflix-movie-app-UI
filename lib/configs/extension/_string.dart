part of '../configs.dart';

extension SuperString on String {
  Future<T?> push<T>(BuildContext context, {Object? arguments}) =>
      Navigator.pushNamed<T?>(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pushReplace(BuildContext context, {Object? arguments}) =>
      Navigator.pushReplacementNamed(
        context,
        this,
        arguments: arguments,
      );

  Future<void> pop<T extends Object?>(BuildContext context,
          [T? result]) async =>
      Navigator.pop(context, result);

  Future<void> popUntil(BuildContext context) async =>
      Navigator.popUntil(context, ModalRoute.withName(this));

  bool sameRoute() =>
      NavigationHistoryObserver().history.isNotEmpty &&
      NavigationHistoryObserver().top?.settings.name == this;

  RoutingData get getRoutingData {
    final uriData = Uri.parse(this);

    return RoutingData(
      route: uriData.path,
      queryParams: uriData.queryParameters,
    );
  }
}

class RoutingData {
  final String route;
  final Map<String, String>? _queryParams;

  RoutingData({
    required this.route,
    Map<String, String>? queryParams,
  }) : _queryParams = queryParams;

  operator [](String key) => _queryParams?[key];
}
