import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/user.dart';

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

      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // handle the error hered
        }
        else if (e.code == 'invalid-credential') {
          // handle the error here
        }
      } catch (e) {
        // handle the error here
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
    print(   'auth.currentUser?.displayName.toString()'
    );
    return userModel;
  }

  Future out() async {
    auth.signOut();
  }
}