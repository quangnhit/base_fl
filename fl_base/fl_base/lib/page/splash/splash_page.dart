import 'package:fl_base/base/import_base.dart';
import 'package:fl_base/page/splash/splash_controller.dart';
import 'package:fl_base/widget_component/button/widget_button.dart';

class SplashPage extends BaseScreen<SplashController> {
  SplashPage({super.key});

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: color.white,
      appBar: AppBar(title: const Text('base')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WidgetButton(
              title: 'Test',
              onClick: () => showConfirmDialog(
                onAccept: () {},
                title: 'qweqweqee',
                message: 'qweqweqee',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  SplashController? putController() => SplashController();
}
