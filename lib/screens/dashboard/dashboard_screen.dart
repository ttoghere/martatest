// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:martatest/controllers/controllers.dart';
import 'package:martatest/controllers/profile_provider.dart';

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
          toolbarHeight: 100,
          bottom: TabBar(
            labelColor: const Color(
              0xFFEDEDED,
            ),
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
                            height: 16,
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
                                      color: Color(0xFFEDEDED),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
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
        body: TabBarView(
          controller: tabController,
          children: [
            const TahsilEdilen(),
            TahsilEdilecek(bottomSheet: () => _openBottomSheet()),
            Giderler(
              bottomSheet: () => _openBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}

class TahsilEdilecek extends StatelessWidget {
  final VoidCallback bottomSheet;
  const TahsilEdilecek({
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
            onPressed: bottomSheet,
            icon: const Icon(
              Icons.add,
              size: 25,
            ),
          ),
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
