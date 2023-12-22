// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:martatest/controllers/controllers.dart';
import './inner_screens/inner_screens.dart';

class DashboardMobilScreen extends StatefulWidget {
  static const routeName = "/dashmobil";
  const DashboardMobilScreen({super.key});

  @override
  State<DashboardMobilScreen> createState() => _DashboardMobilScreenState();
}

class _DashboardMobilScreenState extends State<DashboardMobilScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  // Alt sayfanın açılıp kapanmasını kontrol etmek için bir GlobalKey kullanılır.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openBottomSheet() {
    // Alt sayfayı açar.
    _scaffoldKey.currentState!.showBottomSheet(
      (BuildContext context) {
        return Container(
          // Alt sayfanın içeriği buraya gelir.
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Alt Sayfa İçeriği'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Alt sayfayı kapatır.
                  Navigator.pop(context);
                },
                child: const Text('Alt Sayfayı Kapat'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          leading: const SizedBox.shrink(),
          toolbarHeight: 140,
          backgroundColor: const Color(0xFF5850EC),
          flexibleSpace: FutureBuilder<Map<String, dynamic>>(
            future: context.read<ProfileProvider>().getUserProfileInfo(),
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
                final Map<String, dynamic> userProfileInfo =
                    snapshot.data!['data'];

                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Image.asset(
                                  "assets/ic_toggle.png",
                                  height: 15,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            userProfileInfo["user_id"]
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          const Text(
                                            "-",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            userProfileInfo["user_title"],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "User",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const Text(
                                            "-",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            userProfileInfo["user_type"]
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Genel Toplam",
                                    style: TextStyle(
                                      color: Color(0xFFEDEDED),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Havale",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Erken Tahsilat",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Genel Toplam",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Havale",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Erken Tahsilat",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        body: Column(
          children: [
            Container(
              color: const Color(0xFF5850EC),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.white,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Color(0xFFEDEDED),
                ),
                unselectedLabelColor: const Color(0xFFEEEEEE),
                controller: tabController,
                indicatorWeight: 4,
                tabs: const [
                  Tab(
                    text: "Tahsil Edilecek",
                  ),
                  Tab(
                    text: "Erken Tahsilat",
                  ),
                  Tab(
                    text: "Gider",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    controller: tabController,
                    children: [
                      const TahsilEdilecek(),
                      ErkenTahsil(bottomSheet: () => _openBottomSheet()),
                      const Giderler(),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 30,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          context: context,
                          isDismissible: false,
                          builder: (context) => FutureBuilder(
                            future:
                                context.read<InvoiceProvider>().getInvoices(1),
                            builder: (context, snapshot) {
                              var vadesiGelen = 0.0;
                              var tahsilEdilen = 0.0;
                              var otelenen = 0.0;
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else {
                                List<Map<String, dynamic>> invoices =
                                    snapshot.data!;
                                for (var v in invoices) {
                                  vadesiGelen += v["net_amount"];
                                }
                                for (var v in invoices) {
                                  otelenen += v["outstanding_amount"];
                                }
                                for (var v in invoices) {
                                  tahsilEdilen += v["bank_act_amount"];
                                }

                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 23),
                                  height: 250,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const SizedBox.shrink(),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6),
                                            child: Text(
                                              "Tahsilatlar",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xFF2D3748)),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Color(0xFFEAEBEC),
                                      ),
                                      Row(
                                        children: [
                                          const Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                              ),
                                              Text(
                                                "Vadesi Gelen",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xFF5850EC,
                                                  ),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Tahsil Edilen",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xFF5850EC,
                                                  ),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Ötelenen",
                                                style: TextStyle(
                                                  color: Color(
                                                    0xFF5850EC,
                                                  ),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 35,
                                              ),
                                              Text(
                                                vadesiGelen.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                tahsilEdilen.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                otelenen.toStringAsFixed(2),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 4),
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
                  ),
                  Positioned(
                    bottom: 10,
                    right: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 4),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
