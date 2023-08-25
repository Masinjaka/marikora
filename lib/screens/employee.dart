import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartora/main.dart';

import '../data/entities.dart';
import '../data/data_store.dart';

class Employees extends StatefulWidget {
  ObjectBox objectBox;
  Employees({super.key, required this.objectBox});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  List<List<String>> listPersonnels = [];

  //load value to list
  loadPersonnel() {
    listPersonnels.clear();
    List<String> lista = [];
    List<Personnel> personnels = objectBoxe.getPersonnelAll();
    for (Personnel one in personnels) {
      lista = [one.nom, one.prenom, one.carte];
      listPersonnels.add(lista);
    }
  }

  @override
  void initState() {
    loadPersonnel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            color: Color.fromARGB(255, 243, 243, 243),
            child: ListView.builder(
                itemCount: listPersonnels.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(listPersonnels[index][0].toString()),
                  );
                }))),
        Container(
          width: 300,
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    widget.objectBox.removePersonnelAll();
                    // widget.objectBox.ajout("test","","","","","","","");
                    setState(() {
                      loadPersonnel();
                    });
                  },
                  child: Text("remove all")),
              ElevatedButton(
                  onPressed: () {
                    Personnel two = Personnel(
                        nom: "RAZAKAHARISOA",
                        prenom: "Barovaosolo",
                        poste: "poste",
                        carte: "carte",
                        photo: "photo",
                        cin: 12,
                        heures: 2122,
                        etat: 1);
                    widget.objectBox.ajoutPersonnel(two);
                    setState(() {
                      loadPersonnel();
                    });
                  },
                  child: const Text("Add test")),
            ],
          ),
        )
      ],
    );
  }
}
