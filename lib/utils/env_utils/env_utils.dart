import 'server_mode.dart';

ServerMode get serverMode {
  const stringValue = String.fromEnvironment('MODE', defaultValue: 'server');
  return ServerMode.fromString(stringValue);
}

bool get useEmulator => serverMode == ServerMode.emulator;
