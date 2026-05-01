import 'package:get/get.dart';
import '../modules/main/view/main_view.dart';
import '../modules/design_system/view/design_system_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(name: Routes.MAIN, page: () => const MainView()),
    GetPage(name: Routes.DESIGN_SYSTEM, page: () => const DesignSystemView()),
  ];
}
