## 0.0.1

- Add a working bundler and example.

## 0.0.2

- Add a README.md to example and update main README.md.

## 0.0.3

- Fix `languages` attribute name in README.md example.

## 0.1.0

- Make `installer_icon` optional attribute.

## 0.1.1

- Update README.md.

## 0.2.0

- Update default icon, old one is not premissable to use for commercial use
  without license, so I created new one from **license free** resources.

- Clean cuportino icons from example as it is unused.

- Clean `lib\inno_bundle.dart` and `test\inno_bundle_test.dart`.

- When default icon is used, the new one is copied to `%TEMP%` folder on every
  installer build, I did not find an efficient way to update the old one.

## 0.3.0

- Replace `--skip-app` with `--app` and `--no-app` flags, default to `--app`.

- Add `--installer` and `--no-installer` flags, default to `--installer`.

- Add `--help` and `-h` with descriptive messages to each flag.

- Refactor `Config` to include cli arguments as well.

- Make `.iss script` generation happen under
  `build\windows\x64\installer\<BuildType>\<AppName>.iss`.

- Add `%UserProfile%\Local\Programs\Inno Setup 6` as a possible path to find
  Inno Setup installation.

- Update error message for option to install Inno Setup using `winget`
  when not detected on the machine.

## 0.3.1

- Update README.md for winget installation option of Inno Setup.

- Replace LinkedIn link in maintainer clause for generated `iss script` with
  GitHub link.

## 0.3.2

- Add documentation to codebase.

## 0.3.3

- Fix issue icon not persisting in the system temp directory when using
  default installer icon.

- Update iss script maintainer clause.

- Rename generated iss script to `inno-script.iss`.

## 0.4.0

- Add `--hf` and `--no-hf` flags to control printing of header and footer text.

- Add `--envs` to `build` command to print resolved config as environment
  variables and exit.

- Add `--help` to `id` command.

## 0.4.1

- Add guide to setup GitHub Workflows and automate installer build as GitHub releases.

## 0.4.2

- Update packages version and minimum dart and flutter version to latest.

## 0.5.0

- Update packages and lower back minimum dart and flutter versions.

- rework usage of app name and pubspec name props.
  See [#2](https://github.com/hahouari/inno_bundle/issues/2).

## 0.6.0

- Add `--app-version` argument to `build` command to override app version from CLI.

- Add `--build-args` argument to `build` command to append more args into `flutter build`.

- Improve building app to include obfuscation during app build.

- Improve uninstaller UI/UX info.

- Add installer SVG file to demo assets under MIT license. (not a feature, but worth tracking)

- Add Inno Setup installation step through `Chocolatey`.

- Improve error messages and suggest repo link as guide for corrupted installs of Inno Setup.

## 0.6.1

- Fix `admin` attribute was not resolving correctly from `pubspec.yaml`
  [#4](https://github.com/hahouari/inno_bundle/pull/4).

- Add `license_file` attribute to `inno_bundle` section to accommodate software license file
  [#5](https://github.com/hahouari/inno_bundle/pull/5).

- Look up project root folder for `LICENSE` file if `license_file` attribute is not provided.

- Change default checked to `true` for for add desktop icon checkbox.

- Optimize published library size by excluding installer ico and svg files.

## 0.7.0

- **`(Breaking!)`** Move to Inno Setup version `6.3.3`.

- Add `auto` value to `admin` attribute.

- Add `arch` attribute to enable or disable x64 emulation on Arm devices.

- Rewrite `README.md` into much smaller version.

- Move configuration details and examples to
  [GitHub Wiki](https://github.com/hahouari/inno_bundle/wiki).

- Add `sign_tool` field to sign installer and uninstaller
  [#7](https://github.com/hahouari/inno_bundle/pull/7)

- Add `--sign-tool-name`, `--sign-tool-command`, `--sign-tool-params` CLI parameters
  to partially override `sign_tool` attribute.

- Trivial update to packages versions.

## 0.7.1

- Add `korean` language support.

- Improve file-level documentation.
