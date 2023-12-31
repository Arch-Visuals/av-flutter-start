import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:logger/logger.dart';

final logger = _OnStageLogger();

class _OnStageLogger {
  final Logger logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
      stackTraceBeginIndex: 4,
    ),
    output: MultiOutput(
      [
        ConsoleOutput(),
      ],
    ),
    filter: kReleaseMode ? ProductionFilter() : DevelopmentFilter(),
    level: kReleaseMode ? Level.verbose : Level.verbose,
  );

  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.v(message, error, stackTrace);

  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.i(message, error, stackTrace);

  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.w(message, error, stackTrace);

  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.e(message, error, stackTrace);

  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      logger.wtf(message, error, stackTrace);
}
