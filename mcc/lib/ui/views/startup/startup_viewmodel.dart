import 'package:mcc/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:mcc/app/app.locator.dart';
import 'package:mcc/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
