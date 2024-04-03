abstract class FireAuth {
  static String exceptionMessage(String errorCode) {
    switch (errorCode) {
      case "session-expired":
        return "The SMS code has expired. Please re-send the verification code to try again.";
      case "network-request-failed":
        return "Network request failed, Please check your internet.";

      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Invalid password combination, try again.";

      case "invalid-credential":
        return "Invalid email or password, try again.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "too-many-requests":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      case "invalid-verification-code":
        return "Invalid OTP, please try again";

      default:
        return "Something went wrong. Please try again.";
    }
  }
}
