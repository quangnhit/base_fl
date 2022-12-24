import 'package:fl_base/base/base_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class SmartLoadListController {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final RxBool isLoadingPage = false.obs;

  void onLoadMore();

  void onRefresh();
}
