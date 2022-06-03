import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/core/presentation/layout_constant.dart';

class CheckImagebox extends ConsumerStatefulWidget {
  const CheckImagebox({
    Key? key,
    required this.index,
    required this.item,
  }) : super(key: key);

  final int index;
  final CheckItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckImageboxState();
}

class _CheckImageboxState extends ConsumerState<CheckImagebox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late FocusNode _node;

  /// RotationTransition은 radian 계산이 아닌 0 ~ 1(=2pi) 으로 보간해서
  /// 계산하기 때문에 45도(=1/4pi=1/8)를 회전을 고려한 값
  final _rotateTween = Tween<double>(begin: 0, end: 1 / 8).chain(
    CurveTween(curve: Curves.ease),
  );

  final _opacityTween = CurveTween(
    curve: const Interval(0, 0.5, curve: Curves.easeOut),
  );

  final _slideTween = CurveTween(curve: Curves.ease);

  bool open = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode(debugLabel: "imagebox");
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
  }

  @override
  void dispose() {
    _node.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Focus(
              focusNode: _node,
              onFocusChange: (focus) {
                if (focus) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
              child: GestureDetector(
                onTap: () {
                  log("icon tap");
                  _node.requestFocus();
                },
                child: RotationTransition(
                  turns: _rotateTween.animate(_controller),
                  child: const Icon(
                    Icons.add,
                    size: LayoutConstant.spaceXL,
                  ),
                ),
              ),
            ),
          ),
          _buildButton(Icons.abc, 50),
          _buildButton(Icons.format_size, 100),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(
    //     left: LayoutConstant.spaceM,
    //     top: LayoutConstant.spaceM,
    //     bottom: LayoutConstant.spaceM,
    //   ),
    //   child: AnimatedBuilder(
    //     animation: _controller,
    //     builder: (BuildContext context, Widget? child) {
    //       return Stack(
    //         children: [
    //           _buildButton(2, Icons.abc),
    //           _buildButton(4, Icons.ac_unit_outlined),
    //           Focus(
    //             focusNode: _node,
    //             onFocusChange: (focus) {
    //               if (focus) {
    //                 _controller.forward();
    //               } else {
    //                 // _controller.reverse();
    //               }
    //             },
    //             child: GestureDetector(
    //               behavior: HitTestBehavior.opaque,
    //               onTap: _node.requestFocus,
    //               child: RotationTransition(
    //                 turns: _rotateTween.animate(_controller),
    //                 child: const Icon(Icons.add),
    //               ),
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
  }

  Widget _buildButton(IconData icon, double left) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _controller.value <= 0.5
            ? const SizedBox()
            : Positioned(
                left: left * _slideTween.animate(_controller).value,
                child: FadeTransition(
                  opacity: _opacityTween.animate(_controller),
                  child: GestureDetector(
                    onTap: () {
                      log("p123123");
                    },
                    child: Icon(icon),
                  ),
                ),
              );
      },
    );
  }
}

// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// const Duration _kDropdownMenuDuration = Duration(milliseconds: 300);
// const double _kMenuItemHeight = kMinInteractiveDimension;
// const double _kDenseButtonHeight = 24.0;
// const EdgeInsets _kMenuItemPadding = EdgeInsets.symmetric(horizontal: 16.0);
// const EdgeInsetsGeometry _kAlignedButtonPadding =
//     EdgeInsetsDirectional.only(start: 16.0, end: 4.0);
// const EdgeInsets _kUnalignedButtonPadding = EdgeInsets.zero;
// const EdgeInsets _kAlignedMenuMargin = EdgeInsets.zero;
// const EdgeInsetsGeometry _kUnalignedMenuMargin =
//     EdgeInsetsDirectional.only(start: 16.0, end: 24.0);

// class CheckImagebox extends ConsumerStatefulWidget {
//   const CheckImagebox({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CheckImageboxState();
// }

// class _CheckImageboxState extends ConsumerState<CheckImagebox>
//     with WidgetsBindingObserver {
//   int? _selectedIndex;
//   Orientation? _lastOrientation;
//   FocusNode? _internalNode;
//   FocusNode? get focusNode => _internalNode;
//   bool _hasPrimaryFocus = false;
//   late Map<Type, Action<Intent>> _actionMap;
//   late FocusHighlightMode _focusHighlightMode;

