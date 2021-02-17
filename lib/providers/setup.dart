import 'package:whatsup/navigators/auth_router_delegate.dart';
import 'package:whatsup/service/firebase/auth/authentication_service.dart';
import 'package:whatsup/viewmodels/login/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildStatelessWidget> providers = [
  ...atomicProviders,
  ...compoundProviders
];

List<SingleChildStatelessWidget> atomicProviders = [
  Provider.value(value: AuthenicationService.instance),
];

List<SingleChildStatelessWidget> compoundProviders = [
  ChangeNotifierProxyProvider<AuthenicationService, LoginViewModel>(
    create: (context) {
      return LoginViewModel(
        authenicationService:
            Provider.of<AuthenicationService>(context, listen: false),
      );
    },
    update: (context, authenticationService, loginViewModel) {
      // update is not supposed to happen
      return loginViewModel;
    },
  ),
  ProxyProvider<LoginViewModel, AppRouteInformationParser>(
    create: (context) {
      return AppRouteInformationParser(
        loginViewModel: Provider.of<LoginViewModel>(context, listen: false),
      );
    },
    update: (context, loginViewModel, appRouteInformationParser) {
      return appRouteInformationParser;
    },
  ),
];
