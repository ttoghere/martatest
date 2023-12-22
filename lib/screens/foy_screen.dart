import 'package:flutter/material.dart';

class FoySayfasi extends StatefulWidget {
  static const routeName = "/foy";
  const FoySayfasi({super.key});

  @override
  State<FoySayfasi> createState() => _FoySayfasiState();
}

class _FoySayfasiState extends State<FoySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        const Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Text(
                            "Gün Sonu",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFEAEBEC),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          width: double.infinity,
                          height: 59,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 0.5,
                              color: const Color(0xFFEAEBEC),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Tutar",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFA0AEC0),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Image.asset("assets/edit_symbol.png"),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Tutar Giriniz",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFFBDC1C8),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Genel Toplam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5850EC),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "123.213.123.123\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFEAEBEC),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Gün Sonu",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 160,
                                height: 59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Tutar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFA0AEC0),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Image.asset("assets/edit_symbol.png"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: "Tutar Giriniz",
                                          hintStyle: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFFBDC1C8),
                                            fontWeight: FontWeight.w400,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFEAEBEC),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Genel Toplam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5850EC),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "123.213.123.123\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Genel Toplam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5850EC),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "123.213.123.123\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Tutar Giriniz",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFBDC1C8),
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Genel Toplam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF5850EC),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "123.213.123.123\$",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
                Positioned(
                  left: 60,
                  bottom: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF5850EC),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Gün Sonu Kapat",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Vazgeç",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF2D3748),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
