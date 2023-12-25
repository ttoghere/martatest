import 'dart:async';

import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Giderler extends StatefulWidget {
  const Giderler({Key? key}) : super(key: key);

  @override
  _GiderlerState createState() => _GiderlerState();
}

class _GiderlerState extends State<Giderler> {
  bool change1 = true;
  bool change2 = false;
  TextEditingController _aciklamaEditingController = TextEditingController();
  TextEditingController _tutarEditingController = TextEditingController();
  int typeOf = 1;
  late Timer _timer;
  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // Her 5 saniyede bir çağrılacak fonksiyon
      context.read<ExpensesProvider>().fetchExpenses();
    });
  }

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel(); // Timer'ı temizle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Expenses(),
        Positioned(
          right: 30,
          bottom: 110,
          child: IconButton(
            style: IconButton.styleFrom(backgroundColor: Colors.red),
            padding: const EdgeInsets.all(15),
            onPressed: () {
              _ekleme(context);
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

  Future<dynamic> _ekleme(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Gider"),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    change1 = true;
                                    change2 = false;
                                    typeOf = 1;
                                  });
                                },
                                child: Container(
                                  width: 112,
                                  height: 23,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                      width: 1,
                                      color: change1
                                          ? const Color(0xFF5850EC)
                                          : const Color(0xFF2D3748),
                                    ),
                                  ),
                                  child: Text(
                                    "Kasaya Alınan",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: change1
                                          ? const Color(0xFF5850EC)
                                          : const Color(0xFF2D3748),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    change1 = false;
                                    change2 = true;
                                    typeOf = 2;
                                  });
                                },
                                child: Container(
                                  width: 112,
                                  height: 23,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                      width: 1,
                                      color: change2
                                          ? const Color(0xFF5850EC)
                                          : const Color(0xFF2D3748),
                                    ),
                                  ),
                                  child: Text(
                                    "Temel Gider",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: change2
                                          ? const Color(0xFF5850EC)
                                          : const Color(0xFF2D3748),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              controller: _tutarEditingController,
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
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _aciklamaEditingController,
                              decoration: const InputDecoration(
                                hintText: "Açıklama Giriniz",
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
                      height: 5,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<ExpensesProvider>()
                            .addExpenseToFirestore(
                                amount: _tutarEditingController.text,
                                description: _aciklamaEditingController.text,
                                typeOf: typeOf);
                        await context
                            .read<ExpensesProvider>()
                            .fetchExpenses()
                            .whenComplete(() => Navigator.of(context).pop());
                      },
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
            );
          },
        ),
      ),
    );
  }
}

class Expenses extends StatelessWidget {
  const Expenses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: context.read<ExpensesProvider>().fetchExpenses(),
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
    );
  }
}

class ExpenseListWidget extends StatefulWidget {
  final List<dynamic> expenses;

  ExpenseListWidget(this.expenses, {super.key});

  @override
  State<ExpenseListWidget> createState() => _ExpenseListWidgetState();
}

class _ExpenseListWidgetState extends State<ExpenseListWidget> {
  bool change1 = true;

  bool change2 = false;

  int typeOf = 1;
  TextEditingController gTutarController = TextEditingController();
  TextEditingController gAciklamaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expenses.length,
      itemBuilder: (context, index) {
        var expense = widget.expenses[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                        "Seçtiğiniz Ögenin Silinmesini İstiyor Musunuz ?"),
                    content: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ExpensesProvider>()
                                .deleteExpense(expense["id"])
                                .whenComplete(() async {
                              await context
                                  .read<ExpensesProvider>()
                                  .fetchExpenses();
                              Navigator.of(context).pop();
                            });
                          },
                          child: const Text("Evet"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Hayır"),
                        ),
                      ],
                    ),
                  ),
                );
              },
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Gider"),
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return SizedBox(
                          width: double.maxFinite,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                      const Text(
                                        "Gider Türü",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFA0AEC0),
                                          fontWeight: FontWeight.w700,
                                        ),
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
                                                typeOf = 1;
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
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: change1
                                                      ? const Color(0xFF5850EC)
                                                      : const Color(0xFF2D3748),
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                change1 = false;
                                                change2 = true;
                                                typeOf = 2;
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
                                                "Temel Gider",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: change2
                                                      ? const Color(0xFF5850EC)
                                                      : const Color(0xFF2D3748),
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
                                          initialValue:
                                              expense["amount"].toString(),
                                          onChanged: (value) {
                                            setState(() {
                                              expense["amount"] =
                                                  int.parse(value);
                                            });
                                          },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Açıklama",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFA0AEC0),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          onChanged: (value) {
                                            setState(() {
                                              expense["description"] = value;
                                            });
                                          },
                                          initialValue: expense["description"],
                                          decoration: const InputDecoration(
                                            hintText: "Açıklama Giriniz",
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
                                  height: 5,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    if (expense["amount"] != null &&
                                        expense["description"] != null &&
                                        expense["typeOf"] != null) {
                                      await context
                                          .read<ExpensesProvider>()
                                          .updateExpense(
                                            expenseId: expense["id"],
                                            newAmount: expense["amount"],
                                            newDescription:
                                                expense["description"],
                                            newTypeOf: expense["typeOf"],
                                          )
                                          .whenComplete(() =>
                                              Navigator.of(context).pop());
                                    } else {
                                      // Gerekli değerlerden biri veya daha fazlası null ise bir hata işle
                                      print("Hata: Gerekli değerler null.");
                                    }
                                  },
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
                        );
                      },
                    ),
                  ),
                );
              },
              title: Text(
                expense['description'],
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2D3748),
                ),
              ),
              subtitle: Text(
                index % 2 == 0 ? "Temel Gider" : "Kasaya Alınan",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA0AEC0),
                ),
              ),
              trailing: Text(
                "${expense["amount"]} \$",
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }
}