//   // Only used if needed to create _internalNode.
//   FocusNode _createFocusNode() {
//     return FocusNode(debugLabel: '${widget.runtimeType}');
//   }

//   @override
//   void initState() {
//     super.initState();
//     _updateSelectedIndex();
//     _internalNode ??= _createFocusNode();
//     _actionMap = <Type, Action<Intent>>{
//       ActivateIntent: CallbackAction<ActivateIntent>(
//         onInvoke: (ActivateIntent intent) => _handleTap(),
//       ),
//       ButtonActivateIntent: CallbackAction<ButtonActivateIntent>(
//         onInvoke: (ButtonActivateIntent intent) => _handleTap(),
//       ),
//     };
//     focusNode!.addListener(_handleFocusChanged);
//     final FocusManager focusManager = WidgetsBinding.instance!.focusManager;
//     _focusHighlightMode = focusManager.highlightMode;
//     focusManager.addHighlightModeListener(_handleFocusHighlightModeChange);
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance!.removeObserver(this);
//     _removeDropdownRoute();
//     WidgetsBinding.instance!.focusManager
//         .removeHighlightModeListener(_handleFocusHighlightModeChange);
//     focusNode!.removeListener(_handleFocusChanged);
//     _internalNode?.dispose();
//     super.dispose();
//   }

//   void _removeDropdownRoute() {
//     _lastOrientation = null;
//   }

//   void _handleFocusChanged() {
//     if (_hasPrimaryFocus != focusNode!.hasPrimaryFocus) {
//       setState(() {
//         _hasPrimaryFocus = focusNode!.hasPrimaryFocus;
//       });
//     }
//   }

//   void _handleFocusHighlightModeChange(FocusHighlightMode mode) {
//     if (!mounted) {
//       return;
//     }
//     setState(() {
//       _focusHighlightMode = mode;
//     });
//   }

//   @override
//   void didUpdateWidget(CheckImagebox oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _updateSelectedIndex();
//   }

//   void _updateSelectedIndex() {
//     if (widget.items == null ||
//         widget.items!.isEmpty ||
//         (widget.value == null &&
//             widget.items!
//                 .where((DropdownMenuItem<T> item) =>
//                     item.enabled && item.value == widget.value)
//                 .isEmpty)) {
//       _selectedIndex = null;
//       return;
//     }

//     assert(widget.items!
//             .where((DropdownMenuItem<T> item) => item.value == widget.value)
//             .length ==
//         1);
//     for (int itemIndex = 0; itemIndex < widget.items!.length; itemIndex++) {
//       if (widget.items![itemIndex].value == widget.value) {
//         _selectedIndex = itemIndex;
//         return;
//       }
//     }
//   }

//   void _handleTap() {
//     final TextDirection? textDirection = Directionality.maybeOf(context);
//     final EdgeInsetsGeometry menuMargin =
//         ButtonTheme.of(context).alignedDropdown
//             ? _kAlignedMenuMargin
//             : _kUnalignedMenuMargin;

//     final List<_MenuItem<T>> menuItems = <_MenuItem<T>>[
//       for (int index = 0; index < widget.items!.length; index += 1)
//         _MenuItem<T>(
//           item: widget.items![index],
//           onLayout: (Size size) {
//             // If [_dropdownRoute] is null and onLayout is called, this means
//             // that performLayout was called on a _DropdownRoute that has not
//             // left the widget tree but is already on its way out.
//             //
//             // Since onLayout is used primarily to collect the desired heights
//             // of each menu item before laying them out, not having the _DropdownRoute
//             // collect each item's height to lay out is fine since the route is
//             // already on its way out.
//             if (_dropdownRoute == null) return;

//             _dropdownRoute!.itemHeights[index] = size.height;
//           },
//         ),
//     ];

//     final NavigatorState navigator = Navigator.of(context);
//     assert(_dropdownRoute == null);
//     final RenderBox itemBox = context.findRenderObject()! as RenderBox;
//     final Rect itemRect = itemBox.localToGlobal(Offset.zero,
//             ancestor: navigator.context.findRenderObject()) &
//         itemBox.size;
//     _dropdownRoute = _DropdownRoute<T>(
//       items: menuItems,
//       buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
//       padding: _kMenuItemPadding.resolve(textDirection),
//       selectedIndex: _selectedIndex ?? 0,
//       elevation: widget.elevation,
//       capturedThemes:
//           InheritedTheme.capture(from: context, to: navigator.context),
//       style: _textStyle!,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       itemHeight: widget.itemHeight,
//       dropdownColor: widget.dropdownColor,
//       menuMaxHeight: widget.menuMaxHeight,
//       enableFeedback: widget.enableFeedback ?? true,
//       borderRadius: widget.borderRadius,
//     );

