import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:marcopolo/app/modules/profile/controllers/profile_controller.dart';
import 'package:marcopolo/app/modules/profileSetting/controllers/profile_setting_controller.dart';
// import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'AppGetDialog.dart';
import 'exception_handler/FirebaseAuthExceptionHandler.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  void Function(PhoneAuthCredential phoneAuthCredential) verfiedCallBack;
  void Function(String verficationID, int resendToken) smsSentCallBack;
  void Function(FirebaseAuthException e) verificationFaildCallBck;
  void Function(Exception e) authExciptionCallBck;

  var waitingForFirebaseSmsSend = false.obs;
  var waitingForFirebaseotpToVerify = false.obs;
  var smsSent = false.obs;
  String verificationCode;
  int resendToken;
  //hive
  // var userBox = Get.find<Box<dynamic>>(tag: "user_box");

  @override
  void onInit() {
    // firebaseAuth.setLanguageCode("en_US");

    super.onInit();
  }

  @override
  void onReady() async {
    //run every time auth state changes

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Firebase user one-time fetch
  User get getUser => firebaseAuth.currentUser;

  // Firebase user a realtime stream
  // Stream<User> get user => _auth.authStateChanges();

  // User registration using phone

  Future<void> signInWithGoogle({bool forceShowAllAccounts = false}) async {
    EasyLoading.show();
    var isSiginedToGoogle = await GoogleSignIn().isSignedIn();
    if (isSiginedToGoogle) {
      await GoogleSignIn().disconnect();
    }

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser =
        await GoogleSignIn().signIn().whenComplete(() {
      print("blaaaaaaaaa");
    }).catchError((e) {
      print("Error 0xFF000000"); //network error perhabs
      EasyLoading.dismiss();
      AppGetDialog.show(
          middleText:
              "Something unexpected happend, check your internet connection and retry.\nError 0xFF000000");
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;

    if (googleAuth == null) {
      EasyLoading.dismiss();
      return;
    }
    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await firebaseAuth.signInWithCredential(credential).then((uc) {
      EasyLoading.dismiss();
      //!
      // Get.offAllNamed(Routes.afterLoggedIn);
      Get.find<ProfileSettingController>().nameAsign();

      Get.find<ProfileController>().pageController.animateToPage(2,
          duration: Duration(milliseconds: 1), curve: Curves.ease);
      print("USER ${uc.user.toString()}");
      uc.user.getIdToken().then((value) {
        // print("len: ${value.length},");

        // print("token: ${value.substring(700)},");
        // print("token: ${value.substring(0, 700)},");
        log("Log, $value");
      });
    }).catchError((e) {
      print("e3");
      EasyLoading.dismiss();
      AppGetDialog.show(
          middleText:
              "Something unExpected happend, sorry for that.\nError 0xFF000001");
    });
  }

  Future<void> signInWithFacebook() async {
    EasyLoading.show();
    await signOut();
    await FacebookAuth.instance.logOut();
    try {
      // Trigger the sign-in flow
      final AccessToken result = await FacebookAuth.instance.login();
      print('ggggggggggggggggggggggggggggggggggggggggggggg');
      // Create a credential from the access token
      final FacebookAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((uc) async {
        EasyLoading.dismiss();
        //!
        Get.find<ProfileSettingController>().nameAsign();
        Get.find<ProfileController>().pageController.animateToPage(2,
            duration: Duration(milliseconds: 1), curve: Curves.ease);
        // Get.offAllNamed(Routes.afterLoggedIn);
        print("USER ${uc.user.toString()}");
        uc.user.getIdToken(true).then((value) {
          // print("len: ${value.length},");

          // print("token: ${value.substring(700)},");
          // print("token: ${value.substring(0, 700)},");
          log("Log, $value");
        });
      });
    } on FacebookAuthException catch (e) {
      EasyLoading.dismiss();
      FirebaseAuthExceptionHandler.handleFacebookAuthException(e);
      Logger().e(e.message, "fb error.");
    } catch (e) {
      EasyLoading.dismiss();
      AppGetDialog.show(middleText: "Unknown login error");
      Logger().e(e.message, "unknown facebook error.");
    }
  }

  // Sign out
  Future<void> signOut() async {
    EasyLoading.show();
    // await GetStorage().erase();
    // await Get.find<Box<dynamic>>(tag: "cart_box").clear();
    // await Get.find<Box<dynamic>>(tag: "user_box").clear();
    await firebaseAuth.signOut();
    // Utils.whereShouldIGo();
  }

  //user signined to firebase
  Future<bool> isUserSignedInedToFirebase() async {
    Logger().i("user-signed-in-to-firebase", await getUser != null);
    // print(FirebaseAuth.instance.currentUser.photoURL);

    return await to.getUser != null;
  }

  //sign in to firebase
  signinToFirebaseWithSmsCode(
      {@required String smsCode, String verificationCode}) async {
    assert(verificationCode != null || this.verificationCode != null);
    waitingForFirebaseotpToVerify(true);
    try {
      await firebaseAuth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode == null
                  ? this.verificationCode
                  : verificationCode,
              smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          waitingForFirebaseotpToVerify(false);
          // Get.snackbar('Done', 'verfyied by sms. User id: ${value.user.uid}');
          // Get.offAllNamed(Routes.SPLASH);
          // Get.reset();
          // Utils.restartApp();
//!
          // Get.offAllNamed(Routes.INTRO);
          // GetStorage().write("firebase_auth_complete", true);

          // AppGetDialog.show(middleText: "verfied");

        }
      });
    } catch (e) {
      waitingForFirebaseotpToVerify(false);
      if (e is FirebaseAuthException) {
        FirebaseAuthExceptionHandler.handle(e);
        return;
      }
      Get.snackbar('No', e.runtimeType.toString() + " " + e.message);
    }
  }

  String getUserPhoneNumber({NUMBER_TYPE numberType}) {
    User user = getUser;
    assert(user != null);

    return numberType == NUMBER_TYPE.INTERNATIONAL
        ? user.phoneNumber
        : "0" + user.phoneNumber.substring(3, 12);
  }

  // Future<void> saveUserToken(String token) async {
  //   await GetStorage().write("UerToken", token).catchError((e) {
  //     Logger().d("Get-storage-write-error", e.message);
  //   });
  // }

  // Future<void> saveUserId(String id) async {
  //   await GetStorage().write("UserId", id).catchError((e) {
  //     Logger().d("Get-storage-write-error", e.message);
  //   });
  // }

  // Future<String> getUserToken() async {
  //   return await GetStorage().read("UerToken");
  // }

  // getUserId() async {
  //   return GetStorage().read("UserId");
  // }

  // Future<void> setProfileCompleted(bool val) async {
  //   await GetStorage().write("ProfileComplete", val).catchError((e) {
  //     Logger().d("Get-storage-write-error", e.message);
  //   });
  // }

  // Future<bool> isProfileComplete() async {
  //   return await GetStorage().read("ProfileComplete") == true;
  // }

  // //hive user

  // UserDetailsApi getHiveUserDetails() {
  //   var boxMap = userBox.toMap();
  //   // Logger().d(boxMap, "user_box");
  //   var result =
  //       UserDetailsApi.fromJson(Map<String, dynamic>.from(boxMap["data"]));
  //   // Logger().d(result.toJson(), "test_user_box_result");
  //   return result;
  // }

  // void updateUserDetails(UserDetailsApi responseModel) {
  //   userBox.put("data", responseModel.toJson());
  //   getHiveUserDetails();
  // }

  // Future<void> setCity(Datum city) async {
  //   if (city == null)
  //     await GetStorage().remove("city");
  //   else
  //     await GetStorage().write("city", city.toJson());
  //   Logger().d(city.toJson(), "city_changed");
  // }

  // Datum getCity() {
  //   // Logger().d(GetStorage().read("city"), "requested_for_city");
  //   return GetStorage().read("city") != null
  //       ? Datum.fromJson(GetStorage().read("city"))
  //       : null;
  // }

  // void setAppLanguge(String l) async {
  //   await GetStorage().write("languge", l);
  // }

  // String getAppLanguge() {
  //   return GetStorage().read("languge");
  // }
}

enum NUMBER_TYPE { LOCAL, INTERNATIONAL }
