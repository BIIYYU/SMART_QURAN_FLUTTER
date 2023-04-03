import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_apps/globals.dart';
import 'package:quran_apps/tabs/hijb_tab.dart';
import 'package:quran_apps/tabs/page_tab.dart';
import 'package:quran_apps/tabs/para_tab.dart';
import 'package:quran_apps/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: _appBar(),
        bottomNavigationBar: _bottomNavigationBar(),
        body: DefaultTabController(
          length: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _greeting(),
                      ),
                      SliverAppBar(
                          pinned: true,
                          automaticallyImplyLeading: false,
                          elevation: 0,
                          backgroundColor: background,
                          shape: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color:
                                      const Color(0xFFAAAAAA).withOpacity(.1))),
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(0),
                            child: _tab(),
                          ))
                    ],
                body: const TabBarView(
                  children: [surah_tab(), para_tab(), page_tab(), hijb_tab()],
                )),
          ),
        ));
  }

  TabBar _tab() {
    return TabBar(
      unselectedLabelColor: Color.fromARGB(115, 164, 164, 164),
      labelColor: Colors.white,
      indicatorColor: primary,
      indicatorWeight: 3,
      tabs: [
        _tabItem(label: "Surah"),
        _tabItem(label: "Para"),
        _tabItem(label: "Page"),
        _tabItem(label: "Hijb"),
      ],
    );
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Assalamualaikum",
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 190, 190, 190)),
        ),
        const SizedBox(height: 4),
        Text(
          "Abiyyu Aqil",
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        const SizedBox(height: 24),
        _lastRead(),
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 254, 180, 247),
                Color.fromARGB(255, 245, 120, 233),
                Color.fromARGB(255, 223, 97, 210)
              ])),
        ),
        Positioned(
          bottom: -50,
          right: -120,
          child: SvgPicture.asset('assets/svgs/splash.svg'),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Terakhir Membaca",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Al-Faatihah",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Ayat No: 1",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/menu.svg')),
          const SizedBox(
            width: 24,
          ),
          Text(
            "Smart Qur'an",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svgs/search.svg')),
        ],
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: navigation,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _bottomBarItem(icon: "assets/svgs/quran.svg", label: "Quran"),
        _bottomBarItem(icon: "assets/svgs/lampu.svg", label: "Tips"),
        _bottomBarItem(icon: "assets/svgs/sembahyang.svg", label: "Prayer"),
        _bottomBarItem(icon: "assets/svgs/search.svg", label: "Doa"),
        _bottomBarItem(icon: "assets/svgs/menu.svg", label: "Menu"),
      ],
    );
  }

  BottomNavigationBarItem _bottomBarItem(
      {required String icon, required String label}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          color: Colors.white,
        ),
        activeIcon: SvgPicture.asset(
          icon,
          color: primary,
        ),
        label: label);
  }
}
