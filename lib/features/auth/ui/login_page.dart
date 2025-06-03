//lib/features/auth/ui/login_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:aula_inteligente/features/auth/auth_controller.dart';
import 'package:aula_inteligente/shared/widgets/custom_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool showPassword = false;
  bool isLoading = false;

  // Future<void> _submitLogin() async {
  //   final auth = Provider.of<AuthController>(context, listen: false);
  //   setState(() => isLoading = true);

  //   final success = await auth.login(emailCtrl.text, passCtrl.text);
  //   setState(() => isLoading = false);

  //   if (!mounted) return;

  //   if (success) {
  //     showCustomSnackbar(
  //       context,
  //       "¡Inicio de sesión exitoso!",
  //       isSuccess: true,
  //     );
  //     Navigator.pushReplacementNamed(context, '/dashboard');
  //   } else {
  //     showCustomSnackbar(
  //       context,
  //       auth.error ?? 'Credenciales inválidas',
  //       isSuccess: false,
  //     );
  //   }
  // }
  Future<void> _submitLogin() async {
    final auth = Provider.of<AuthController>(context, listen: false);
    setState(() => isLoading = true);

    // 📤 Mostrar lo que se envía
    print('📧 Email enviado: ${emailCtrl.text}');
    print('🔐 Password enviado: ${passCtrl.text}');

    final success = await auth.login(emailCtrl.text, passCtrl.text);
    setState(() => isLoading = false);

    if (!mounted) return;

    if (success) {
      // ✅ Mostrar los datos recibidos
      print('✅ Login exitoso');
      // print('🪪 Token: ${auth.token}');
      print('👤 Usuario:');
      print('  ID: ${auth.user?.id}');
      print('  Nombre: ${auth.user?.name}');
      print('  Email: ${auth.user?.email}');
      print('  Rol: ${auth.user?.rol}');
      print('  Foto URL: ${auth.user?.photoUrl}');

      showCustomSnackbar(
        context,
        "¡Inicio de sesión exitoso!",
        isSuccess: true,
      );
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      showCustomSnackbar(
        context,
        auth.error ?? 'Credenciales inválidas',
        isSuccess: false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🎨 Fondo decorativo con degradado y círculos
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Color(0xFFE0E0E0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: -80,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            right: -60,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.03),
              ),
            ),
          ),
          // 🧩 Contenido principal
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInDown(
                      duration: const Duration(milliseconds: 800),
                      child: Text(
                        'Iniciar Sesión',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInDown(
                      duration: const Duration(milliseconds: 900),
                      child: Text(
                        'Accede al Aula Virtual',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1000),
                      child: _inputField(
                        Icons.email_outlined,
                        'Correo electrónico',
                        emailCtrl,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      duration: const Duration(milliseconds: 1100),
                      child: _inputField(
                        Icons.lock_outline,
                        'Contraseña',
                        passCtrl,
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 40),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _submitLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child:
                              isLoading
                                  ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : const Text(
                                    'Ingresar',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputField(
    IconData icon,
    String label,
    TextEditingController controller, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword && !showPassword,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        suffixIcon:
            isPassword
                ? IconButton(
                  icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey.shade700,
                  ),
                  onPressed: () => setState(() => showPassword = !showPassword),
                )
                : null,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
