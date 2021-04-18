import 'package:whatsup/navigators/auth_router_delegate.dart';
import 'package:whatsup/service/firebase/auth/authentication_service.dart';
import 'package:whatsup/service/location/location_service.dart';
import 'package:whatsup/viewmodels/login/app_login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildStatelessWidget> providers = [
  ...atomicProviders,
  ...compoundProviders
];

List<SingleChildStatelessWidget> atomicProviders = [
  Provider.value(value: AuthenicationService.instance),
  Provider.value(value: LocationService.instance),
];

List<SingleChildStatelessWidget> compoundProviders = [
  ChangeNotifierProxyProvider<AuthenicationService, AppLoginViewModel>(
    create: (context) {
      return AppLoginViewModel(
        authenicationService:
            Provider.of<AuthenicationService>(context, listen: false),
      );
    },
    update: (context, authenticationService, loginViewModel) {
      // update is not supposed to happen
      return loginViewModel;
    },
  ),
  ProxyProvider<AppLoginViewModel, AppRouteInformationParser>(
    create: (context) {
      return AppRouteInformationParser(
        loginViewModel: Provider.of<AppLoginViewModel>(context, listen: false),
      );
    },
    update: (context, loginViewModel, appRouteInformationParser) {
      return appRouteInformationParser;
    },
  ),
];
