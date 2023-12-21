import 'package:flutter/material.dart';

class ErkenTahsil extends StatelessWidget {
  final VoidCallback bottomSheet;
  const ErkenTahsil({
    Key? key,
    required this.bottomSheet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Column(
          children: [],
        ),
        Positioned(
          right: 30,
          bottom: 110,
          child: IconButton(
            padding: const EdgeInsets.all(15),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF5850EC),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  width: 344,
                  height: 338,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 18, left: 25),
                          height: 45,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gider",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF2D3748),
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Nakit - Temel Gider
                                Container(
                                  width: 294,
                                  height: 59,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 0.5,
                                      color: const Color(0xFFEAEBEC),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Müşteri Bilgisi",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFFA0AEC0),
                                                fontWeight: FontWeight.w700),
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
                                              hintText: "Müşteri Bilgisi",
                                              hintStyle: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFBDC1C8),
                                                  fontWeight: FontWeight.w400),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                //Tutar
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      width: 131,
                                      height: 59,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xFFEAEBEC),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Fatura No",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFFA0AEC0),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Image.asset(
                                                  "assets/edit_symbol.png"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                  hintText: "Fatura No",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFBDC1C8),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: 131,
                                      height: 59,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 0.5,
                                          color: const Color(0xFFEAEBEC),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Fatura Tutarı",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFFA0AEC0),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Image.asset(
                                                  "assets/edit_symbol.png"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                  hintText: "Fatura Tutarı",
                                                  hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFBDC1C8),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                //Açıklama
                                const SizedBox(
                                  height: 14,
                                ),
                                SingleChildScrollView(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 131,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            width: 0.5,
                                            color: const Color(0xFFEAEBEC),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Ödenen Tutar",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFA0AEC0),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Image.asset(
                                                    "assets/edit_symbol.png"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    decoration:
                                                        const InputDecoration(
                                                            hintText:
                                                                "Ödenen Tutar",
                                                            hintStyle: TextStyle(
                                                                fontSize: 12,
                                                                color: Color(
                                                                    0xFFBDC1C8),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                            border: InputBorder
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF5850EC),
                                  ),
                                  child: const Text(
                                    "Kaydet",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }
}
