import 'package:get/get.dart';
import '../modules/design_system/view/design_system_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DESIGN_SYSTEM;

  static final routes = [
    GetPage(name: Routes.DESIGN_SYSTEM, page: () => const DesignSystemView()),
  ];
}
