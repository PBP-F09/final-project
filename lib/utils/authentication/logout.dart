part of '_authentication.dart';

// TODO: BELUM KELAR
void logout(
  request,
  BuildContext context,
) async {
  // 'username' and 'password' should be the values of the user login form.
  final response = await request.get('http://10.0.2.2:8000/account/logout-flutter/');
  print(response);
  print(request.jsonData['username']);
  // if (request.loggedIn) {
  //   // Code here will run if the login succeeded.
  //   request.jsonData = response['data'];
  //   Navigator.pushNamedAndRemoveUntil(
  //     context,
  //     RoutesName.home,
  //     (route) => false,
  //   );
  // } else {
  //   // Code here will run if the login failed (wrong username/password).
  //   showTopFlash(response['message'], context);
  // }
}
