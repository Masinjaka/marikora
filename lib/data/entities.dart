import 'package:objectbox/objectbox.dart';

// Personnels
@Entity()
class Personnel{
@Id()
int? id;
String nom,prenom,poste,carte,photo;
int cin,heures,etat;

Personnel({required this.nom,required this.prenom,required this.poste, required this.carte,required this.photo,required this.cin,required this.heures, required this.etat,this.id=0});
}

//niditra
@Entity()
class Niditra{
  @Id()
  int?id;
  String nom, prenom,carte,arrive,date;
  Niditra({required this.nom,required this.prenom,required this.carte,required this.arrive,required this.date,this.id=0});
}

//nivoaka
@Entity()
class Nivoaka{
  @Id()
  int?id;
  String nom, prenom,carte, depart , date;
  Nivoaka({required this.nom,required this.prenom,required this.carte,required this.depart,required this.date,this.id=0});
}

//utilisateur
@Entity()
class Utilisateur{
  @Id()
  int?id;
  String nom, prenom,username,mdp,question,reponse;
  Utilisateur({required this.nom,required this.prenom,required this.username,required this.question,required this.mdp,required this.reponse,this.id=0});
}
//historique
@Entity()
class Historique{
  @Id()
  int? id;
  String nom,prenom,eve,heure,carte,photo;
  Historique({required this.nom,required this.prenom,required this.photo,required this.eve,required this.heure,required this.carte,this.id=0});
}

//ip
@Entity()
class Ip{
  @Id()
  int?id;
  String ip;
  Ip({required this.ip,this.id=0});
}
//heure continus
@Entity()
class HeureContinue{
  @Id()
  int?id;
  String carte,he,hs;
  HeureContinue({required this.carte,required this.he,required this.hs,this.id=0});
}

//heure discontinusDouble
@Entity()
class HeureDiscontinusDouble{
  @Id()
  int?id;
  String carte,he1,he2,hs1,hs2;
  HeureDiscontinusDouble({required this.carte,required this.he1,required  this.he2,required this.hs1,required this.hs2,this.id=0});
}