//     focusNode?.requestFocus();
//     navigator
//         .push(_dropdownRoute!)
//         .then<void>((_DropdownRouteResult<T>? newValue) {
//       _removeDropdownRoute();
//       if (!mounted || newValue == null) return;
//       widget.onChanged?.call(newValue.result);
//     });

//     widget.onTap?.call();
//   }

//   // When isDense is true, reduce the height of this button from _kMenuItemHeight to
//   // _kDenseButtonHeight, but don't make it smaller than the text that it contains.
//   // Similarly, we don't reduce the height of the button so much that its icon
//   // would be clipped.
//   double get _denseButtonHeight {
//     final double fontSize = _textStyle!.fontSize ??
//         Theme.of(context).textTheme.subtitle1!.fontSize!;
//     return math.max(fontSize, math.max(widget.iconSize, _kDenseButtonHeight));
//   }

//   Color get _iconColor {
//     // These colors are not defined in the Material Design spec.
//     if (_enabled) {
//       if (widget.iconEnabledColor != null) return widget.iconEnabledColor!;

//       switch (Theme.of(context).brightness) {
//         case Brightness.light:
//           return Colors.grey.shade700;
//         case Brightness.dark:
//           return Colors.white70;
//       }
//     } else {
//       if (widget.iconDisabledColor != null) return widget.iconDisabledColor!;

//       switch (Theme.of(context).brightness) {
//         case Brightness.light:
//           return Colors.grey.shade400;
//         case Brightness.dark:
//           return Colors.white10;
//       }
//     }
//   }

//   bool get _enabled =>
//       widget.items != null &&
//       widget.items!.isNotEmpty &&
//       widget.onChanged != null;

//   Orientation _getOrientation(BuildContext context) {
//     Orientation? result = MediaQuery.maybeOf(context)?.orientation;
//     if (result == null) {
//       // If there's no MediaQuery, then use the window aspect to determine
//       // orientation.
//       final Size size = window.physicalSize;
//       result = size.width > size.height
//           ? Orientation.landscape
//           : Orientation.portrait;
//     }
//     return result;
//   }

//   bool get _showHighlight {
//     switch (_focusHighlightMode) {
//       case FocusHighlightMode.touch:
//         return false;
//       case FocusHighlightMode.traditional:
//         return _hasPrimaryFocus;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasMaterial(context));
//     assert(debugCheckHasMaterialLocalizations(context));
//     final Orientation newOrientation = _getOrientation(context);
//     _lastOrientation ??= newOrientation;
//     if (newOrientation != _lastOrientation) {
//       _removeDropdownRoute();
//       _lastOrientation = newOrientation;
//     }

//     // The width of the button and the menu are defined by the widest
//     // item and the width of the hint.
//     // We should explicitly type the items list to be a list of <Widget>,
//     // otherwise, no explicit type adding items maybe trigger a crash/failure
//     // when hint and selectedItemBuilder are provided.
//     final List<Widget> items = widget.selectedItemBuilder == null
//         ? (widget.items != null ? List<Widget>.of(widget.items!) : <Widget>[])
//         : List<Widget>.of(widget.selectedItemBuilder!(context));

//     int? hintIndex;
//     if (widget.hint != null || (!_enabled && widget.disabledHint != null)) {
//       Widget displayedHint =
//           _enabled ? widget.hint! : widget.disabledHint ?? widget.hint!;
//       if (widget.selectedItemBuilder == null)
//         displayedHint = _DropdownMenuItemContainer(child: displayedHint);

//       hintIndex = items.length;
//       items.add(DefaultTextStyle(
//         style: _textStyle!.copyWith(color: Theme.of(context).hintColor),
//         child: IgnorePointer(
//           ignoringSemantics: false,
//           child: displayedHint,
//         ),
//       ));
//     }

//     final EdgeInsetsGeometry padding = ButtonTheme.of(context).alignedDropdown
//         ? _kAlignedButtonPadding
//         : _kUnalignedButtonPadding;

