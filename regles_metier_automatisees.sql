-- 1. Séquence pour l'insertion automatique d'un bagage
BEGIN
  -- Drop the sequence if it exists
  EXECUTE IMMEDIATE 'DROP SEQUENCE SEQ_BAGAGE';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -2289 THEN -- ORA-02289: sequence does not exist
      RAISE;
    END IF;
END;
/

CREATE SEQUENCE SEQ_BAGAGE START WITH 1000 INCREMENT BY 1;

-- 2. Trigger : création automatique d’un bagage (par défaut) lors d’une nouvelle réservation
CREATE OR REPLACE TRIGGER TRIG_CREATION_BAGAGE
AFTER INSERT ON RESERVATION
FOR EACH ROW
BEGIN
  INSERT INTO BAGAGE (ID_BAGAGE, POIDS, ID_RESERVATION)
  VALUES (SEQ_BAGAGE.NEXTVAL, 0, :NEW.ID_RESERVATION);
END;
/

-- 3. Trigger : empêcher l’affectation d’un employé à deux vols simultanés
CREATE OR REPLACE TRIGGER TRIG_CONFLIT_VOLS_EMPLOYE
BEFORE INSERT ON ASSIGNATION_EQUIPAGE
FOR EACH ROW
DECLARE
  v_date DATE;
  v_heure_depart VARCHAR2(5);
  v_heure_arrivee VARCHAR2(5);
  v_conflict_count INTEGER;
BEGIN
  SELECT V.DATE_DEPART, V.HEURE_DEPART, V.HEURE_ARRIVEE
  INTO v_date, v_heure_depart, v_heure_arrivee
  FROM VOL V WHERE V.ID_VOL = :NEW.ID_VOL;

  SELECT COUNT(*)
  INTO v_conflict_count
  FROM ASSIGNATION_EQUIPAGE AE
  JOIN VOL V ON AE.ID_VOL = V.ID_VOL
  WHERE AE.ID_EMPLOYE = :NEW.ID_EMPLOYE
    AND V.DATE_DEPART = v_date
    AND V.HEURE_DEPART < v_heure_arrivee
    AND V.HEURE_ARRIVEE > v_heure_depart;

  IF v_conflict_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Conflit : l''employé est déjà affecté à un vol simultané.');
  END IF;
END;
/

-- 4. Fonction : hash basique du mot de passe (à améliorer en production)
CREATE OR REPLACE FUNCTION HASH_MDP(p_mot_de_passe VARCHAR2)
RETURN VARCHAR2 IS
BEGIN
  RETURN UTL_RAW.CAST_TO_VARCHAR2(UTL_ENCODE.BASE64_ENCODE(UTL_RAW.CAST_TO_RAW(p_mot_de_passe)));
END;
/

-- 5. Trigger : hash automatique à l’insertion
CREATE OR REPLACE TRIGGER TRIG_HASH_PASSWORD_INSERT
BEFORE INSERT ON UTILISATEUR
FOR EACH ROW
BEGIN
  :NEW.MOT_DE_PASSE := HASH_MDP(:NEW.MOT_DE_PASSE);
END;
/

-- 6. Trigger : hash automatique à la mise à jour du mot de passe
CREATE OR REPLACE TRIGGER TRIG_HASH_PASSWORD_UPDATE
BEFORE UPDATE OF MOT_DE_PASSE ON UTILISATEUR
FOR EACH ROW
BEGIN
  :NEW.MOT_DE_PASSE := HASH_MDP(:NEW.MOT_DE_PASSE);
END;
/