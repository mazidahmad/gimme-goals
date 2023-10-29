import 'package:gimme_goals/core/log/filter/release_log_filter.dart';
import 'package:gimme_goals/core/log/printer/simple_log_printer.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModule {
  Logger get logger => Logger(
        printer: SimpleLogPrinter(),
        filter: ReleaseLogFilter(),
      );
}
