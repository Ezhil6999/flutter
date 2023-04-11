import 'package:amazon_clone_firebase/resourse/cloudfirestore_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethod {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();
  Future<String> signupUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something wents Wrong.. ";
    if (name != "" && address != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        await cloudFirestoreClass.uploadNameAndAddressToDatabase(
            name: name, address: address);

        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up the field..";
    }
    return output;
  }

  Future<String> signinUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something wents Wrong.. ";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up the field..";
    }
    return output;
  }
}
