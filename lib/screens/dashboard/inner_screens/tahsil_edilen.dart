import 'package:flutter/material.dart';
import 'package:martatest/controllers/controllers.dart';
import 'package:provider/provider.dart';

class TahsilEdilen extends StatelessWidget {
  const TahsilEdilen({
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
        Positioned(
          bottom: 50,
          left: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            width: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF5850EC),
            ),
            child: const Text(
              "Tahsilatlar",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 30,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            width: 138,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF5850EC),
            ),
            child: const Text(
              "Gün Sonu Hesapla",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
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

        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('Customer: ${invoice['customer_title']}'),
            subtitle: Text('Amount: ${invoice['net_amount']}'),
            onTap: () {
              showDialog(
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
            },
          ),
        );
      },
    );
  }
}
