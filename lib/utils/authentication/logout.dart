part of '_authentication.dart';

// TODO: BELUM KELAR
void logout(
  request,
) async {
  // 'username' and 'password' should be the values of the user login form.
  await request.logout('https://halowbund.up.railway.app/account/logout-flutter/');
}
