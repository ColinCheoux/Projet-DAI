#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: CALENDRIER_POSS
#------------------------------------------------------------

CREATE TABLE CALENDRIER_POSS(
        DATEMESURE Date NOT NULL ,
        PRIMARY KEY (DATEMESURE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CALENDRIER_REAL
#------------------------------------------------------------

CREATE TABLE CALENDRIER_REAL(
        DATEREALISER Date NOT NULL ,
        PRIMARY KEY (DATEREALISER )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CATEGORIEEXO
#------------------------------------------------------------

CREATE TABLE CATEGORIEEXO(
        CODECAT    int (11) Auto_increment  NOT NULL ,
        LIBELLECAT Text ,
        DESCRIPCAT Text ,
        PRIMARY KEY (CODECAT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CORPS
#------------------------------------------------------------

CREATE TABLE CORPS(
        CODECORPS int (11) Auto_increment  NOT NULL ,
        CORPS     Enum ("Poids du corps","Tour de poitrine","Tour de taille","Tour de hanche","Tour de cuisse gauche","Tour de bras gauche") ,
        PRIMARY KEY (CODECORPS )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: EXERCICE
#------------------------------------------------------------

CREATE TABLE EXERCICE(
        CODEE         int (11) Auto_increment  NOT NULL ,
        LIBELLEE      Varchar (5000) ,
        OBJECTIFE     Varchar (5000) ,
        LIENVIDEO     Varchar (5000) ,
        NBREPEXOINI   Int ,
        TEMPSEXOINI   Int ,
        TEMPSREPOSINI Int ,
        CODECAT       Int NOT NULL ,
        PRIMARY KEY (CODEE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: NIVEAUEXO
#------------------------------------------------------------

CREATE TABLE NIVEAUEXO(
        CODEN    int (11) Auto_increment  NOT NULL ,
        LIBELLEN Text ,
        PRIMARY KEY (CODEN )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PROFIL
#------------------------------------------------------------

CREATE TABLE PROFIL(
        CODEPROFIL    int (11) Auto_increment  NOT NULL ,
        LIBELLEPROFIL Varchar (100) ,
        PRIMARY KEY (CODEPROFIL )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PROGRAMME
#------------------------------------------------------------

CREATE TABLE PROGRAMME(
        CODEP        int (11) Auto_increment  NOT NULL ,
        LIBELLEP     Varchar (50000) ,
        DESCRIPTIONP Text ,
        CODEPT       Int ,
        PRIMARY KEY (CODEP )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SEANCE
#------------------------------------------------------------

CREATE TABLE SEANCE(
        CODES             int (11) Auto_increment  NOT NULL ,
        LIBELLES          Text ,
        DESCRIPTIONSEANCE Text ,
        NBREPS            Int ,
        NUMSEMAINE        Int ,
        EVALCOACH         Bool ,
        CODEP             Int NOT NULL ,
        CODEU             Int NOT NULL ,
        CODEST            Int NOT NULL ,
        PRIMARY KEY (CODES )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: SEANCETYPE
#------------------------------------------------------------

CREATE TABLE SEANCETYPE(
        CODEST    int (11) Auto_increment  NOT NULL ,
        LIBELLEST Varchar (50000) ,
        DESCRIPST Text ,
        PRIMARY KEY (CODEST )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: UTILISATEUR
#------------------------------------------------------------

CREATE TABLE UTILISATEUR(
        CODEU           int (11) Auto_increment  NOT NULL ,
        NOMU            Varchar (100) ,
        PRENOMU         Varchar (100) ,
        MAILU           Varchar (100) ,
        GENREU          Enum ("F","H") ,
        DATENAISSANCE   Date ,
        PASSWORD_U      Varchar (50) ,
        STATUTU         Enum ("prospect","abonné actif","abonné inactif","abonné suspendu") ,
        ADRESSEU        Text ,
        TELU            Integer ,
        TYPEUTILISATEUR Enum ("CLIENT","COACH","ADMINISTRATEUR") ,
        CONTENUNOTIF    Varchar (500) ,
        DATENOTIF       Date ,
        ETAT_LU         Bool ,
        CODEU_1         Int NOT NULL ,
        PRIMARY KEY (CODEU )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PROGRAMMETYPE
#------------------------------------------------------------

CREATE TABLE PROGRAMMETYPE(
        CODEPT        int (11) Auto_increment  NOT NULL ,
        LIBELLEPT     Varchar (25) ,
        DESCRIPTIONPT Text ,
        PRIMARY KEY (CODEPT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: CHOISIR
#------------------------------------------------------------

CREATE TABLE CHOISIR(
        DUREEP     Int ,
        CODEPROFIL Int NOT NULL ,
        CODEPT     Int NOT NULL ,
        PRIMARY KEY (CODEPROFIL ,CODEPT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: COMPRENDRE
#------------------------------------------------------------

CREATE TABLE COMPRENDRE(
        CODEST Int NOT NULL ,
        CODEPT Int NOT NULL ,
        PRIMARY KEY (CODEST ,CODEPT )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: DEFINIR
#------------------------------------------------------------

CREATE TABLE DEFINIR(
        CODEPROFIL Int NOT NULL ,
        CODEU      Int NOT NULL ,
        PRIMARY KEY (CODEPROFIL ,CODEU )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: LIER
#------------------------------------------------------------

CREATE TABLE LIER(
        CODEN Int NOT NULL ,
        CODEE Int NOT NULL ,
        PRIMARY KEY (CODEN ,CODEE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ORGANISER
#------------------------------------------------------------

CREATE TABLE ORGANISER(
        ORDREO  Int ,
        SERIEST Int ,
        CODEE   Int NOT NULL ,
        CODEST  Int NOT NULL ,
        PRIMARY KEY (CODEE ,CODEST )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: PLANIFIER
#------------------------------------------------------------

CREATE TABLE PLANIFIER(
        ORDREP      Int ,
        NBREPE      Int ,
        TEMPSE      Int ,
        TEMPSREPOSE Int ,
        serieP      Int ,
        CODEE       Int NOT NULL ,
        CODES       Int NOT NULL ,
        PRIMARY KEY (CODEE ,CODES )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: POSSEDER
#------------------------------------------------------------

CREATE TABLE POSSEDER(
        MESURE     Float ,
        CODEU      Int NOT NULL ,
        CODECORPS  Int NOT NULL ,
        DATEMESURE Date NOT NULL ,
        PRIMARY KEY (CODEU ,CODECORPS ,DATEMESURE )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REALISERBILAN
#------------------------------------------------------------

CREATE TABLE REALISERBILAN(
        MAXREP       Int ,
        MAXTEMPS     Int ,
        CODES        Int NOT NULL ,
        CODEE        Int NOT NULL ,
        DATEREALISER Date NOT NULL ,
        PRIMARY KEY (CODES ,CODEE ,DATEREALISER )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: REALISERNORMAL
#------------------------------------------------------------

CREATE TABLE REALISERNORMAL(
        ORDRER       Int ,
        RESULTAT     Text ,
        CODES        Int NOT NULL ,
        CODEE        Int NOT NULL ,
        DATEREALISER Date NOT NULL ,
        PRIMARY KEY (CODES ,CODEE ,DATEREALISER )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ASSOCIER
#------------------------------------------------------------

CREATE TABLE ASSOCIER(
        DUREEA Int ,
        CODEP  Int NOT NULL ,
        CODEU  Int NOT NULL ,
        PRIMARY KEY (CODEP ,CODEU )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: ECRIRE_INFO_OPTIONNELLE
#------------------------------------------------------------

CREATE TABLE ECRIRE_INFO_OPTIONNELLE(
        CONTENUINFO       Text ,
        DATEINFO          Date ,
        CODEU             Int NOT NULL ,
        CODEU_UTILISATEUR Int NOT NULL ,
        PRIMARY KEY (CODEU ,CODEU_UTILISATEUR )
)ENGINE=InnoDB;

ALTER TABLE EXERCICE ADD CONSTRAINT FK_EXERCICE_CODECAT FOREIGN KEY (CODECAT) REFERENCES CATEGORIEEXO(CODECAT);
ALTER TABLE PROGRAMME ADD CONSTRAINT FK_PROGRAMME_CODEPT FOREIGN KEY (CODEPT) REFERENCES PROGRAMMETYPE(CODEPT);
ALTER TABLE SEANCE ADD CONSTRAINT FK_SEANCE_CODEP FOREIGN KEY (CODEP) REFERENCES PROGRAMME(CODEP);
ALTER TABLE SEANCE ADD CONSTRAINT FK_SEANCE_CODEU FOREIGN KEY (CODEU) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE SEANCE ADD CONSTRAINT FK_SEANCE_CODEST FOREIGN KEY (CODEST) REFERENCES SEANCETYPE(CODEST);
ALTER TABLE UTILISATEUR ADD CONSTRAINT FK_UTILISATEUR_CODEU_1 FOREIGN KEY (CODEU_1) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE CHOISIR ADD CONSTRAINT FK_CHOISIR_CODEPROFIL FOREIGN KEY (CODEPROFIL) REFERENCES PROFIL(CODEPROFIL);
ALTER TABLE CHOISIR ADD CONSTRAINT FK_CHOISIR_CODEPT FOREIGN KEY (CODEPT) REFERENCES PROGRAMMETYPE(CODEPT);
ALTER TABLE COMPRENDRE ADD CONSTRAINT FK_COMPRENDRE_CODEST FOREIGN KEY (CODEST) REFERENCES SEANCETYPE(CODEST);
ALTER TABLE COMPRENDRE ADD CONSTRAINT FK_COMPRENDRE_CODEPT FOREIGN KEY (CODEPT) REFERENCES PROGRAMMETYPE(CODEPT);
ALTER TABLE DEFINIR ADD CONSTRAINT FK_DEFINIR_CODEPROFIL FOREIGN KEY (CODEPROFIL) REFERENCES PROFIL(CODEPROFIL);
ALTER TABLE DEFINIR ADD CONSTRAINT FK_DEFINIR_CODEU FOREIGN KEY (CODEU) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE LIER ADD CONSTRAINT FK_LIER_CODEN FOREIGN KEY (CODEN) REFERENCES NIVEAUEXO(CODEN);
ALTER TABLE LIER ADD CONSTRAINT FK_LIER_CODEE FOREIGN KEY (CODEE) REFERENCES EXERCICE(CODEE);
ALTER TABLE ORGANISER ADD CONSTRAINT FK_ORGANISER_CODEE FOREIGN KEY (CODEE) REFERENCES EXERCICE(CODEE);
ALTER TABLE ORGANISER ADD CONSTRAINT FK_ORGANISER_CODEST FOREIGN KEY (CODEST) REFERENCES SEANCETYPE(CODEST);
ALTER TABLE PLANIFIER ADD CONSTRAINT FK_PLANIFIER_CODEE FOREIGN KEY (CODEE) REFERENCES EXERCICE(CODEE);
ALTER TABLE PLANIFIER ADD CONSTRAINT FK_PLANIFIER_CODES FOREIGN KEY (CODES) REFERENCES SEANCE(CODES);
ALTER TABLE POSSEDER ADD CONSTRAINT FK_POSSEDER_CODEU FOREIGN KEY (CODEU) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE POSSEDER ADD CONSTRAINT FK_POSSEDER_CODECORPS FOREIGN KEY (CODECORPS) REFERENCES CORPS(CODECORPS);
ALTER TABLE POSSEDER ADD CONSTRAINT FK_POSSEDER_DATEMESURE FOREIGN KEY (DATEMESURE) REFERENCES CALENDRIER_POSS(DATEMESURE);
ALTER TABLE REALISERBILAN ADD CONSTRAINT FK_REALISERBILAN_CODES FOREIGN KEY (CODES) REFERENCES SEANCE(CODES);
ALTER TABLE REALISERBILAN ADD CONSTRAINT FK_REALISERBILAN_CODEE FOREIGN KEY (CODEE) REFERENCES EXERCICE(CODEE);
ALTER TABLE REALISERBILAN ADD CONSTRAINT FK_REALISERBILAN_DATEREALISER FOREIGN KEY (DATEREALISER) REFERENCES CALENDRIER_REAL(DATEREALISER);
ALTER TABLE REALISERNORMAL ADD CONSTRAINT FK_REALISERNORMAL_CODES FOREIGN KEY (CODES) REFERENCES SEANCE(CODES);
ALTER TABLE REALISERNORMAL ADD CONSTRAINT FK_REALISERNORMAL_CODEE FOREIGN KEY (CODEE) REFERENCES EXERCICE(CODEE);
ALTER TABLE REALISERNORMAL ADD CONSTRAINT FK_REALISERNORMAL_DATEREALISER FOREIGN KEY (DATEREALISER) REFERENCES CALENDRIER_REAL(DATEREALISER);
ALTER TABLE ASSOCIER ADD CONSTRAINT FK_ASSOCIER_CODEP FOREIGN KEY (CODEP) REFERENCES PROGRAMME(CODEP);
ALTER TABLE ASSOCIER ADD CONSTRAINT FK_ASSOCIER_CODEU FOREIGN KEY (CODEU) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE ECRIRE_INFO_OPTIONNELLE ADD CONSTRAINT FK_ECRIRE_INFO_OPTIONNELLE_CODEU FOREIGN KEY (CODEU) REFERENCES UTILISATEUR(CODEU);
ALTER TABLE ECRIRE_INFO_OPTIONNELLE ADD CONSTRAINT FK_ECRIRE_INFO_OPTIONNELLE_CODEU_UTILISATEUR FOREIGN KEY (CODEU_UTILISATEUR) REFERENCES UTILISATEUR(CODEU);
