import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';


class MOSideBarNavigator extends StatelessWidget {
  const MOSideBarNavigator({
    super.key,
    required this.sideMenu,
  });

  final SideMenuController sideMenu;

  @override
  Widget build(BuildContext context) {

    return SideMenu(
      controller: sideMenu,
      style: SideMenuStyle(
        displayMode: SideMenuDisplayMode.auto,
        openSideMenuWidth: 220,
      ),
      title: const MOSideMenuTitle(),
      items: [
        SideMenuItem(
          priority: 0,
          title: "Accueil",
          icon: const Icon(Icons.space_dashboard_outlined),
          onTap: (index, _) => sideMenu.changePage(index),
        ),
        SideMenuItem(
          priority: 1,
          title: "Pointage",
          icon: const Icon(Icons.timer_outlined),
          onTap: (index, _) => sideMenu.changePage(index),
        ),
        SideMenuItem(
          priority: 2,
          title: "Personnels",
          icon: const Icon(Icons.people_alt_outlined),
          onTap: (index,_)=> sideMenu.changePage(index),
        ),
        SideMenuItem(
          priority: 3,
          title: "Paramètre",
          icon: const Icon(Icons.settings_outlined),
          onTap: (index,_) => sideMenu.changePage(index),
        ),
        SideMenuItem(
            priority: 4,
            title: "Support",
            icon: const Icon(Icons.support_outlined),
            onTap: (index,_) => sideMenu.changePage(index)
        ),
      ],
      footer: const MOSideMenuFooter(),

    );
  }
}

class MOSideMenuTitle extends StatelessWidget {
  const MOSideMenuTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 120,
            maxWidth: 120,
          ),
          child: Image.asset('assets/Logo_from_canva.png',
          ),
        ),
        const SizedBox(height: 30,),
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Divider(
            height: 1,
          ),
        ),

      ],
    );
  }
}

class MOSideMenuFooter extends StatelessWidget {
  const MOSideMenuFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: const Text(
        "Smart teknolojia",
        style: TextStyle(
          fontFamily: 'Inconsolata',
          fontSize: 16,
          color: Colors.black45,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}