import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class TahsilEdilecek extends StatefulWidget {
  const TahsilEdilecek({
    super.key,
  });

  @override
  State<TahsilEdilecek> createState() => _TahsilEdilecekState();
}

class _TahsilEdilecekState extends State<TahsilEdilecek> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: context.read<InvoiceProvider>().fetchInvoices(),
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
              List<Map<String, dynamic>> invoices = snapshot.data!;

              return InvoiceListWidget(invoices);
            }
          },
        ),
      ],
    );
  }
}

class InvoiceListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> invoices;

  InvoiceListWidget(this.invoices, {super.key});

  @override
  State<InvoiceListWidget> createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _aciklamaController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateController.text =
        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.invoices.length,
      itemBuilder: (context, index) {
        final invoice = widget.invoices[index];
        int netAmount = invoice['netAmount'];
        int outstandingAmount = invoice['outstandingAmount'];

        String netAmountString = netAmount.toStringAsFixed(2);
        String outstandingAmountString = outstandingAmount.toStringAsFixed(2);
        String formattedAmount =
            (netAmount - outstandingAmount).toStringAsFixed(2);
        Color setColor() {
          if (netAmount > double.parse(formattedAmount) &&
              netAmount == outstandingAmount) {
            return const Color(0xFFFF0000);
          } else if (double.parse(formattedAmount) == netAmount) {
            return const Color(0xFF1CC600);
          } else if (netAmount - double.parse(formattedAmount) != 0.0) {
            return const Color(0xFFFFAF51);
          }
          return Colors.black;
        }

        return GestureDetector(
          onTap: () => dialog(context, invoice),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 381,
                height: 88,
                color: Colors.white,
                child: Row(
                  children: [
                    //Durum Belirtici

                    Container(
                      height: 91,
                      width: 10,
                      color: setColor(),
                    ),
                    //Bilgi Sütunu
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.5, horizontal: 8.5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: SizedBox(
                              width: 166,
                              height: 41,
                              child: SingleChildScrollView(
                                child: Text(
                                  '${invoice['customerTitle']}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2D3748)),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Text(
                              '${invoice['customerCode']}',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA0AEC0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    // //Finansal Sütun
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.5, horizontal: 8.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$netAmountString\$",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF0000),
                            ),
                          ),
                          Text(
                            "$formattedAmount\$",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1CC600),
                            ),
                          ),
                          Text(
                            '$outstandingAmountString\$',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFFAF51),
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
      },
    );
  }

  Future<dynamic> dialog(BuildContext context, Map<String, dynamic> invoice) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10),
              height: 700,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invoice["customerTitle"],
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                invoice['invoiceCode'],
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    'Ödeme Türü:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          value: 2,
                                          groupValue: context
                                              .read<InvoiceProvider>()
                                              .selectedPaymentOption,
                                          onChanged: (value) {
                                            setState(() {
                                              context
                                                      .read<InvoiceProvider>()
                                                      .selectedPaymentOption =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('Nakit'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: context
                                              .read<InvoiceProvider>()
                                              .selectedPaymentOption,
                                          onChanged: (value) {
                                            setState(() {
                                              context
                                                      .read<InvoiceProvider>()
                                                      .selectedPaymentOption =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('Havale'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                height: 80,
                                width: 136,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Toplam Tutar",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFA0AEC0),
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue:
                                          invoice["netAmount"].toString(),
                                      readOnly: true,
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDC1C8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                height: 80,
                                width: 136,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Ödenen Tutar",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFA0AEC0),
                                      ),
                                    ),
                                    TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      onChanged: (value) {
                                        context
                                            .read<InvoiceProvider>()
                                            .odenenTutar = value;
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Açıklama giriniz..",
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDC1C8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                height: 80,
                                width: 136,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Kalan Tutar",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFA0AEC0),
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: (invoice["netAmount"] -
                                              double.parse(context
                                                  .read<InvoiceProvider>()
                                                  .odenenTutar))
                                          .toString(),
                                      readOnly: true,
                                      style: const TextStyle(fontSize: 14),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDC1C8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                width: 156,
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Öteleme Tarihi',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFA0AEC0),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => _selectDate(context),
                                      child: IgnorePointer(
                                        child: TextField(
                                          controller: _dateController,
                                          onChanged: (value) {
                                            context
                                                .read<InvoiceProvider>()
                                                .otelemeTarihi = value;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(8),
                                          ),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xFFEAEBEC),
                                  ),
                                ),
                                height: 80,
                                width: 294,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Açıklama",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFA0AEC0),
                                      ),
                                    ),
                                    TextFormField(
                                      style: const TextStyle(fontSize: 14),
                                      controller: _aciklamaController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Açıklama giriniz..",
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDC1C8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<InvoiceProvider>()
                                    .payInvoice(
                                      invoiceId: invoice["invoiceId"],
                                      amount: double.parse(context
                                          .read<InvoiceProvider>()
                                          .odenenTutar),
                                      paymentType: context
                                          .read<InvoiceProvider>()
                                          .selectedPaymentOption,
                                      postponementDate: _dateController.text,
                                      description: _aciklamaController.text,
                                    )
                                    .whenComplete(
                                        () => Navigator.of(context).pop());
                              },
                              child: const Text("Kaydet"),
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
        });
  }
}