//     // If value is null (then _selectedIndex is null) then we
//     // display the hint or nothing at all.
//     final Widget innerItemsWidget;
//     if (items.isEmpty) {
//       innerItemsWidget = Container();
//     } else {
//       innerItemsWidget = IndexedStack(
//         index: _selectedIndex ?? hintIndex,
//         alignment: widget.alignment,
//         children: widget.isDense
//             ? items
//             : items.map((Widget item) {
//                 return widget.itemHeight != null
//                     ? SizedBox(height: widget.itemHeight, child: item)
//                     : Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: <Widget>[item]);
//               }).toList(),
//       );
//     }

//     const Icon defaultIcon = Icon(Icons.arrow_drop_down);

//     Widget result = DefaultTextStyle(
//       style: _enabled
//           ? _textStyle!
//           : _textStyle!.copyWith(color: Theme.of(context).disabledColor),
//       child: Container(
//         decoration: _showHighlight
//             ? BoxDecoration(
//                 color: widget.focusColor ?? Theme.of(context).focusColor,
//                 borderRadius: const BorderRadius.all(Radius.circular(4.0)),
//               )
//             : null,
//         padding: padding.resolve(Directionality.of(context)),
//         height: widget.isDense ? _denseButtonHeight : null,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             if (widget.isExpanded)
//               Expanded(child: innerItemsWidget)
//             else
//               innerItemsWidget,
//             IconTheme(
//               data: IconThemeData(
//                 color: _iconColor,
//                 size: widget.iconSize,
//               ),
//               child: widget.icon ?? defaultIcon,
//             ),
//           ],
//         ),
//       ),
//     );

//     final MouseCursor effectiveMouseCursor =
//         MaterialStateProperty.resolveAs<MouseCursor>(
//       MaterialStateMouseCursor.clickable,
//       <MaterialState>{
//         if (!_enabled) MaterialState.disabled,
//       },
//     );

//     return Semantics(
//       button: true,
//       child: Actions(
//         actions: _actionMap,
//         child: Focus(
//           canRequestFocus: _enabled,
//           focusNode: focusNode,
//           child: MouseRegion(
//             cursor: effectiveMouseCursor,
//             child: GestureDetector(
//               onTap: _enabled ? _handleTap : null,
//               behavior: HitTestBehavior.opaque,
//               child: result,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ImageBoxRoute extends PopupRoute {
//   ImageBoxRoute({
//     required this.items,
//     required this.padding,
//     required this.buttonRect,
//     required this.selectedIndex,
//     this.elevation = 8,
//     required this.capturedThemes,
//     required this.style,
//     this.barrierLabel,
//     this.itemHeight,
//     this.dropdownColor,
//     this.menuMaxHeight,
//     required this.enableFeedback,
//     this.borderRadius,
//   })  : assert(style != null),
//         itemHeights = List<double>.filled(
//             items.length, itemHeight ?? kMinInteractiveDimension);

//   final List<_MenuItem<T>> items;
//   final EdgeInsetsGeometry padding;
//   final Rect buttonRect;
//   final int selectedIndex;
//   final int elevation;
//   final CapturedThemes capturedThemes;
//   final TextStyle style;
//   final double? itemHeight;
//   final Color? dropdownColor;
//   final double? menuMaxHeight;
//   final bool enableFeedback;
//   final BorderRadius? borderRadius;

//   final List<double> itemHeights;
//   ScrollController? scrollController;

//   @override
//   Duration get transitionDuration => _kDropdownMenuDuration;

//   @override
//   bool get barrierDismissible => true;

//   @override
//   Color? get barrierColor => null;

//   @override
//   final String? barrierLabel;

//   @override
//   Widget buildPage(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return ImageBoxPageRoute(
//           route: this,
//           constraints: constraints,
//           items: items,
//           padding: padding,
//           buttonRect: buttonRect,
//           selectedIndex: selectedIndex,
//           elevation: elevation,
//           capturedThemes: capturedThemes,
//           style: style,
//           dropdownColor: dropdownColor,
//           enableFeedback: enableFeedback,
//           borderRadius: borderRadius,
//         );
//       },
//     );
//   }

//   void _dismiss() {
//     if (isActive) {
//       navigator?.removeRoute(this);
//     }
//   }

//   double getItemOffset(int index) {
//     double offset = kMaterialListPadding.top;
//     if (items.isNotEmpty && index > 0) {
//       assert(items.length == itemHeights.length);
//       offset += itemHeights
//           .sublist(0, index)
//           .reduce((double total, double height) => total + height);
//     }
//     return offset;
//   }

