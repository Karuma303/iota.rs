import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;
import 'package:path/path.dart' as path;

/// The glue class for Dart Native Platform (mobile, command line, server apps)
/// Does not work with web!

/// Basic HelloWorld Example for Dart FFI:
/// https://github.com/dart-lang/samples/blob/master/ffi/hello_world/hello.dart

/// Information about Dart FFI can be found here:
/// https://dart.dev/guides/libraries/c-interop

/// Note: On macOS, the Dart VM (dart) can load only signed libraries.
/// For details and workarounds, see https://github.com/dart-lang/sdk/issues/38314

// Create a typedef with the FFI type signature of the C function.
// Commonly used types defined by dart:ffi library include Double, Int32,
// NativeFunction, Pointer, Struct, Uint8, and Void.
// FFI signature of the test_func C function
typedef TestFunc = ffi.Void Function();

// Create a typedef for the variable that you’ll use when calling the C function
// Dart type definition for calling the C foreign function
typedef Test = void Function();

const libDir = 'native/target/release';
const libFileName = 'iota_client';

main() {
// Create a variable to store the path of the dynamic library
  var libraryPath = "";
  if (Platform.isLinux) {
    path.join(Directory.current.path, libDir, libFileName + '.so');
  } else if (Platform.isWindows) {
    libraryPath = path.join(
        // Directory.current.path, libDir, 'Debug', 'hello.dll');
        Directory.current.path,
        libDir,
        libFileName + '.dll');
  } else if (Platform.isMacOS) {
    libraryPath =
        path.join(Directory.current.path, libDir, libFileName + '.dylib');
  } else if (Platform.isAndroid) {
    // TODO
  } else if(Platform.isIOS) {
    // TODO
  } else if(Platform.isFuchsia) {
    // TODO
  }

  print('operating system is ${Platform.operatingSystem}');
  print('dynamic library path is $libraryPath');

  final dylib = ffi.DynamicLibrary.open(libraryPath);

  // Look up the C function 'hello_world'
  final Test test =
      dylib.lookup<ffi.NativeFunction<TestFunc>>('test_function').asFunction();
  // Call the function
  test();
}
