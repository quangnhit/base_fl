import 'package:fl_base/base/import_base.dart';

enum TypeButton { active, inactive, secondary, ghost }

class WidgetButton extends StatelessWidget with BaseMixin {
  const WidgetButton({
    Key? key,
    required this.title,
    this.titleDescription,
    required this.onClick,
    this.typeButton = TypeButton.active,
    this.width,
    this.height = 50,
    this.bgColor,
    this.textColor,
    this.bgColorSecondary,
    this.textColorSecondary,
    this.bgColorGhost,
    this.textColorGhost,
    this.colorBorder,
    this.borderRadius = 4,
    this.textWeight,
    this.textSize = 16,
    this.isShowLoading = false,
    this.enable = true,
  }) : super(key: key);

  final String title;
  final String? titleDescription;
  final Function onClick;

  final TypeButton typeButton;
  final double? width;

  final double height;

  final Color? bgColor;

  final Color? textColor;

  final Color? bgColorSecondary;

  final Color? textColorSecondary;

  final Color? bgColorGhost;

  final Color? textColorGhost;

  final Color? colorBorder;

  final double borderRadius;

  final FontWeight? textWeight;

  final double? textSize;

  final bool isShowLoading;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: ElevatedButton(
        onPressed: () {
          if (!isShowLoading && enable) {
            onClick();
          }
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          // ignore: deprecated_member_use
          primary: colorBg,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: borderButton),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.custom(
                    color: colorText, fontWeight: fontText, size: textSize),
              ),
            ),
            if (titleDescription != null)
              Text(
                titleDescription!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle.custom(
                    color: colorText, fontWeight: fontText, size: textSize),
              ),
            if (isShowLoading)
              Container(
                width: 16.0,
                height: 16.0,
                margin: const EdgeInsets.only(left: 12),
                // ignore: prefer_const_constructors
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                ),
              )
          ],
        ),
      ),
    );
  }

  Color get colorBg {
    if (enable) {
      switch (typeButton) {
        case TypeButton.active:
          return bgColor ?? color.appBaseColor;
        case TypeButton.inactive:
        // return (bgColor ?? color.primary).withOpacity(0.5);
        case TypeButton.secondary:
        // return bgColorSecondary ?? color.background1;
        case TypeButton.ghost:
        // return bgColorGhost ?? color.neutral800;
        default:
          return bgColor ?? color.appBaseColor;
      }
    } else {
      return color.appBaseColor;
    }
  }

  BorderSide get borderButton {
    switch (typeButton) {
      case TypeButton.ghost:
        return BorderSide(color: colorBorder ?? color.appBaseColor);
      case TypeButton.secondary:
        return BorderSide(color: colorBorder ?? color.appBaseColor);
      case TypeButton.active:
      case TypeButton.inactive:
      default:
        return BorderSide.none;
    }
  }

  Color get colorText {
    switch (typeButton) {
      case TypeButton.active:
        return textColor ?? color.white;
      case TypeButton.inactive:
        return textColor ?? color.appBaseColor;
      case TypeButton.secondary:
        return textColorSecondary ?? color.appBaseColor;
      case TypeButton.ghost:
        return textColorGhost ?? color.appBaseColor;
      default:
        return textColor ?? color.white;
    }
  }

  FontWeight get fontText {
    switch (typeButton) {
      case TypeButton.active:
      case TypeButton.inactive:
        return textWeight ?? FontWeight.w600;
      case TypeButton.secondary:
      case TypeButton.ghost:
      default:
        return textWeight ?? FontWeight.w400;
    }
  }
}
