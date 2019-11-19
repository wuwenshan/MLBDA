-- MABD TP1 Prise en main de PL/SQL

-- -------------------- binome -------------------------
-- NOM
-- Prenom

-- NOM
-- Prenom
-- -----------------------------------------------------

-- procedure S1
-- affiche le code source d'une méthode de l'utilisateur

create or replace procedure s1(nom in varchar2) is


-- cursor c is 


begin
   DBMS_OUTPUT.ENABLE (100000);


   dbms_output.put_line('code source de la méthode ' || nom || ' : '); 

end;

/
show err
 



-- exécuter s1, pour afficher par exemple le code source de la procedure L1
begin
  s1('L1');
end;
/


-- Q1

Select Name from Country where Code IN (Select Country from isMember where Organization='UN') Order By Name;

-- Q2
Select Name, Population from Country where Code IN (Select Country from isMember where Organization='UN') Order By Population Desc;

-- Q3

-- Q13
Select Name
From River
Where River='Nile';

-- Q14
Select Name
From River
Where River='Nile'
UNION
Select r1.Name
From River r1, River r2
Where r1.River='Nile' and r1.Name=r2.River
UNION
Select r1.Name
From River r1, River r2, River r3
Where r1.River='Nile' and r2.Name=r1.Name and r3.Name=r2.River;

-- Q15
Select SUM(length)
From River
Where Name IN
(Select Name
From River
Where River='Nile'
UNION
Select r1.Name
From River r1, River r2
Where r1.River='Nile' and r1.Name=r2.River
UNION
Select r1.Name
From River r1, River r2, River r3
Where r1.River='Nile' and r2.Name=r1.Name and r3.Name=r2.River);
Select * from mondial.R15;

-- Q16 - a)
Select o.Abbreviation, Count(*) AS Nombre_Pays_Membres
From Country c, Organization o, IsMember i
Where c.Code=i.Country and i.Organization=o.Abbreviation
Group By o.Abbreviation
Order By Nombre_Pays_Membres DESC;
