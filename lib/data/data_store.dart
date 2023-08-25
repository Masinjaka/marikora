
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


import '../objectbox.g.dart';
import 'entities.dart';

class ObjectBox {
  // the store of this  logiciel
  late final Store _store;

  //box  of entities
  late final Box<Personnel> _personnelBox;
  late final Box<Niditra> _niditra;
  late final Box<Nivoaka> _nivoaka;
  late final Box<Utilisateur> _uitilisateur;
  late final Box<Historique> _historique;
  late final Box<Ip> _ip;
  late final Box<HeureContinue> _heureContinue;
  late final Box<HeureDiscontinusDouble> _heureDiscontinueDouble;

  ObjectBox._create(this._store) {
    _personnelBox = Box<Personnel>(_store);
    _niditra = Box<Niditra>(_store);
    _nivoaka = Box<Nivoaka>(_store);
    _uitilisateur = Box<Utilisateur>(_store);
    _historique = Box<Historique>(_store);
    _ip = Box<Ip>(_store);
    _heureDiscontinueDouble = Box<HeureDiscontinusDouble>(_store);
   
  }

  // Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    //FututreM<Store> openStore(){...} is defined in the generated objectBox.g.dart
    final store =
        await openStore(directory: p.join(docsDir.path, "obx-example"));

    return ObjectBox._create(store);
  }

  // personnel
  Personnel? getPersonnel(int id) => _personnelBox.get(id);
  ajoutPersonnel(Personnel personnel) => _personnelBox.put(personnel);
  int removePersonnelAll() => _personnelBox.removeAll();
  bool removeById(int id) => _personnelBox.remove(id);
  List<Personnel> getPersonnelAll() => _personnelBox.getAll();

  //niditra
  Niditra? getNiditra(int id)=> _niditra.get(id);
  ajoutNiditra(Niditra niditra)=> _niditra.put(niditra);
  int removeNiditraAll()=> _niditra.removeAll();
  bool removeNiditraById(int id)=>_niditra.remove(id);
  List<Niditra>getNiditraAll()=>_niditra.getAll();


   //nivoaka
  Nivoaka? getNivoaka(int id)=> _nivoaka.get(id);
  ajoutNivoaka(Nivoaka nivoaka)=> _nivoaka.put(nivoaka);
  int removeNivoakaAll()=> _nivoaka.removeAll();
  bool removeNivoakaById(int id)=>_nivoaka.remove(id);
  List<Nivoaka>getNivoakaAll()=>_nivoaka.getAll();

   //Utilisateur
  Utilisateur? getUtilisateur(int id)=> _uitilisateur.get(id);
  ajoutUtilisateur(Utilisateur uitilisateur)=> _uitilisateur.put(uitilisateur);
  int removeUtilisateurAll()=> _uitilisateur.removeAll();
  bool removeUtilisateurById(int id)=>_uitilisateur.remove(id);
  List<Utilisateur>getUtilisateurAll()=>_uitilisateur.getAll();


   //Historique
  Historique? getHistorique(int id)=> _historique.get(id);
  ajoutHistorique(Historique uitilisateur)=> _historique.put(uitilisateur);
  int removeHistoriqueAll()=> _historique.removeAll();
  bool removeHistoriqueById(int id)=>_historique.remove(id);
  List<Historique>getHistoriqueAll()=>_historique.getAll();

  //ip
  Ip? getIp(int id)=> _ip.get(id);
  ajoutIp(Ip uitilisateur)=> _ip.put(uitilisateur);
  int removeIpAll()=> _ip.removeAll();
  bool removeIpById(int id)=>_ip.remove(id);
  List<Ip>getIpAll()=>_ip.getAll();

   //Heure continu
  HeureContinue? getHeureContinue(int id)=> _heureContinue.get(id);
  ajoutHeureContinue(HeureContinue uitilisateur)=> _heureContinue.put(uitilisateur);
  int removeHeureContinueAll()=> _heureContinue.removeAll();
  bool removeHeureContinueById(int id)=>_heureContinue.remove(id);
  List<HeureContinue>getHeureContinueAll()=>_heureContinue.getAll();


     //Heure continu
  HeureDiscontinusDouble? getHeureDiscontinusDouble(int id)=> _heureDiscontinueDouble.get(id);
  ajoutHeureDiscontinusDouble(HeureDiscontinusDouble uitilisateur)=> _heureDiscontinueDouble.put(uitilisateur);
  int removeHeureDiscontinusDoubleAll()=> _heureDiscontinueDouble.removeAll();
  bool removeHeureDiscontinusDoubleById(int id)=>_heureDiscontinueDouble.remove(id);
  List<HeureDiscontinusDouble>getHeureDiscontinusDoubleAll()=>_heureDiscontinueDouble.getAll();


}
