import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class TahsilEdilecek extends StatelessWidget {
  const TahsilEdilecek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: context.read<InvoiceProvider>().getInvoices(1),
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

class InvoiceListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> invoices;

  const InvoiceListWidget(this.invoices, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: invoices.length,
      itemBuilder: (context, index) {
        final invoice = invoices[index];

        Color setColor() {
          if (invoice['net_amount'] > invoice['bank_act_amount'] &&
              invoice['net_amount'] > invoice['outstanding_amount']) {
            return const Color(0xFFFF0000);
          } else if (invoice['bank_act_amount'] == invoice['net_amount'] ||
              invoice['bank_act_amount'] > invoice['outstanding_amount']) {
            return const Color(0xFF1CC600);
          } else {
            return const Color(0xFFFFAF51);
          }
        }

        // return Card(
        //   margin: const EdgeInsets.all(8.0),
        //   child: ListTile(
        // title: Text('Customer: ${invoice['customer_title']}'),
        // subtitle: Text('Amount: ${invoice['net_amount']}'),
        //     onTap: () {
        //       dialog(context, invoice);
        //     },
        //   ),
        // );
        return Padding(
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
                                '${invoice['customer_title']}',
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
                            '${invoice['customer_id']}',
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
                          '${invoice['net_amount']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                        // outstanding_amount
                        //bank_act_amount
                        Text(
                          '${invoice['bank_act_amount']}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1CC600),
                          ),
                        ),
                        Text(
                          '${invoice['outstanding_amount']}',
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
        );
      },
    );
  }

  Future<dynamic> dialog(BuildContext context, Map<String, dynamic> invoice) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer ID: ${invoice['customer_id']}'),
              Text('Due Date: ${invoice['due_date']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
