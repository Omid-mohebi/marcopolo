import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../AppGetDialog.dart';

class FirebaseAuthExceptionHandler {
  static handle(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-verification-code":
        {
          AppGetDialog.show(middleText: "Invalid OTP CODE");
          break;
        }
      case "too-many-requests":
        {
          AppGetDialog.show(middleText: "too_manay_sms_auth_request");
          break;
        }
      default:
        {
          AppGetDialog.show(middleText: e.code + ": " + e.message);
        }
    }
  }

  static handleFacebookAuthException(FacebookAuthException e) {
    switch (e.errorCode) {
      case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
        AppGetDialog.show(
            middleText: "You have a previous login operation in progress");
        break;
      case FacebookAuthErrorCode.CANCELLED:
        AppGetDialog.show(middleText: "login cancelled");
        break;
      case FacebookAuthErrorCode.FAILED:
        AppGetDialog.show(middleText: "login failed");
        break;
      default:
        AppGetDialog.show(middleText: e.errorCode + ": " + e.message);
    }
  }
}
