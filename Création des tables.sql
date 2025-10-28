-- 1. AVION
CREATE TABLE AVION (
    id_avion NUMBER PRIMARY KEY,
    modele VARCHAR2(50),
    capacite NUMBER,
    type VARCHAR2(30)
);

-- 2. AEROPORT
CREATE TABLE AEROPORT (
    id_aeroport NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    ville VARCHAR2(50),
    pays VARCHAR2(50)
);

-- 3. VOL
CREATE TABLE VOL (
    id_vol NUMBER PRIMARY KEY,
    date_depart DATE,
    heure_depart VARCHAR2(5),
    heure_arrivee VARCHAR2(5),
    id_avion NUMBER,
    aeroport_depart NUMBER,
    aeroport_arrivee NUMBER, 
    CONSTRAINT fk_vol_avion FOREIGN KEY (id_avion) REFERENCES AVION(id_avion),
    CONSTRAINT fk_vol_aeroport_dep FOREIGN KEY (aeroport_depart) REFERENCES AEROPORT(id_aeroport),
    CONSTRAINT fk_vol_aeroport_arr FOREIGN KEY (aeroport_arrivee) REFERENCES AEROPORT(id_aeroport)
);

-- 4. PASSAGER
CREATE TABLE PASSAGER (
    id_passager NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    prenom VARCHAR2(50),
    email VARCHAR2(100),
    telephone VARCHAR2(20)
);

-- 5. RESERVATION
CREATE TABLE RESERVATION (
    id_reservation NUMBER PRIMARY KEY,
    id_passager NUMBER,
    id_vol NUMBER,
    date_reservation DATE,
    statut VARCHAR2(20),
    CONSTRAINT fk_res_passager FOREIGN KEY (id_passager) REFERENCES PASSAGER(id_passager),
    CONSTRAINT fk_res_vol FOREIGN KEY (id_vol) REFERENCES VOL(id_vol),
    CONSTRAINT uq_passager_vol UNIQUE (id_passager, id_vol)
);

-- 6. EMPLOYE
CREATE TABLE EMPLOYE (
    id_employe NUMBER PRIMARY KEY,
    nom VARCHAR2(50),
    prenom VARCHAR2(50),
    poste VARCHAR2(50),
    email VARCHAR2(100)
);

-- 7. ASSIGNATION_EQUIPAGE
CREATE TABLE ASSIGNATION_EQUIPAGE (
    id_vol NUMBER,
    id_employe NUMBER,
    role VARCHAR2(50),
    PRIMARY KEY (id_vol, id_employe),
    CONSTRAINT fk_eq_vol FOREIGN KEY (id_vol) REFERENCES VOL(id_vol),
    CONSTRAINT fk_eq_emp FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_employe)
);

-- 8. BAGAGE
CREATE TABLE BAGAGE (
    id_bagage NUMBER PRIMARY KEY,
    poids NUMBER,
    id_reservation NUMBER,
    CONSTRAINT fk_bag_res FOREIGN KEY (id_reservation) REFERENCES RESERVATION(id_reservation)
);

-- 9. PRESENCE_VOL
CREATE TABLE PRESENCE_VOL (
    id_passager NUMBER,
    id_vol NUMBER,
    etat_presence VARCHAR2(20),
    PRIMARY KEY (id_passager, id_vol),
    CONSTRAINT fk_pres_passager FOREIGN KEY (id_passager) REFERENCES PASSAGER(id_passager),
    CONSTRAINT fk_pres_vol FOREIGN KEY (id_vol) REFERENCES VOL(id_vol)
);

-- 10. UTILISATEUR
CREATE TABLE UTILISATEUR (
    id_user NUMBER PRIMARY KEY,
    login VARCHAR2(50) UNIQUE,
    mot_de_passe VARCHAR2(100),
    profil VARCHAR2(20),
    id_employe NUMBER,
    CONSTRAINT fk_utilisateur_employe FOREIGN KEY (id_employe) REFERENCES EMPLOYE(id_employe)
);