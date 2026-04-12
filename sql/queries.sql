## 1. Sélection des données d études et niveau de langue arabe des hafidhat :
  
SELECT
    has_simmilar_studies,
    has_surat,
    arab_lang_level
FROM
    majormedia_hafidhat_survey
  

## 2. Récupération des abonnements avec leur catégorie de programme par saison
  
SELECT
    s.season_id,
    c.name AS category
FROM
    majormedia_hafidhat_subscriptions s
JOIN
    majormedia_hafidhat_program_categories c
ON
    s.program_category_id = c.id
  

## 3. Sélection du niveau d éducation des utilisateurs
  
SELECT education_level FROM users
  

## 4. Sélection du pays des utilisateurs
  
SELECT country FROM users
  

## 5. Sélection de l âge des utilisateurs
  
SELECT age FROM users

## 6. Récupération des présences avec les détails des créneaux (slots) et des jours
  
SELECT
    slots.id AS slot_id,
    slots.start_at,
    slots.day,
    presence.is_present
FROM
    majormedia_hafidhat_presence AS presence
JOIN
    majormedia_hafidhat_sessions AS sessions
    ON presence.session_id = sessions.id
JOIN
    majormedia_hafidhat_slots AS slots
    ON sessions.slot_id = slots.id
  

## 7. Récupération des présences avec les créneaux (sans le champ day)
  
SELECT
    slots.id AS slot_id,
    slots.start_at,
    presence.is_present
FROM
    majormedia_hafidhat_presence AS presence
JOIN
    majormedia_hafidhat_sessions AS sessions
    ON presence.session_id = sessions.id
JOIN
    majormedia_hafidhat_slots AS slots
    ON sessions.slot_id = slots.id
  

## 8. Comptage du nombre de classes distinctes par saison
  
SELECT season_id, COUNT(DISTINCT class_id) AS nombre_classes
FROM majormedia_hafidhat_subscriptions
GROUP BY season_id
ORDER BY season_id
  

## 9. Comptage du nombre d utilisateurs distincts par saison
  
SELECT season_id, COUNT(DISTINCT user_id) AS nombre_utilisateurs
FROM majormedia_hafidhat_subscriptions
GROUP BY season_id
ORDER BY season_id
  

## 10. Comptage du nombre total d inscriptions par saison
  
SELECT season_id, COUNT(*) as nombre_inscriptions
FROM majormedia_hafidhat_subscriptions
GROUP BY season_id
ORDER BY season_id
