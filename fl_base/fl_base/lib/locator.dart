import 'package:fl_base/base/base_controller.dart';
import 'package:fl_base/controller/global_data_manager.dart';
import 'package:fl_base/global/app_theme.dart';
import 'package:fl_base/loading_wrapper.dart';

Future<void> setupLocator() async {
  Get.put<AppThemeBase>(AppThemeBase());
  Get.put<LoadingController>(LoadingController());
  Get.put<GlobalDataManager>(GlobalDataManager());
}
