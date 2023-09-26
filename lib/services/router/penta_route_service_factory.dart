import 'ipenta_route_service.dart';

class PentaRouteServiceFactory {
  final IPentaRouteService _routeService;

  IPentaRouteService get routeService => _routeService;

  PentaRouteServiceFactory(this._routeService);
}
