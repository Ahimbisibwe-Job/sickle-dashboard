import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/login_page.dart';
import 'package:flutter_dashboard/model/menu_modal.dart';
import 'package:flutter_dashboard/pages/home/Make%20Appointment.dart';
import 'package:flutter_dashboard/pages/home/chart.dart';
import 'package:flutter_dashboard/pages/home/home_page.dart';
import 'package:flutter_dashboard/pages/home/make_prescription.dart';
import 'package:flutter_dashboard/pages/home/patients.dart';
import 'package:flutter_dashboard/pages/home/weekly_report.dart';
import 'package:flutter_dashboard/widgets/profile/profile.dart';
import 'package:flutter_svg/svg.dart';

class Menu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Function(int) navigateToPage;
  final Function() signOut;

  const Menu({
    Key? key,
    required this.scaffoldKey,
    required this.navigateToPage,
    required this.signOut,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<MenuModel> menu = [
    MenuModel(icon: 'assets/svg/home.svg', title: "Overview"),
    MenuModel(icon: 'assets/svg/profile.svg', title: "Patients"),
    MenuModel(icon: 'assets/svg/prescription.svg', title: "Make Prescription"),
    MenuModel(icon: 'assets/svg/history.svg', title: "Schedule Appointment"),
    MenuModel(icon: 'assets/svg/chat.svg', title: "ChatRoom"),
    MenuModel(icon: 'assets/svg/report.svg', title: "Weekly Reports"),
    MenuModel(icon: 'assets/svg/setting.svg', title: "Settings"),
    MenuModel(icon: 'assets/svg/signout.svg', title: "Signout"),
  ];

  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color.fromARGB(255, 212, 212, 212),
            width: 1,
          ),
        ),
        color: Color(0xFF940F0F),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Text(
                'SCDM System',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              for (var i = 0; i < menu.length; i++)
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                    color: selected == i
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selected = i;
                      });
                      widget.scaffoldKey.currentState!.openEndDrawer();
                      widget.navigateToPage(i);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 7,
                          ),
                          child: SvgPicture.asset(
                            menu[i].icon,
                            color: selected == i ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          menu[i].title,
                          style: TextStyle(
                            fontSize: 16,
                            color: selected == i ? Colors.white : Colors.black,
                            fontWeight: selected == i
                                ? FontWeight.bold
                                : FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
    if (Responsive.isMobile(context)) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void _signOut() {
    // Perform sign out logic here

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(
              width: 250,
              child: Menu(
                scaffoldKey: _scaffoldKey,
                navigateToPage: _navigateToPage,
                signOut: _signOut,
              ),
            )
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Profile(),
            )
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Menu(
                    scaffoldKey: _scaffoldKey,
                    navigateToPage: _navigateToPage,
                    signOut: _signOut,
                  ),
                ),
              ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  if (!Responsive.isMobile(context))
                    SizedBox(
                      height: Responsive.isDesktop(context) ? 40 : 20,
                    ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: [
                        HomePage(scaffoldKey: _scaffoldKey),
                        PatientsPage(),
                        MakePrescription(),
                        AddAppointment(),
                        ChatRoomPage(),
                        WeeklyReports(),
                        // SearchPage(),
                        // SettingsPage(),
                        // Add other pages here
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!Responsive.isMobile(context))
              const Expanded(
                flex: 4,
                child: Profile(),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoard(),
    );
  }
}
