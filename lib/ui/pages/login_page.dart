import 'package:flutter/material.dart';
import 'package:life_hub/ui/widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
final passwordRepeatController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  bool _showPassword =
      false; //buildde çalışırsa her buildde çalışır ve false olur ? dead code
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_image.png',
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _isLogin ? "Giriş Yap" : "Üye Ol",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: "E-Posta",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: MyTextField(
                  controller: passwordController,
                  obscureText: _showPassword,
                  hintText: "Şifre",
                  suffixIcon: _isLogin
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: _showPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        )
                      : null,
                ),
              ),
              if (!_isLogin)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    controller: passwordRepeatController,
                    obscureText: _showPassword,
                    hintText: "Şifreyi Doğrulayın",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: _showPassword
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(_isLogin ? "Giriş Yap" : "Kayıt Ol"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        _isLogin
                            ? "Üye olmak için tıklayınız"
                            : "Zaten üye misiniz?",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
