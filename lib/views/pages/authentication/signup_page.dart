part of '_authentication.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isHidden = true;
  bool _isHidden2 = true;
  String _verticalGroupValue = 'Bunda';
  final List<String> _roles = ['Bunda', 'Faskes', 'Admin'];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.merahMuda,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: width,
          height: height,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: height / 15),
          padding: EdgeInsets.symmetric(vertical: height / 18, horizontal: 20),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(40))),
          child: Column(
            children: [
              const Text(
                'HalowBund!',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.merahTua,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Create an account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Sign up now to get started with an account',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(
                height: 70,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Username',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                    // _namaLengkap = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // _namaLengkap = value!;
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
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                    // _namaLengkap = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // _namaLengkap = value!;
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
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
                        () => _isHidden2 = !_isHidden2,
                      ),
                    },
                    child: Icon(
                      Icons.remove_red_eye_outlined,
                      color: _isHidden2 ? Colors.grey : AppColors.merahTua,
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
                obscureText: _isHidden2,
                onChanged: (String? value) {
                  setState(() {
                    // _namaLengkap = value!;
                  });
                },
                onSaved: (String? value) {
                  setState(() {
                    // _namaLengkap = value!;
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
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Role',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              RadioGroup<String>.builder(
                direction: Axis.horizontal,
                horizontalAlignment: MainAxisAlignment.spaceBetween,
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value!;
                }),
                items: _roles,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                  textPosition: RadioButtonTextPosition.left,
                ),
                fillColor: AppColors.merahTua,
                textStyle: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.merahTua,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.login,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          color: AppColors.merahMuda,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
