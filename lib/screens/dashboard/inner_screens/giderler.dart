import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class Giderler extends StatefulWidget {
  final VoidCallback bottomSheet;
  const Giderler({
    Key? key,
    required this.bottomSheet,
  }) : super(key: key);

  @override
  State<Giderler> createState() => _GiderlerState();
}

class _GiderlerState extends State<Giderler> {
  bool change1 = true;
  bool change2 = false;
  void colorChange() {
    setState(() {
      if (change1 = true) {
        change1 = false;
        change2 = true;
      } else {
        change1 = false;
        change2 = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<dynamic>>(
          future: context.read<ExpensesProvider>().getExpenses(12),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<dynamic> expenses = snapshot.data ?? [];

              return ExpenseListWidget(expenses);
            }
          },
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Gider Türü",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFA0AEC0),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              change1 = true;
                                              change2 = false;
                                            });
                                          },
                                          child: Container(
                                            width: 112,
                                            height: 23,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                width: 1,
                                                color: change1
                                                    ? const Color(0xFF5850EC)
                                                    : const Color(0xFF2D3748),
                                              ),
                                            ),
                                            child: Text(
                                              "Kasaya Alınan",
                                              style: change1
                                                  ? const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xFF5850EC),
                                                    )
                                                  : const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xFF2D3748),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              change1 = false;
                                              change2 = true;
                                            });
                                          },
                                          child: Container(
                                            width: 112,
                                            height: 23,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              border: Border.all(
                                                width: 1,
                                                color: change2
                                                    ? const Color(0xFF5850EC)
                                                    : const Color(0xFF2D3748),
                                              ),
                                            ),
                                            child: Text(
                                              "Nakit",
                                              style: change2
                                                  ? const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xFF5850EC),
                                                    )
                                                  : const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xFF2D3748),
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              //Tutar
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
                                            hintText: "Tutar Giriniz",
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
                              //Açıklama
                              const SizedBox(
                                height: 14,
                              ),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Açıklama",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFA0AEC0),
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Açıklama Giriniz",
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
                                height: 5,
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

class ExpenseListWidget extends StatelessWidget {
  final List<dynamic> expenses;

  const ExpenseListWidget(this.expenses, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        var expense = expenses[index];
        return ListTile(
          title: Text(expense['description']),
        );
      },
    );
  }
}
