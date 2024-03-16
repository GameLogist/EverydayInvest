class SignUpEmailAndPasswordFailure {
  final String message;

  const SignUpEmailAndPasswordFailure(
      [this.message = "An unknown error occured"]);

  factory SignUpEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return SignUpEmailAndPasswordFailure(
            'Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return SignUpEmailAndPasswordFailure(
            'An account already exists for that email.');
      case 'operation-not-allowed':
        return SignUpEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return SignUpEmailAndPasswordFailure(
            'This user has been diabled. Please contact support for help.');
      case 'user-not-found':
        return SignUpEmailAndPasswordFailure(
            'User not found. Are you sure you have created an account with this email?');
      case 'wrong-password':
        return SignUpEmailAndPasswordFailure('Wrong password. Try again.');
      default:
        return SignUpEmailAndPasswordFailure();
    }
  }
}
