import 'package:objectbox/objectbox.dart';

@Entity()
class SettingsInfoObject {
  int id;
  String? themeMode;
  SettingsInfoObject({
    this.id = 0,
    this.themeMode,
  });
}
