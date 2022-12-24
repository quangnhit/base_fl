import 'package:fl_base/base/import_base.dart';
import 'package:fl_base/widget_component/smart_scroll/smart_scroll_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:io' show Platform;

class SmartLoadListWidget {
  Widget buildSmartListExpanded(SmartLoadListController controller,
          {Widget? child, bool? enablePullDown, bool? enablePullUp}) =>
      Obx(
        () => Expanded(
          child: SmartRefresher(
            controller: controller.refreshController,
            enablePullDown: enablePullDown ?? true,
            enablePullUp: enablePullUp ?? false,
            onLoading: controller.onLoadMore,
            onRefresh: controller.onRefresh,
            header: Platform.isIOS
                ? const ClassicHeader(
                    idleText: '',
                    refreshingText: '',
                    releaseText: '',
                    failedText: '',
                    completeText: '',
                    canTwoLevelText: '',
                    height: 40,
                    spacing: 0,
                    completeIcon: SizedBox(),
                  )
                : const MaterialClassicHeader(height: 40),
            footer: const ClassicFooter(
              loadStyle: LoadStyle.ShowWhenLoading,
              idleText: '',
              failedText: '',
              noDataText: '',
              loadingText: '',
              canLoadingText: '',
              height: 40,
              idleIcon: SizedBox(),
            ),
            child: child,
          ),
        ),
      );

  SmartRefresher buildSmartList(
    SmartLoadListController controller, {
    Widget? child,
    bool? enablePullDown,
    bool? enablePullUp,
  }) =>
      SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: enablePullDown ?? true,
        enablePullUp: enablePullUp ?? false,
        onLoading: controller.onLoadMore,
        onRefresh: controller.onRefresh,
        child: child,
      );
}
