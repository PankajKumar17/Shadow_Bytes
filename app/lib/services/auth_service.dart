import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      bool isBiometricAvailable = await auth.canCheckBiometrics;
      bool hasDeviceCredentials = await auth.isDeviceSupported();

      print("Biometric available: $isBiometricAvailable");
      print("Device supports biometrics: $hasDeviceCredentials");

      if (isBiometricAvailable || hasDeviceCredentials) {
        bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Authenticate to proceed',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
          ),
        );
        print("Biometric Authentication Result: $didAuthenticate");
        return didAuthenticate;
      } else {
        print("Biometric authentication not available");
        return false;
      }
    } catch (e) {
      print("Biometric authentication error: $e");
      return false;
    }
  }
}