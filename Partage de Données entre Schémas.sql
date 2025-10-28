-- View for agents
CREATE OR REPLACE VIEW agent_vols AS
SELECT V.id_vol, V.date_depart, V.heure_depart, V.heure_arrivee,
       D.nom AS aeroport_depart, A.nom AS aeroport_arrivee
FROM VOL V
JOIN AEROPORT D ON V.aeroport_depart = D.id_aeroport
JOIN AEROPORT A ON V.aeroport_arrivee = A.id_aeroport;

-- Grant access to agent_reservation role
GRANT SELECT ON agent_vols TO agent_reservation;

-- Create synonym (assuming schema context; adjust as needed)
CREATE SYNONYM vols FOR agent_vols;