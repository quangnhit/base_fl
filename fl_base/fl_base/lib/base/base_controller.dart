import 'package:fl_base/controller/controller_manager.dart';
import 'package:fl_base/core_support/base_value_notify.dart';
import 'package:fl_base/global/app_log.dart';
import 'package:fl_base/loading_wrapper.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'base_common_widgets.dart';
export 'package:get/get.dart';

class BaseController extends GetxController with BaseCommonWidgets {
  final box = GetStorage();
  LoadingController get loading => Get.find<LoadingController>();

  RxNotify<bool> loadingPage = false.objective;

  @override
  void onInit() {
    ControllerManager().currentController.value = Get.currentRoute;
    log.debugPrint('BaseController');
    super.onInit();
  }

  void onResumed() {}

  void showLoading() {
    loading.show();
  }

  void showLoadingWhenInit() {
    SchedulerBinding.instance.addPostFrameCallback((_) => loading.show());
  }

  void hideLoading() {
    loading.hide();
  }

  void showLoadingPage() {
    loadingPage.value = true;
  }

  void hideLoadingPage() {
    loadingPage.value = false;
  }

  @override
  void dispose() {
    loadingPage.value = false;
    loading.hideAll();
    super.dispose();
  }

  AppLog get log => AppLog.log;
}
