/// Presentation layer에서 사용되는 상수
class LayoutConstant {
  const LayoutConstant._();

  // tablet size example: 600: 960
  // mobile size example: 360:640

  // Responsive breakpoints
  static const double screenTablet = 580;
  static const double screenDesktop = 900;

  static const double _zero = 0.0;
  static const double _xs = 2.0;
  static const double _s = 4.0;
  static const double _m = 8.0;
  static const double _l = 16.0;
  static const double _xl = 32.0;

  // Spacing
  /// Space Zero = 0.0
  static const double spaceZero = _zero;

  /// Space XS = 2.0
  static const double spaceXS = _xs;

  /// Space S = 4.0
  static const double spaceS = _s;

  /// Space M = 8.0
  static const double spaceM = _m;

  /// Space L = 16.0
  static const double spaceL = _l;

  /// Space XL = 32.0
  static const double spaceXL = _xl;

  /// TODO: 통일하고 싶다면 추후에 다 바꾸기

  // Margin
  /// Margin Zero = 0.0
  static const double marginZero = 0.0;

  /// Margin XS = 2.0
  static const double marginXS = 2.0;

  /// Margin S = 4.0
  static const double marginS = 4.0;

  /// Margin M = 8.0
  static const double marginM = 8.0;

  /// Margin L = 16.0
  static const double marginL = 16.0;

  /// Margin XL = 32.0
  static const double marginXL = 32.0;

  // Padding
  /// Padding Zero = 0.0
  static const double paddingZero = 0.0;

  /// Padding XS = 2.0
  static const double paddingXS = 2.0;

  /// Padding S = 4.0
  static const double paddingS = 4.0;

  /// Padding M = 8.0
  static const double paddingM = 8.0;

  /// Padding L = 16.0
  static const double paddingL = 16.0;

  /// Padding XL = 32.0
  static const double paddingXL = 32.0;

  // BorderRadius
  /// Radius Zero = 0.0
  static const double radiusZero = 0.0;

  /// Radius XS = 2.0
  static const double radiusXS = 2.0;

  /// Radius S = 4.0
  static const double radiusS = 4.0;

  /// Radius M = 8.0
  static const double radiusM = 8.0;

  /// Radius L = 16.0
  static const double radiusL = 16.0;

  /// Radius XL = 32.0
  static const double radiusXL = 32.0;

  /// Sidebar Folded Width
  static const double overhangWidth = 70;
}
