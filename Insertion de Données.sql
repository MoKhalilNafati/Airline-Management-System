-- Insert data into AVION
INSERT INTO AVION VALUES (1, 'Airbus A320', 180, 'Moyen-courrier');
INSERT INTO AVION VALUES (2, 'Boeing 737', 160, 'Moyen-courrier');
INSERT INTO AVION VALUES (3, 'Airbus A330', 250, 'Long-courrier');
INSERT INTO AVION VALUES (4, 'Boeing 777', 300, 'Long-courrier');
INSERT INTO AVION VALUES (5, 'Embraer E190', 100, 'Court-courrier');
INSERT INTO AVION VALUES (6, 'Airbus A380', 500, 'Long-courrier');

-- Insert data into AEROPORT
INSERT INTO AEROPORT VALUES (1, 'Charles de Gaulle', 'Paris', 'France');
INSERT INTO AEROPORT VALUES (2, 'Heathrow', 'Londres', 'Royaume-Uni');
INSERT INTO AEROPORT VALUES (3, 'JFK', 'New York', 'États-Unis');
INSERT INTO AEROPORT VALUES (4, 'Barajas', 'Madrid', 'Espagne');
INSERT INTO AEROPORT VALUES (5, 'Dubai International', 'Dubaï', 'Émirats Arabes Unis');
INSERT INTO AEROPORT VALUES (6, 'Narita', 'Tokyo', 'Japon');

-- Insert data into VOL
INSERT INTO VOL VALUES (1, TO_DATE('2025-05-10','YYYY-MM-DD'), '08:00', '10:30', 1, 1, 2);
INSERT INTO VOL VALUES (2, TO_DATE('2025-05-11','YYYY-MM-DD'), '13:00', '17:00', 2, 2, 3);
INSERT INTO VOL VALUES (3, TO_DATE('2025-05-12','YYYY-MM-DD'), '16:00', '22:00', 3, 3, 5);
INSERT INTO VOL VALUES (4, TO_DATE('2025-05-13','YYYY-MM-DD'), '09:00', '11:00', 4, 4, 1);
INSERT INTO VOL VALUES (5, TO_DATE('2025-05-14','YYYY-MM-DD'), '06:30', '09:30', 5, 5, 1);
INSERT INTO VOL VALUES (6, TO_DATE('2025-05-15','YYYY-MM-DD'), '10:00', '15:00', 1, 1, 3);
INSERT INTO VOL VALUES (7, TO_DATE('2025-05-16','YYYY-MM-DD'), '07:00', '08:30', 2, 2, 4);

-- Insert data into PASSAGER
INSERT INTO PASSAGER VALUES (1, 'Dupont', 'Jean', 'jean.dupont@example.com', '0612345678');
INSERT INTO PASSAGER VALUES (2, 'Martin', 'Claire', 'claire.martin@example.com', '0623456789');
INSERT INTO PASSAGER VALUES (3, 'Smith', 'John', 'john.smith@example.com', '0634567890');
INSERT INTO PASSAGER VALUES (4, 'Doe', 'Jane', 'jane.doe@example.com', '0645678901');
INSERT INTO PASSAGER VALUES (5, 'Ali', 'Omar', 'omar.ali@example.com', '0656789012');
INSERT INTO PASSAGER VALUES (6, 'Garcia', 'Maria', 'maria.garcia@example.com', '0667890123');
INSERT INTO PASSAGER VALUES (7, 'Lee', 'David', 'david.lee@example.com', '0678901234');
INSERT INTO PASSAGER VALUES (8, 'Brown', 'Emma', 'emma.brown@example.com', '0689012345');

