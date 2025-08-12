import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final double? elevation;
  final Color? backgroundColor;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final TextStyle? titleStyle;
  final bool showDefaultBackButton;
  final double? leadingIconSize;
  final Color? leadingIconColor;
  final bool forceTransparency;
  final TabBar? tabBar;
  final double? bottomLineHeight;
  final Color? bottomLineColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.elevation,
    this.backgroundColor,
    this.centerTitle = true,
    this.bottom,
    this.toolbarHeight,
    this.titleStyle,
    this.showDefaultBackButton = true,
    this.leadingIconSize = 20,
    this.leadingIconColor,
    this.forceTransparency = false,
    this.tabBar,
    this.bottomLineHeight,
    this.bottomLineColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBar = AppBar(
      title: titleWidget ?? (title != null ? _buildTitle(context) : null),
      leading: _buildLeading(context),
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      elevation: forceTransparency ? 0 : (elevation ?? 0),
      backgroundColor: forceTransparency
          ? Colors.transparent
          : (backgroundColor ?? theme.appBarTheme.backgroundColor),
      centerTitle: centerTitle,
      bottom: _buildBottom(),
      toolbarHeight: toolbarHeight,
      iconTheme: leadingIconColor != null
          ? IconThemeData(color: leadingIconColor, size: leadingIconSize)
          : null,
      scrolledUnderElevation: forceTransparency ? 0 : null,
      surfaceTintColor: forceTransparency ? Colors.transparent : null,
    );

    if (tabBar != null) {
      return Column(
        children: [
          appBar,
          tabBar!,
        ],
      );
    }

    return appBar;
  }

  Widget? _buildLeading(BuildContext context) {
    if (leading != null) return leading;
    if (!showDefaultBackButton || !automaticallyImplyLeading) return null;

    return IconButton(
      icon: Icon(Icons.arrow_back_ios, size: leadingIconSize?.sp),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title!,
      style: titleStyle ??
          Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
            fontSize: 16.sp,
          ),
    );
  }

  PreferredSizeWidget? _buildBottom() {
    if (bottom != null) return bottom;
    if (bottomLineHeight == null) return null;

    return PreferredSize(
      preferredSize: Size.fromHeight(bottomLineHeight!),
      child: Container(
        color: bottomLineColor ?? Colors.grey.withValues(alpha:0.3),
        height: bottomLineHeight,
      ),
    );
  }

  @override
  Size get preferredSize {
    if (bottom != null) {
      return Size.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + bottom!.preferredSize.height);
    }
    if (tabBar != null) {
      return Size.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + tabBar!.preferredSize.height);
    }
    return Size.fromHeight(toolbarHeight ?? kToolbarHeight);
  }
}