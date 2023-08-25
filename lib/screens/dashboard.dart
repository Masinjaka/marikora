import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardPage extends StatefulWidget {

  const DashboardPage({
    super.key,
  });

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Color mainColor = const Color.fromARGB(255, 44, 3, 47);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        // Middle panel with the history list
        const MODashMiddlePanel(),
        // Purple right panel
        MODashRightPanel(mainColor: mainColor)

      ],
    );
  }
}

class MODashMiddlePanel extends StatelessWidget {
  const MODashMiddlePanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        padding: const EdgeInsets.only(left: 10,right: 10),
        color: Colors.white,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10,bottom: 10),
              child: MOSearchBar(),
            ),
            Expanded(child: MOHistoryList()),
          ],
        ),
      ),
    );
  }
}

class MODashRightPanel extends StatelessWidget {
  const MODashRightPanel({
    super.key,
    required this.mainColor,
  });

  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        padding: const EdgeInsets.only(left: 15,right: 15),
        color: mainColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logged User
            const MOLoggedUser(),

            SizedBox(height: 5.h,),
            // Actuality feed
            const MOFeed(),
            SizedBox(height: 2.h,),
            // Text "Module scanner"
            const MOTextModuleScanner(),
            SizedBox(height: 3.h,),
            // RFID Card Scanner connection state indicator
            const MOScannerConnectionState(),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

class MOLoggedUser extends StatelessWidget {
  const MOLoggedUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(child: MOCurrentUserChip()),
          Flexible(child: IconButton(onPressed:(){},icon:const Icon(Icons.logout,color: Colors.white,))),
        ],
      ),
    );
  }
}

class MOTextModuleScanner extends StatelessWidget {
  const MOTextModuleScanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        "Module scanner",
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inconsolata',
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),
      ),
    );
  }
}

class MOScannerConnectionState extends StatelessWidget {
  const MOScannerConnectionState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10),),
              color: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex:3,
                    child: Text("Déconnecté",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)),
                Flexible(child: Icon(Icons.wifi_off,size: 20,)),
              ],
            ),
          ),
        ),

        // Button to refresh the connection with the scanner
        Flexible(child: IconButton(onPressed: (){}, icon: Icon(Icons.refresh,color: Colors.white,))),
      ],
    );
  }
}

class MOFeed extends StatelessWidget {
  const MOFeed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.person),
            title: Text("User n'a pas enregistré son arrivé"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("User2 n'a pas enregistré son arrivé"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("User3 a pris 4 jours de conjé"),
          )
        ],
      ),
    );
  }
}

class MOCurrentUserChip extends StatelessWidget {
  const MOCurrentUserChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Chip(
      side: BorderSide.none,
      deleteIcon: Icon(Icons.delete),
      labelPadding: EdgeInsets.all(10),
      label: Text("RAKOTORABE"),
      avatar: CircleAvatar(
        backgroundColor: mainColor,
        radius: 25,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MOSearchBar extends StatelessWidget {
  const MOSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      cursorColor: mainColor,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints.expand(height: 50,),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: "Search...",
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      style: TextStyle(
        color: blackColor,
        fontFamily: 'Inconsolata',
      ),
    );
  }
}

class MOHistoryList extends StatelessWidget {
  const MOHistoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: greyColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 85.h,
          //width: 50.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Title "History"
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: mainColor,
                      ),
                    ),
                  ),
                  child: MOText(
                    text: "History",
                    size: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              /// Actual List
              Expanded(
                flex: 2,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.yellow,
                            child: Text("$index")),
                        title: Text("Item $index"),
                        subtitle: Text("Item $index subtitle"),
                        contentPadding: const EdgeInsets.all(8),
                        trailing: Container(
                          padding: EdgeInsets.all(1.0.w),
                          decoration: BoxDecoration(
                              color: Colors.green.shade700,
                              borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                          child: const Text(
                            "In time",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MOText extends StatelessWidget {
  const MOText({
    super.key,
    required this.text,
    required this.size,
    required this.fontWeight,
  });

  final String text;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: blackColor,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'Inconsolata',
      ),
    );
  }
}

const Color blackColor = Color.fromARGB(255, 61, 61, 61);
const Color greyColor = Color.fromARGB(121, 201, 201, 201);
const Color mainColor = Color.fromARGB(255, 44, 3, 47);