-- Insert data into RESERVATION
INSERT INTO RESERVATION VALUES (1, 1, 1, TO_DATE('2025-04-01','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (2, 2, 2, TO_DATE('2025-04-02','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (3, 3, 3, TO_DATE('2025-04-03','YYYY-MM-DD'), 'Annulée');
INSERT INTO RESERVATION VALUES (4, 4, 4, TO_DATE('2025-04-04','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (5, 5, 5, TO_DATE('2025-04-05','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (6, 6, 1, TO_DATE('2025-04-06','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (7, 7, 2, TO_DATE('2025-04-07','YYYY-MM-DD'), 'Annulée');
INSERT INTO RESERVATION VALUES (8, 1, 6, TO_DATE('2025-04-08','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (9, 8, 7, TO_DATE('2025-04-09','YYYY-MM-DD'), 'Confirmée');
INSERT INTO RESERVATION VALUES (10, 8, 6, TO_DATE('2025-04-10','YYYY-MM-DD'), 'Confirmée');

-- Insert data into EMPLOYE
INSERT INTO EMPLOYE VALUES (1, 'Lemoine', 'Marc', 'Pilote', 'marc.lemoine@airline.com');
INSERT INTO EMPLOYE VALUES (2, 'Durand', 'Sophie', 'Copilote', 'sophie.durand@airline.com');
INSERT INTO EMPLOYE VALUES (3, 'Nguyen', 'Paul', 'Hôtesse', 'paul.nguyen@airline.com');
INSERT INTO EMPLOYE VALUES (4, 'Morel', 'Isabelle', 'Steward', 'isabelle.morel@airline.com');
INSERT INTO EMPLOYE VALUES (5, 'Khan', 'Ali', 'Technicien', 'ali.khan@airline.com');
INSERT INTO EMPLOYE VALUES (6, 'Rossi', 'Laura', 'Hôtesse', 'laura.rossi@airline.com');

-- Insert data into ASSIGNATION_EQUIPAGE
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (1, 1, 'Pilote');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (1, 2, 'Copilote');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (2, 3, 'Hôtesse');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (2, 4, 'Steward');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (3, 5, 'Technicien');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (4, 1, 'Pilote');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (4, 2, 'Copilote');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (5, 3, 'Hôtesse');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (6, 4, 'Steward');
INSERT INTO ASSIGNATION_EQUIPAGE VALUES (6, 6, 'Hôtesse');

-- Insert data into BAGAGE
INSERT INTO BAGAGE VALUES (1, 23.5, 1);
INSERT INTO BAGAGE VALUES (2, 18.2, 2);
INSERT INTO BAGAGE VALUES (3, 25.0, 3);
INSERT INTO BAGAGE VALUES (4, 20.5, 4);
INSERT INTO BAGAGE VALUES (5, 19.8, 5);
INSERT INTO BAGAGE VALUES (6, 15.0, 1);
INSERT INTO BAGAGE VALUES (7, 22.0, 6);
INSERT INTO BAGAGE VALUES (8, 10.0, 8);

-- Insert data into PRESENCE_VOL
INSERT INTO PRESENCE_VOL VALUES (1, 1, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (2, 2, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (3, 3, 'Absent');
INSERT INTO PRESENCE_VOL VALUES (4, 4, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (5, 5, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (6, 1, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (1, 6, 'Présent');
INSERT INTO PRESENCE_VOL VALUES (7, 2, 'Absent');

-- Insert data into UTILISATEUR
INSERT INTO UTILISATEUR VALUES (1, 'admin', 'admin123', 'Administrateur', NULL);
INSERT INTO UTILISATEUR VALUES (2, 'agent1', 'agent123', 'Agent', NULL);
INSERT INTO UTILISATEUR VALUES (3, 'pilote1', 'pilote123', 'Navigant', 1);
INSERT INTO UTILISATEUR VALUES (4, 'agent2', 'agent456', 'Agent', NULL);
INSERT INTO UTILISATEUR VALUES (5, 'navigant1', 'navi123', 'Navigant', 3);
INSERT INTO UTILISATEUR VALUES (6, 'navigant2', 'navi456', 'Navigant', 6);