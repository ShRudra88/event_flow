
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';



class AuthService extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> AdminLogin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signUpWithEmailPassword(String email, String password,
      String name) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await cred.user?.updateDisplayName(name);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }


  Future<void> sendPasswordResetLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }


    Future<void> signOut() async {
      await _auth.signOut();
    }
  }
