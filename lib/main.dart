// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:martatest/controllers/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Guzel',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF1F5F9),
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF5850EC)),
          useMaterial3: true,
        ),
        home: const LoginScreen(
          adaptiveRatio: 1,
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  final double adaptiveRatio;
  const LoginScreen({
    Key? key,
    required this.adaptiveRatio,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = context.read<LoginProvider>();
    double ratio = widget.adaptiveRatio;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(61.0 * ratio),
            child: SvgPicture.asset("assets/logo.svg"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * ratio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 21 * ratio),
                  child: Text(
                    "Giriş",
                    style: TextStyle(
                      fontSize: 24 * ratio,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 21 * ratio),
                  child: Text(
                    "Giriş bilgilerinizi giriniz (text degiştirilebilir)",
                    style: TextStyle(
                      fontSize: 12 * ratio,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFA0AEC0),
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kullanıcı Adı",
                        style: TextStyle(
                          fontSize: 12 * ratio,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                      SizedBox(
                        height: 5 * ratio,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 14 * ratio),
                        child: TextFormField(
                          controller: loginProvider.kadiController,
                          onChanged: (value) {
                            loginProvider.kAdi = value;
                          },
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Kullanıcı adı giriniz",
                            hintStyle: TextStyle(
                              color: Color(0xFFBDC1C8),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * ratio,
                      ),
                      Text(
                        "Şifre",
                        style: TextStyle(
                          fontSize: 12 * ratio,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D3748),
                        ),
                      ),
                      SizedBox(
                        height: 5 * ratio,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 14 * ratio),
                        child: TextFormField(
                          obscureText: visible ? true : false,
                          controller: loginProvider.sifreController,
                          onChanged: (value) {
                            loginProvider.sifre = value;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Şifre giriniz",
                            hintStyle: const TextStyle(
                              color: Color(0xFFBDC1C8),
                            ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: visible
                                    ? const Color(0xFF999999)
                                    : const Color(0xFF5850EC),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20 * ratio,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Şifremi Unuttum",
                              style: TextStyle(
                                  color: const Color(0xFF5850EC),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12 * ratio),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30 * ratio,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              loginProvider.girisYap();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 168 * ratio,
                              height: 40 * ratio,
                              decoration: BoxDecoration(
                                color: const Color(0xFF5850EC),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "Giriş",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18 * ratio,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
