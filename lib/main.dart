import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smartora/data/data_store.dart';
import 'package:smartora/screens/center_page_view.dart';
import 'package:smartora/screens/side_bar_navigation.dart';
import 'package:smartora/server_sent_event/my_sse.dart';

//ObjectBox
late ObjectBox objectBoxe;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  objectBoxe = await ObjectBox.create();
  debugPrint("initialisation ObjectBox finished");

  //Entry
  runApp(const Marikora());
}

class Marikora extends StatelessWidget {
  const Marikora({super.key});


  @override
  Widget build(BuildContext context) {


    return ResponsiveSizer( // Responsiveness
      builder: (context, orientation, ScreenType) {
        return MaterialApp(
          title: 'Mari\'Ora',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(title: 'Marik\'Ora'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Initializing an SSE handler
  MySse sse = MySse();

  // Controllers
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {

    startInitialSetups();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // For use later
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [

          //Sidebar navigator
          MOSideBarNavigator(sideMenu: sideMenu),

          //Center PageView
          MOCenterPageView(pageController: pageController)
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    sideMenu.dispose();
    super.dispose();
  }

  // Initialisation
  void startInitialSetups(){
    //Initializing controllers
    sideMenu.addListener((index) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    });

    // Launching SSE
    sse.sseSubscriber();
    sse.sseStream.listen((event) {
      if (kDebugMode) {
        print(event.data!);
      }
    });
  }

}


const Color mainColor = Color.fromARGB(255, 44, 3, 47);

const Color neutralColor = Colors.white;
const Color purpleColor = Color.fromARGB(157, 174, 6, 252);
const Color greyColor = Color.fromARGB(121, 201, 201, 201);
const Color blackColor = Color.fromARGB(255, 61, 61, 61);
