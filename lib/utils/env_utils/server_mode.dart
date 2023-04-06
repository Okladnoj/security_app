import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum ServerMode {
  server,
  emulator;

  factory ServerMode.fromString(String stringValue) {
    switch (stringValue) {
      case 'server':
        return server;
      case 'emulator':
        return emulator;
      default:
        return server;
    }
  }
}