//   // Returns the vertical extent of the menu and the initial scrollOffset
//   // for the ListView that contains the menu items. The vertical center of the
//   // selected item is aligned with the button's vertical center, as far as
//   // that's possible given availableHeight.
//   _MenuLimits getMenuLimits(
//       Rect buttonRect, double availableHeight, int index) {
//     double computedMaxHeight = availableHeight - 2.0 * _kMenuItemHeight;
//     if (menuMaxHeight != null) {
//       computedMaxHeight = math.min(computedMaxHeight, menuMaxHeight!);
//     }
//     final double buttonTop = buttonRect.top;
//     final double buttonBottom = math.min(buttonRect.bottom, availableHeight);
//     final double selectedItemOffset = getItemOffset(index);

//     // If the button is placed on the bottom or top of the screen, its top or
//     // bottom may be less than [_kMenuItemHeight] from the edge of the screen.
//     // In this case, we want to change the menu limits to align with the top
//     // or bottom edge of the button.
//     final double topLimit = math.min(_kMenuItemHeight, buttonTop);
//     final double bottomLimit =
//         math.max(availableHeight - _kMenuItemHeight, buttonBottom);

//     double menuTop = (buttonTop - selectedItemOffset) -
//         (itemHeights[selectedIndex] - buttonRect.height) / 2.0;
//     double preferredMenuHeight = kMaterialListPadding.vertical;
//     if (items.isNotEmpty)
//       preferredMenuHeight +=
//           itemHeights.reduce((double total, double height) => total + height);

//     // If there are too many elements in the menu, we need to shrink it down
//     // so it is at most the computedMaxHeight.
//     final double menuHeight = math.min(computedMaxHeight, preferredMenuHeight);
//     double menuBottom = menuTop + menuHeight;

//     // If the computed top or bottom of the menu are outside of the range
//     // specified, we need to bring them into range. If the item height is larger
//     // than the button height and the button is at the very bottom or top of the
//     // screen, the menu will be aligned with the bottom or top of the button
//     // respectively.
//     if (menuTop < topLimit) {
//       menuTop = math.min(buttonTop, topLimit);
//       menuBottom = menuTop + menuHeight;
//     }

//     if (menuBottom > bottomLimit) {
//       menuBottom = math.max(buttonBottom, bottomLimit);
//       menuTop = menuBottom - menuHeight;
//     }

//     if (menuBottom - itemHeights[selectedIndex] / 2.0 <
//         buttonBottom - buttonRect.height / 2.0) {
//       menuBottom = buttonBottom -
//           buttonRect.height / 2.0 +
//           itemHeights[selectedIndex] / 2.0;
//       menuTop = menuBottom - menuHeight;
//     }

//     double scrollOffset = 0;
//     // If all of the menu items will not fit within availableHeight then
//     // compute the scroll offset that will line the selected menu item up
//     // with the select item. This is only done when the menu is first
//     // shown - subsequently we leave the scroll offset where the user left
//     // it. This scroll offset is only accurate for fixed height menu items
//     // (the default).
//     if (preferredMenuHeight > computedMaxHeight) {
//       // The offset should be zero if the selected item is in view at the beginning
//       // of the menu. Otherwise, the scroll offset should center the item if possible.
//       scrollOffset = math.max(0.0, selectedItemOffset - (buttonTop - menuTop));
//       // If the selected item's scroll offset is greater than the maximum scroll offset,
//       // set it instead to the maximum allowed scroll offset.
//       scrollOffset = math.min(scrollOffset, preferredMenuHeight - menuHeight);
//     }

//     assert((menuBottom - menuTop - menuHeight).abs() < precisionErrorTolerance);
//     return _MenuLimits(menuTop, menuBottom, menuHeight, scrollOffset);
//   }
// }

// class ImageBoxPageRoute extends StatelessWidget {
//   const ImageBoxPageRoute({
//     Key? key,
//     required this.route,
//     required this.constraints,
//     this.items,
//     required this.padding,
//     required this.buttonRect,
//     required this.selectedIndex,
//     this.elevation = 8,
//     required this.capturedThemes,
//     this.style,
//     required this.dropdownColor,
//     required this.enableFeedback,
//     this.borderRadius,
//   }) : super(key: key);

