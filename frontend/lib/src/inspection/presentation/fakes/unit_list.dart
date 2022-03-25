/// 단위
abstract class UnitList {
  final List<String> items;

  const UnitList(this.items);
}

/// Pressure
class UnitPressure extends UnitList {
  const UnitPressure() : super(const ['kPa', 'MPa', 'N/m^2']);
}

/// Velocity
class UnitVelocity extends UnitList {
  const UnitVelocity() : super(const ['km/h', 'm/s', 'mph']);
}

/// Air Volume
class UnitAirVolume extends UnitList {
  const UnitAirVolume() : super(const ['m^3/h', 'l/s']);
}
