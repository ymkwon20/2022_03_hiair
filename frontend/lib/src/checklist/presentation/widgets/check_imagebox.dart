// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// const Duration _kDropdownMenuDuration = Duration(milliseconds: 300);
// const double _kMenuItemHeight = kMinInteractiveDimension;
// const double _kDenseButtonHeight = 24.0;
// const EdgeInsets _kMenuItemPadding = EdgeInsets.symmetric(horizontal: 16.0);
// const EdgeInsetsGeometry _kAlignedButtonPadding = EdgeInsetsDirectional.only(start: 16.0, end: 4.0);
// const EdgeInsets _kUnalignedButtonPadding = EdgeInsets.zero;
// const EdgeInsets _kAlignedMenuMargin = EdgeInsets.zero;
// const EdgeInsetsGeometry _kUnalignedMenuMargin = EdgeInsetsDirectional.only(start: 16.0, end: 24.0);

// class CheckImagebox extends ConsumerStatefulWidget {
//   const CheckImagebox({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _CheckImageboxState();
// }

// class _CheckImageboxState extends ConsumerState<CheckImagebox> with WidgetsBindingObserver {

//   int? _selectedIndex;
//   Orientation? _lastOrientation;
//   FocusNode? _internalNode;
//   FocusNode? get focusNode =>  _internalNode;
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
//       _internalNode ??= _createFocusNode();
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
//     WidgetsBinding.instance!.focusManager.removeHighlightModeListener(_handleFocusHighlightModeChange);
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
//     if (widget.focusNode != oldWidget.focusNode) {
//       oldWidget.focusNode?.removeListener(_handleFocusChanged);
//       if (widget.focusNode == null) {
//         _internalNode ??= _createFocusNode();
//       }
//       _hasPrimaryFocus = focusNode!.hasPrimaryFocus;
//       focusNode!.addListener(_handleFocusChanged);
//     }
//     _updateSelectedIndex();
//   }

//   void _updateSelectedIndex() {
//     if (widget.items == null
//         || widget.items!.isEmpty
//         || (widget.value == null &&
//             widget.items!
//                 .where((DropdownMenuItem<T> item) => item.enabled && item.value == widget.value)
//                 .isEmpty)) {
//       _selectedIndex = null;
//       return;
//     }

//     assert(widget.items!.where((DropdownMenuItem<T> item) => item.value == widget.value).length == 1);
//     for (int itemIndex = 0; itemIndex < widget.items!.length; itemIndex++) {
//       if (widget.items![itemIndex].value == widget.value) {
//         _selectedIndex = itemIndex;
//         return;
//       }
//     }
//   }

//   TextStyle? get _textStyle => widget.style ?? Theme.of(context).textTheme.subtitle1;

//   void _handleTap() {
//     final TextDirection? textDirection = Directionality.maybeOf(context);
//     final EdgeInsetsGeometry menuMargin = ButtonTheme.of(context).alignedDropdown
//       ? _kAlignedMenuMargin
//       : _kUnalignedMenuMargin;

//     final List<_MenuItem<T>> menuItems = <_MenuItem<T>>[
//     for (int index = 0; index < widget.items!.length; index += 1)
//       _MenuItem<T>(
//         item: widget.items![index],
//         onLayout: (Size size) {
//           // If [_dropdownRoute] is null and onLayout is called, this means
//           // that performLayout was called on a _DropdownRoute that has not
//           // left the widget tree but is already on its way out.
//           //
//           // Since onLayout is used primarily to collect the desired heights
//           // of each menu item before laying them out, not having the _DropdownRoute
//           // collect each item's height to lay out is fine since the route is
//           // already on its way out.
//           if (_dropdownRoute == null)
//             return;

//           _dropdownRoute!.itemHeights[index] = size.height;
//         },
//       ),
//     ];

//     final NavigatorState navigator = Navigator.of(context);
//     assert(_dropdownRoute == null);
//     final RenderBox itemBox = context.findRenderObject()! as RenderBox;
//     final Rect itemRect = itemBox.localToGlobal(Offset.zero, ancestor: navigator.context.findRenderObject()) & itemBox.size;
//     _dropdownRoute = _DropdownRoute<T>(
//       items: menuItems,
//       buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
//       padding: _kMenuItemPadding.resolve(textDirection),
//       selectedIndex: _selectedIndex ?? 0,
//       elevation: widget.elevation,
//       capturedThemes: InheritedTheme.capture(from: context, to: navigator.context),
//       style: _textStyle!,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       itemHeight: widget.itemHeight,
//       dropdownColor: widget.dropdownColor,
//       menuMaxHeight: widget.menuMaxHeight,
//       enableFeedback: widget.enableFeedback ?? true,
//       borderRadius: widget.borderRadius,
//     );

