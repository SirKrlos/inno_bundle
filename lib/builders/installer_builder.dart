import 'dart:io';

import 'package:inno_bundle/models/config.dart';
import 'package:inno_bundle/utils/cli_logger.dart';
import 'package:inno_bundle/utils/constants.dart';
import 'package:path/path.dart' as p;

/// A class responsible for building the installer using Inno Setup.
class InstallerBuilder {
  /// The configuration guiding the build process.
  final Config config;

  /// The Inno Setup script file to be used for building the installer.
  final File scriptFile;

  /// Creates an instance of [InstallerBuilder] with the given [config] and [scriptFile].
  const InstallerBuilder(this.config, this.scriptFile);

  /// Locates the Inno Setup executable file, ensuring its proper installation.
  ///
  /// Throws a [ProcessException] if Inno Setup is not found or is corrupted.
  File _getInnoSetupExec() {
    if (!Directory(p.joinAll(innoSysDirPath)).existsSync() &&
        !Directory(p.joinAll(innoUserDirPath)).existsSync()) {
      CliLogger.error("Inno Setup is not detected in your machine, "
          "checkout our README on how to correctly install it:\n"
          "${CliLogger.sLink(readmeDownloadStepLink, level: CliLoggerLevel.two)}");
      exit(1);
    }

    final sysExec = p.joinAll([...innoSysDirPath, "ISCC.exe"]);
    final sysExecFile = File(sysExec);
    final userExec = p.joinAll([...innoUserDirPath, "ISCC.exe"]);
    final userExecFile = File(userExec);

    if (sysExecFile.existsSync()) return sysExecFile;
    if (userExecFile.existsSync()) return userExecFile;

    CliLogger.error("Inno Setup installation in your machine is corrupted "
        "or incomplete, checkout our README on how to correctly install it:\n"
        "${CliLogger.sLink(readmeDownloadStepLink, level: CliLoggerLevel.two)}");
    exit(1);
  }

  /// Builds the installer using Inno Setup and returns the directory containing the output files.
  ///
  /// Skips the build process if [config.installer] is `false`.
  /// Throws a [ProcessException] if the Inno Setup process fails.
  Future<Directory> build() async {
    if (!config.installer) {
      CliLogger.info("Skipping installer...");
      return Directory("");
    }

    final execFile = _getInnoSetupExec();
    var params = [scriptFile.path];
    if (config.signTool != null && config.signTool!.command.isNotEmpty) {
      params.add('/S${config.signTool!.name}=${config.signTool!.command}');
    }

    final process = await Process.start(
      execFile.path,
      params,
      runInShell: true,
      workingDirectory: Directory.current.path,
      mode: ProcessStartMode.inheritStdio,
    );
    final exitCode = await process.exitCode;
    if (exitCode != 0) exit(exitCode);
    return Directory.current;
  }
}
