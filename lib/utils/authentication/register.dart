part of '_authentication.dart';

void register(request, String username, String password1, String password2, String role, context, mounted) async {
  // 'username' and 'password' should be the values of the user login form.
  final response =
      await request.post('https://halowbund.up.railway.app/account/signup-flutter/', {
    'username': username,
    'password1': password1,
    'password2': password2,
    'role_user': role,
  });
  if (response['status'] == true) {
    // Code here will run if the login succeeded.
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.login,
      (route) => false,
    );
  } else {
    // Code here will run if the login failed (wrong username/password).
    showTopFlash(response['message'], context);
  }
}
