// lib/core/constants/api_constants.dart
import 'dart:io';

// Para emulador Android (Android Studio o VSCode)
const String baseUrl = "http://192.168.0.32:5000/api";
const String ipURl = "192.168.0.32";

// Función para reemplazar 'localhost' con la IP adecuada
String replaceLocalhost(String rawUrl) {
  if (rawUrl.contains('localhost')) {
    final String ip = Platform.isAndroid ? ipURl : '127.0.0.1';
    return rawUrl.replaceFirst('localhost', ip);
  }
  return rawUrl;
}




// Para emulador Android (Android Studio o VSCode)
// const String baseUrl = "http://10.0.2.2:5000/api";

// Para dispositivo físico real (en misma red Wi-Fi)
// const String baseUrl = "http://192.168.0.32:5000/api";




// // lib/core/constants/api_constants.dart

// import 'dart:io';

// class ApiConstants {
//   static String get baseUrl {
//     if (Platform.isAndroid) {
//       // Emulador Android usa 10.0.2.2 para referirse al host
//       return "http://10.0.2.2:5000/api";
//     } else if (Platform.isIOS) {
//       // iOS usa localhost directamente
//       return "http://localhost:5000/api";
//     } else {
//       // Para dispositivos físicos o navegadores (Flutter Web)
//       return "http://192.168.0.32:5000/api"; 
//     }
//   }
// }
