import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _UserLoginState extends State<UserLogin> {
  bool _isObscure = true;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          constraints: const BoxConstraints(maxWidth: 315),
          padding: const EdgeInsets.all(16),
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Hey, Welcome Back',
                      style: TextStyle(
                        color: Color(0xFF373737),
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Image.asset('assets/images/image 619.png'),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Row(
                children: [
                  Text(
                    'Don’t have an account?',
                    style: TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    ' Sign Up',
                    style: TextStyle(
                      color: Color(0xFF5801B7),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 28,
              ),
              const Text(
                'Email / Phone',
                style: TextStyle(
                  color: Color(0xFF7A7A7A),
                  fontSize: 14.36,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 53,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Enter email or phone',
                    hintStyle: const TextStyle(
                      color: Color(0xFF606060),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Password',
                style: TextStyle(
                  color: Color(0xFF7A7A7A),
                  fontSize: 14.36,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 53,
                child:
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    isDense: true,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: Color(0xFF606060),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF5801B7),
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 271.36,
                    height: 64,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5801B7),
                      borderRadius: BorderRadius.circular(10.28),
                    ),
                    child: const Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.04,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// async {
//   AuthRepository authRepository = AuthRepository();
//   List<String> res = await authRepository.login(
//       emailController.text, passwordController.text);
//   if (res[0] == "Admin") {
//     UserPreferences.setIsAdmin(true);
//     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AdminData()));
//
//   } else {
//     UserPreferences.setIsAdmin(false);
//     UserPreferences.setUserId(res[1]);
//
//     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyForm()));
//
//
//   }
// },
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserHomePage()));
// },
