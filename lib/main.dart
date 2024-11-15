import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'admin_kelas_page.dart';
import 'admin_welcome_page.dart';
import 'login_page.dart';
import 'menu_page.dart';
import 'registrasi_page.dart';
import 'splash_screen.dart';
import 'verifikasi_page.dart';
import 'welcome_page.dart';
import 'admin_login_screen.dart';
import 'admin_verifikasi_page.dart';
import 'admin_menu_page.dart';
import 'admin_presensi_page.dart';
import 'admin_hafalan_page.dart';
import 'admin_kelasvirtual_page.dart';
import 'admin_iqro_page.dart';
import 'admin_akun_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NgajiYok',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const WelcomePage(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(data: ''),
        '/verificationSuccess': (context) => VerificationSuccessPage(data: ''),
        '/menu': (context) => MenuPage(data: ''),
        '/welcomeadmin': (context) => AdminWelcomePage(data: ''),
        '/loginAdmin': (context) => AdminLoginPage(data: ''),
        '/verificationAdmin': (context) => VerificationAdminPage(data: ''),
        '/menuAdmin': (context) => AdminMenuPage(data: ''),
        '/adminPresensi': (context) => PresensiPage(data: ''),
        '/adminProgresHafalan': (context) => AdminProgresHafalanPage(),
        '/adminKelas': (context) => AdminKelasPage(),
        '/adminKelasVirtual': (context) => const AdminKelasvirtualPage(),
        '/adminProgresIqro': (context) => AdminProgresIqroPage(),
        '/adminAkun': (context) => const AdminAccountPage(),
      },
    );
  }
}
