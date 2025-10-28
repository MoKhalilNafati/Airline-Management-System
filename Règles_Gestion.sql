-- ===== Contraintes de gestion (CHECK) =====

-- 1. Capacité d’un avion doit être > 0
ALTER TABLE AVION
ADD CONSTRAINT chk_capacite_positive CHECK (CAPACITE > 0);

-- 2. Poids d’un bagage ne doit pas dépasser 32 kg
ALTER TABLE BAGAGE
ADD CONSTRAINT chk_poids_bagage CHECK (POIDS <= 32);

-- 3. Statut d’une réservation : Confirmée, Annulée, En attente
ALTER TABLE RESERVATION
ADD CONSTRAINT chk_statut_reservation CHECK (
    STATUT IN ('Confirmée', 'Annulée', 'En attente')
);

-- 4. Etat de présence : Présent ou Absent
ALTER TABLE PRESENCE_VOL
ADD CONSTRAINT chk_etat_presence CHECK (
    ETAT_PRESENCE IN ('Présent', 'Absent')
);

-- ===== Procédures (Règles métiers automatisées) =====

-- 5. Enregistrer une nouvelle réservation
CREATE OR REPLACE PROCEDURE enregistrer_reservation (
    p_id_reservation   IN RESERVATION.ID_RESERVATION%TYPE,
    p_id_passager      IN RESERVATION.ID_PASSAGER%TYPE,
    p_id_vol           IN RESERVATION.ID_VOL%TYPE
) AS
BEGIN
    INSERT INTO RESERVATION (id_reservation, id_passager, id_vol, date_reservation, statut)
    VALUES (p_id_reservation, p_id_passager, p_id_vol, SYSDATE, 'En attente');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l’enregistrement : ' || SQLERRM);
END;
/

-- 6. Annuler une réservation
CREATE OR REPLACE PROCEDURE annuler_reservation (
    p_id_reservation IN RESERVATION.ID_RESERVATION%TYPE
) AS
BEGIN
    UPDATE RESERVATION
    SET statut = 'Annulée'
    WHERE id_reservation = p_id_reservation;

    -- Supprimer la présence éventuelle liée
    DELETE FROM PRESENCE_VOL
    WHERE id_passager = (
        SELECT id_passager FROM RESERVATION WHERE id_reservation = p_id_reservation
    )
    AND id_vol = (
        SELECT id_vol FROM RESERVATION WHERE id_reservation = p_id_reservation
    );
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l’annulation : ' || SQLERRM);
END;
/

-- 7. Enregistrer la présence d’un passager
CREATE OR REPLACE PROCEDURE enregistrer_presence (
    p_id_passager IN PRESENCE_VOL.ID_PASSAGER%TYPE,
    p_id_vol      IN PRESENCE_VOL.ID_VOL%TYPE,
    p_etat        IN PRESENCE_VOL.ETAT_PRESENCE%TYPE
) AS
BEGIN
    INSERT INTO PRESENCE_VOL (id_passager, id_vol, etat_presence)
    VALUES (p_id_passager, p_id_vol, p_etat);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        UPDATE PRESENCE_VOL
        SET etat_presence = p_etat
        WHERE id_passager = p_id_passager AND id_vol = p_id_vol;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur lors de l’enregistrement de la présence : ' || SQLERRM);
END;
/

-- 8. Lister les vols affectés à un employé
CREATE OR REPLACE PROCEDURE vols_employe (
    p_id_employe IN EMPLOYE.ID_EMPLOYE%TYPE
) AS
BEGIN
    FOR v IN (
        SELECT V.*
        FROM VOL V
        JOIN ASSIGNATION_EQUIPAGE AE ON V.ID_VOL = AE.ID_VOL
        WHERE AE.ID_EMPLOYE = p_id_employe
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Vol ID : ' || v.id_vol || ', Date : ' || v.date_depart || ', Départ : ' || v.aeroport_depart || ', Arrivée : ' || v.aeroport_arrivee);
    END LOOP;
END;
/