//   final ImageBoxRoute route;
//   final BoxConstraints constraints;
//   final List<_MenuItem<T>>? items;
//   final EdgeInsetsGeometry padding;
//   final Rect buttonRect;
//   final int selectedIndex;
//   final int elevation;
//   final CapturedThemes capturedThemes;
//   final TextStyle? style;
//   final Color? dropdownColor;
//   final bool enableFeedback;
//   final BorderRadius? borderRadius;

//   @override
//   Widget build(BuildContext context) {
//     assert(debugCheckHasDirectionality(context));

//     // Computing the initialScrollOffset now, before the items have been laid
//     // out. This only works if the item heights are effectively fixed, i.e. either
//     // DropdownButton.itemHeight is specified or DropdownButton.itemHeight is null
//     // and all of the items' intrinsic heights are less than kMinInteractiveDimension.
//     // Otherwise the initialScrollOffset is just a rough approximation based on
//     // treating the items as if their heights were all equal to kMinInteractiveDimension.
//     if (route.scrollController == null) {
//       final _MenuLimits menuLimits =
//           route.getMenuLimits(buttonRect, constraints.maxHeight, selectedIndex);
//       route.scrollController =
//           ScrollController(initialScrollOffset: menuLimits.scrollOffset);
//     }

//     final TextDirection? textDirection = Directionality.maybeOf(context);
//     final Widget menu = _DropdownMenu<T>(
//       route: route,
//       padding: padding.resolve(textDirection),
//       buttonRect: buttonRect,
//       constraints: constraints,
//       dropdownColor: dropdownColor,
//       enableFeedback: enableFeedback,
//       borderRadius: borderRadius,
//     );

//     return MediaQuery.removePadding(
//       context: context,
//       removeTop: true,
//       removeBottom: true,
//       removeLeft: true,
//       removeRight: true,
//       child: Builder(
//         builder: (BuildContext context) {
//           return CustomSingleChildLayout(
//             delegate: ImageMenuRouteLayout(
//               buttonRect: buttonRect,
//               route: route,
//               textDirection: textDirection,
//             ),
//             child: capturedThemes.wrap(menu),
//           );
//         },
//       ),
//     );
//   }
// }

// class ImageMenuRouteLayout extends SingleChildLayoutDelegate {
//   ImageMenuRouteLayout({
//     required this.buttonRect,
//     required this.route,
//     required this.textDirection,
//   });

//   final Rect buttonRect;
//   final ImageBoxRoute route;
//   final TextDirection? textDirection;

//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     // The maximum height of a simple menu should be one or more rows less than
//     // the view height. This ensures a tappable area outside of the simple menu
//     // with which to dismiss the menu.
//     //   -- https://material.io/design/components/menus.html#usage
//     double maxHeight =
//         math.max(0.0, constraints.maxHeight - 2 * _kMenuItemHeight);
//     if (route.menuMaxHeight != null && route.menuMaxHeight! <= maxHeight) {
//       maxHeight = route.menuMaxHeight!;
//     }
//     // The width of a menu should be at most the view width. This ensures that
//     // the menu does not extend past the left and right edges of the screen.
//     final double width = math.min(constraints.maxWidth, buttonRect.width);
//     return BoxConstraints(
//       minWidth: width,
//       maxWidth: width,
//       maxHeight: maxHeight,
//     );
//   }

//   @override
//   Offset getPositionForChild(Size size, Size childSize) {
//     final _MenuLimits menuLimits =
//         route.getMenuLimits(buttonRect, size.height, route.selectedIndex);

//     assert(() {
//       final Rect container = Offset.zero & size;
//       if (container.intersect(buttonRect) == buttonRect) {
//         // If the button was entirely on-screen, then verify
//         // that the menu is also on-screen.
//         // If the button was a bit off-screen, then, oh well.
//         assert(menuLimits.top >= 0.0);
//         assert(menuLimits.top + menuLimits.height <= size.height);
//       }
//       return true;
//     }());
//     assert(textDirection != null);
//     final double left;
//     switch (textDirection!) {
//       case TextDirection.rtl:
//         left = buttonRect.right.clamp(0.0, size.width) - childSize.width;
//         break;
//       case TextDirection.ltr:
//         left = buttonRect.left.clamp(0.0, size.width - childSize.width);
//         break;
//     }

//     return Offset(left, menuLimits.top);
//   }

//   @override
//   bool shouldRelayout(ImageMenuRouteLayout oldDelegate) {
//     return buttonRect != oldDelegate.buttonRect ||
//         textDirection != oldDelegate.textDirection;
//   }
// }
