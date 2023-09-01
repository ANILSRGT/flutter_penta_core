import 'iroute_service.dart';

class RouteServiceFactory {
  final IRouteService _routeService;

  IRouteService get routeService => _routeService;

  RouteServiceFactory(this._routeService);
}
