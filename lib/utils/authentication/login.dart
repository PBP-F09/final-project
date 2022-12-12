part of '_authentication.dart';

void login(request, String username, String password, BuildContext context,
    mounted,) async {
  // 'username' and 'password' should be the values of the user login form.
  final response =
      await request.login('http://10.0.2.2:8000/account/login-flutter/', {
    'username': username,
    'password': password,
  });
  if (!mounted) return;
  if (request.loggedIn) {
    // Code here will run if the login succeeded.
    request.jsonData = response['data'];
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesName.home,
      (route) => false,
    );
  } else {
    // Code here will run if the login failed (wrong username/password).
    showTopFlash(response['message'], context);
  }
}
