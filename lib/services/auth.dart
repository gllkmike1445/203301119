import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user.dart';

class Auth{
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> login(String email, String password) async {
    var user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return user.user;
  }

  Future<User?> signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;

        if (user != null) {
          // Kullanıcı verilerini al ve Firestore'a kaydet
          UserModel userModel = UserModel(
            name: user.displayName.toString(),
            email: user.email.toString(),
            password: 'googlesignin',
            backgroundImage: 'https://i.pinimg.com/550x/f4/15/ce/f415ce5c6d49015f8194fff60b8392a7.jpg',
            phone: user.phoneNumber.toString(),
            image: user.photoURL.toString(),
          );

          await firestore
              .collection("users")
              .doc(user.uid)
              .set(userModel.toJson());
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // Hata durumunu burada işle
        } else if (e.code == 'invalid-credential') {
          // Hata durumunu burada işle
        }
      } catch (e) {
        // Hata durumunu burada işle
      }
    }

    return user;
  }

  Future<User?> createUser(String email, String password,
      UserModel userModel) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print(userModel.toString());
    await firestore
        .collection("users")
        .doc(user.user!.uid)
        .set(userModel.toJson());
    return user.user;
  }

  Future<UserModel> getUser() async {
    CollectionReference ref = firestore.collection("users");
    String uid = auth.currentUser!.uid;
    UserModel userModel;
    var document = ref.doc(uid);
    var response = await document.get();
try{
  userModel = UserModel.fromJson(response.data() as dynamic);
}
catch(error){
  userModel = UserModel(name: auth.currentUser!.displayName.toString(), email: auth.currentUser!.email.toString(), password: 'googlesignin', phone: auth.currentUser!.phoneNumber.toString(),image: auth.currentUser!.photoURL.toString());
}
    print(   'auth.currentUser?.displayName.toString()');
    return userModel;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}