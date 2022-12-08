part of '_authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;
  final _loginFormKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: AppColors.merahMuda,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            padding:
                EdgeInsets.symmetric(vertical: height / 18, horizontal: 20),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Form(
              key: _loginFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'HalowBund!',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.merahTua,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Log in to your account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Welcome back and enter your details',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500,),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter username here',
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.merahTua,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Username can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500,),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () => {
                            setState(
                              () => _isHidden = !_isHidden,
                            ),
                          },
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: _isHidden ? Colors.grey : AppColors.merahTua,
                          ),
                        ),
                        hintText: 'Enter password here',
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.merahTua,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      obscureText: _isHidden,
                      onChanged: (String? value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: width,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            login(request, username, password, context, mounted);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.merahTua,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesName.signup,
                              (route) => false,
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.merahMuda,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
