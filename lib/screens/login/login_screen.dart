// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:martatest/screens/screens.dart';
import 'package:provider/provider.dart';

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
      body: pageBody(ratio, loginProvider, context),
    );
  }

  Column pageBody(
      double ratio, LoginProvider loginProvider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(61.0 * ratio),
            child: SvgPicture.asset("assets/logo.svg"),
          ),
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
              userForm(ratio, loginProvider, context),
            ],
          ),
        ),
      ],
    );
  }

  Form userForm(
      double ratio, LoginProvider loginProvider, BuildContext context) {
    return Form(
      key: loginProvider.formKey,
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
                onTap: () async {
                  bool validation =
                      loginProvider.formKey.currentState!.validate();
                  if (validation) {
                    await loginProvider.loginUser(
                        loginProvider.kAdi!, loginProvider.sifre!);
                    Navigator.of(context)
                        .pushNamed(DashboardMobilScreen.routeName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text("Kullanıcı adı yada Şifre eksik yada yanlış"),
                      ),
                    );
                  }
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
    );
  }
}