//     focusNode?.requestFocus();
//     navigator.push(_dropdownRoute!).then<void>((_DropdownRouteResult<T>? newValue) {
//       _removeDropdownRoute();
//       if (!mounted || newValue == null)
//         return;
//       widget.onChanged?.call(newValue.result);
//     });

//     widget.onTap?.call();
//   }

//   // When isDense is true, reduce the height of this button from _kMenuItemHeight to
//   // _kDenseButtonHeight, but don't make it smaller than the text that it contains.
//   // Similarly, we don't reduce the height of the button so much that its icon
//   // would be clipped.
//   double get _denseButtonHeight {
//     final double fontSize = _textStyle!.fontSize ?? Theme.of(context).textTheme.subtitle1!.fontSize!;
//     return math.max(fontSize, math.max(widget.iconSize, _kDenseButtonHeight));
//   }

//   Color get _iconColor {
//     // These colors are not defined in the Material Design spec.
//     if (_enabled) {
//       if (widget.iconEnabledColor != null)
//         return widget.iconEnabledColor!;

//       switch (Theme.of(context).brightness) {
//         case Brightness.light:
//           return Colors.grey.shade700;
//         case Brightness.dark:
//           return Colors.white70;
//       }
//     } else {
//       if (widget.iconDisabledColor != null)
//         return widget.iconDisabledColor!;

//       switch (Theme.of(context).brightness) {
//         case Brightness.light:
//           return Colors.grey.shade400;
//         case Brightness.dark:
//           return Colors.white10;
//       }
//     }
//   }

//   bool get _enabled => widget.items != null && widget.items!.isNotEmpty && widget.onChanged != null;

//   Orientation _getOrientation(BuildContext context) {
//     Orientation? result = MediaQuery.maybeOf(context)?.orientation;
//     if (result == null) {
//       // If there's no MediaQuery, then use the window aspect to determine
//       // orientation.
//       final Size size = window.physicalSize;
//       result = size.width > size.height ? Orientation.landscape : Orientation.portrait;
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
//       ? (widget.items != null ? List<Widget>.of(widget.items!) : <Widget>[])
//       : List<Widget>.of(widget.selectedItemBuilder!(context));

//     int? hintIndex;
//     if (widget.hint != null || (!_enabled && widget.disabledHint != null)) {
//       Widget displayedHint = _enabled ? widget.hint! : widget.disabledHint ?? widget.hint!;
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
//       ? _kAlignedButtonPadding
//       : _kUnalignedButtonPadding;

//     // If value is null (then _selectedIndex is null) then we
//     // display the hint or nothing at all.
//     final Widget innerItemsWidget;
//     if (items.isEmpty) {
//       innerItemsWidget = Container();
//     } else {
//       innerItemsWidget = IndexedStack(
//         index: _selectedIndex ?? hintIndex,
//         alignment: widget.alignment,
//         children: widget.isDense ? items : items.map((Widget item) {
//           return widget.itemHeight != null
//             ? SizedBox(height: widget.itemHeight, child: item)
//             : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[item]);
//         }).toList(),
//       );
//     }

//     const Icon defaultIcon = Icon(Icons.arrow_drop_down);

//     Widget result = DefaultTextStyle(
//       style: _enabled ? _textStyle! : _textStyle!.copyWith(color: Theme.of(context).disabledColor),
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

//     if (!DropdownButtonHideUnderline.at(context)) {
//       final double bottom = (widget.isDense || widget.itemHeight == null) ? 0.0 : 8.0;
//       result = Stack(
//         children: <Widget>[
//           result,
//           Positioned(
//             left: 0.0,
//             right: 0.0,
//             bottom: bottom,
//             child: widget.underline ?? Container(
//               height: 1.0,
//               decoration: const BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(
//                     color: Color(0xFFBDBDBD),
//                     width: 0.0,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       );
//     }

//     final MouseCursor effectiveMouseCursor = MaterialStateProperty.resolveAs<MouseCursor>(
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
