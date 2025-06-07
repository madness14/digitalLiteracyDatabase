-- 1. CONTINENTS (Table without dependencies)
INSERT INTO continent (idContinent, name, population) VALUES
(1, 'América del Norte', 579000000),
(2, 'América del Sur', 423000000),
(3, 'Europa', 746000000),
(4, 'Asia', 4641000000);

-- 2. COUNTRIES (Depends on continent)
INSERT INTO country (idCountry, idContinent, name, population) VALUES
(1, 1, 'México', 126200000),
(2, 1, 'Estados Unidos', 331000000),
(3, 2, 'Colombia', 51300000),
(4, 3, 'España', 47300000);

-- 3. STATES (Depends on country)
INSERT INTO state (idState, idCountry, name, population) VALUES
(1, 1, 'Ciudad de México', 9200000),
(2, 1, 'Jalisco', 8350000),
(3, 2, 'California', 39500000),
(4, 3, 'Bogotá D.C.', 7400000);

-- 4. CITIES (Depends on state)
INSERT INTO city (idCity, idState, name, population) VALUES
(1, 1, 'Ciudad de México', 9200000),
(2, 2, 'Guadalajara', 1500000),
(3, 3, 'Los Ángeles', 3970000),
(4, 4, 'Bogotá', 7400000);

-- 5. FISCAL DATA (Table without dependencies)
INSERT INTO fiscalData (taxId, taxRegime) VALUES
('RFC-MU445566', 'Régimen General'),
('RFC-AB778899', 'Régimen Simplificado'),
('RFC-CH112233', 'Régimen General'),
('RFC-RS987654', 'Régimen Simplificado');

-- 6. ORGANIZATIONS (Table without dependencies)
INSERT INTO organization (idOrganization, name, type, registrationDate, closingDate, website, language, operationStatus) VALUES
(1000, 'Centro de Innovación Social', 'ONG', '2010-05-15', NULL, 'www.cis.org.mx', 'Español', 'Activo'),
(1001, 'ONG Solidaridad Global', 'ONG', '2012-08-20', NULL, 'www.solidaridadglobal.org', 'Español', 'Activo'),
(1002, 'Asociación Futuro Sostenible', 'Asociación Civil', '2015-03-10', NULL, 'www.futurosostenible.org', 'Español', 'Activo'),
(1003, 'Fundación Esperanza', 'Fundación', '2008-11-05', NULL, 'www.fundacionesperanza.mx', 'Español', 'Activo');

-- 7. ORG-FISCALDATA RELATIONSHIP
INSERT INTO orgFiscalData (idOrganization, taxId) VALUES
(1000, 'RFC-MU445566'),
(1001, 'RFC-AB778899'),
(1002, 'RFC-CH112233'),
(1003, 'RFC-RS987654');

-- 8. MEMBERS (Table without dependencies)
INSERT INTO member (idMember, name, position, phone, age, email) VALUES
(5000, 'Pedro Fernández', 'Director General', '5551234567', 45, 'pedro.fernandez@cis.org.mx'),
(5001, 'Daniel Castro', 'Coordinador de Proyectos', '5552345678', 38, 'daniel.castro@cis.org.mx'),
(5002, 'Daniel Castro', 'Director Ejecutivo', '5553456789', 38, 'daniel.castro@solidaridadglobal.org'),
(5003, 'Patricia Molina', 'Gerente Administrativa', '5554567890', 42, 'patricia.molina@cis.org.mx'),
(5004, 'Patricia Molina', 'Directora de Operaciones', '5555678901', 42, 'patricia.molina@futurosostenible.org'),
(5005, 'Ana Ramírez', 'Coordinadora de Programas', '5556789012', 35, 'ana.ramirez@solidaridadglobal.org'),
(5006, 'Sofía Torres', 'Especialista en Educación', '5557890123', 29, 'sofia.torres@solidaridadglobal.org'),
(5007, 'Carlos Sánchez', 'Director de Proyectos', '5558901234', 40, 'carlos.sanchez@futurosostenible.org'),
(5008, 'Carlos Sánchez', 'Director Ejecutivo', '5559012345', 40, 'carlos.sanchez@fundacionesperanza.mx'),
(5009, 'Patricia Molina', 'Gerente de Programas', '5550123456', 42, 'patricia.molina@fundacionesperanza.mx'),
(5010, 'Pedro Fernández', 'Asesor Senior', '5551234509', 45, 'pedro.fernandez@fundacionesperanza.mx');

-- 9. ORG-MEMBER RELATIONSHIP
INSERT INTO orgMember (idOrganization, idMember) VALUES
(1000, 5000), (1000, 5001), (1000, 5003),
(1001, 5002), (1001, 5005), (1001, 5006),
(1002, 5004), (1002, 5007),
(1003, 5008), (1003, 5009), (1003, 5010);

-- 10. TRANSACTIONS (Table without dependencies)
INSERT INTO transaction (idTransaction, type, grantedAmount, transactionDate) VALUES
(6000, 'donacion', 45325.00, '2025-01-10'),
(6001, 'donacion', 68950.00, '2025-01-15'),
(6002, 'donacion', 67734.00, '2025-01-20'),
(6003, 'donacion', 54269.00, '2025-01-25');

-- 11. ORG-TRANSACTION RELATIONSHIP
INSERT INTO orgTransaction (idOrganization, idTransaction) VALUES
(1000, 6000),
(1001, 6001),
(1002, 6002),
(1003, 6003);

-- 12. RESOURCES (Table without dependencies)
INSERT INTO resources (idResources, requestedBudget, grantedBudget, currency) VALUES
(7000, 128940.00, 128940.00, 'MXN'),
(7001, 128940.00, 128940.00, 'MXN'),
(7002, 128940.00, 128940.00, 'MXN'),
(7003, 128940.00, 128940.00, 'MXN');

-- 13. TRANSACTION-RESOURCES RELATIONSHIP
INSERT INTO transactionResources (idTransaction, idResources) VALUES
(6000, 7000),
(6001, 7001),
(6002, 7002),
(6003, 7003);

-- 14. ACTIVITY COSTS (Table without dependencies)
INSERT INTO activityCosts (idCosts, humanResourcesCost, materialCost, financialCost) VALUES
(8000, 1372.00, 2396.00, 1910.00),
(8001, 3263.00, 1110.00, 4746.00),
(8002, 2441.00, 816.00, 6835.00),
(8003, 1980.00, 2743.00, 6404.00),
(8004, 4241.00, 1722.00, 1693.00),
(8005, 4334.00, 804.00, 3424.00),
(8006, 4407.00, 2479.00, 2523.00),
(8007, 1792.00, 1100.00, 3676.00),
(8008, 1637.00, 1612.00, 2046.00),
(8009, 4045.00, 1899.00, 6091.00),
(8010, 2485.00, 2102.00, 1172.00),
(8011, 4651.00, 1391.00, 2108.00),
(8012, 2637.00, 732.00, 3886.00),
(8013, 4708.00, 1847.00, 6666.00),
(8014, 4072.00, 2083.00, 4466.00),
(8015, 3421.00, 744.00, 2663.00);

-- 15. PROJECTS (Depends on members and costs)
INSERT INTO project (idProject, name, operationStatus, startDate, endDate, description, responsible) VALUES
(9000, 'Literacidad Digital: Habilidades Básicas', 65.00, '2025-04-06', '2025-05-06', 'Proyecto para enseñar habilidades digitales básicas', 5000),
(9001, 'Literacidad Digital: Seguridad Online', 30.00, '2025-06-30', '2025-07-30', 'Proyecto sobre seguridad en internet', 5003),
(9002, 'Literacidad Digital: Herramientas Colaborativas', 75.00, '2025-03-22', '2025-04-21', 'Proyecto para enseñar herramientas colaborativas', 5001),
(9003, 'Literacidad Digital: Comunicación Efectiva', 80.00, '2025-02-19', '2025-03-21', 'Proyecto para mejorar comunicación digital', 5000),
(9004, 'Literacidad Digital: Inclusión Tecnológica', 10.00, '2025-08-24', '2025-09-23', 'Proyecto para inclusión digital', 5005),
(9005, 'Literacidad Digital: Educación Remota', 5.00, '2025-07-17', '2025-08-16', 'Proyecto para educación a distancia', 5002),
(9006, 'Literacidad Digital: Ciudadanía Digital', 90.00, '2025-03-15', '2025-04-14', 'Proyecto sobre ciudadanía digital', 5006),
(9007, 'Literacidad Digital: Privacidad de Datos', 95.00, '2025-02-27', '2025-03-29', 'Proyecto sobre protección de datos', 5002),
(9008, 'Literacidad Digital: Sostenibilidad Tecnológica', 100.00, '2025-02-04', '2025-03-06', 'Proyecto sobre tecnología sostenible', 5007),
(9009, 'Literacidad Digital: Recursos Digitales', 70.00, '2025-03-19', '2025-04-18', 'Proyecto sobre recursos digitales', 5007),
(9010, 'Literacidad Digital: Alfabetización Mediática', 100.00, '2025-01-17', '2025-02-16', 'Proyecto sobre alfabetización mediática', 5004),
(9011, 'Literacidad Digital: Innovación Social', 0.00, '2025-05-16', '2025-06-15', 'Proyecto sobre innovación social', 5007),
(9012, 'Literacidad Digital: Adultos Mayores', 85.00, '2025-02-02', '2025-03-04', 'Proyecto para adultos mayores', 5008),
(9013, 'Literacidad Digital: Comunidades Rurales', 0.00, '2025-06-14', '2025-07-14', 'Proyecto para comunidades rurales', 5009),
(9014, 'Literacidad Digital: Emprendimiento Digital', 0.00, '2025-09-04', '2025-10-04', 'Proyecto para emprendimiento digital', 5008),
(9015, 'Literacidad Digital: Educación Continua', 55.00, '2025-02-05', '2025-03-07', 'Proyecto para educación continua', 5010);

-- 16. ORG-PROJECT RELATIONSHIP
INSERT INTO orgProject (idOrganization, idProject) VALUES
(1000, 9000), (1000, 9001), (1000, 9002), (1000, 9003),
(1001, 9004), (1001, 9005), (1001, 9006), (1001, 9007),
(1002, 9008), (1002, 9009), (1002, 9010), (1002, 9011),
(1003, 9012), (1003, 9013), (1003, 9014), (1003, 9015);

-- 17. PROJECT-RESOURCES RELATIONSHIP
INSERT INTO projectResources (idProject, idResources) VALUES
(9000, 7000), (9001, 7000), (9002, 7000), (9003, 7000),
(9004, 7001), (9005, 7001), (9006, 7001), (9007, 7001),
(9008, 7002), (9009, 7002), (9010, 7002), (9011, 7002),
(9012, 7003), (9013, 7003), (9014, 7003), (9015, 7003);

-- 18. ACTIVITIES (Depends on costs)
INSERT INTO activity (idActivity, name, description, startDate, endDate, idCosts) VALUES
-- Project 9000
(9500, 'Capacitación en herramientas digitales 1', 'Primera sesión de capacitación', '2025-04-09', '2025-04-13', 8000),
(9501, 'Capacitación en herramientas digitales 2', 'Segunda sesión de capacitación', '2025-04-22', '2025-05-01', 8000),
(9502, 'Capacitación en herramientas digitales 3', 'Tercera sesión de capacitación', '2025-04-06', '2025-04-10', 8000),
(9503, 'Capacitación en herramientas digitales 4', 'Cuarta sesión de capacitación', '2025-04-06', '2025-04-09', 8000),

-- Project 9001
(9504, 'Charlas sobre ciberseguridad 1', 'Primera charla sobre seguridad', '2025-07-19', '2025-07-28', 8001),
(9505, 'Charlas sobre ciberseguridad 2', 'Segunda charla sobre seguridad', '2025-07-19', '2025-07-23', 8001),
(9506, 'Charlas sobre ciberseguridad 3', 'Tercera charla sobre seguridad', '2025-07-15', '2025-07-23', 8001),
(9507, 'Charlas sobre ciberseguridad 4', 'Cuarta charla sobre seguridad', '2025-07-13', '2025-07-20', 8001),

-- Project 9002
(9508, 'Creación de laboratorios de informática 1', 'Primera fase de creación', '2025-03-23', '2025-03-27', 8002),
(9509, 'Creación de laboratorios de informática 2', 'Segunda fase de creación', '2025-03-22', '2025-04-01', 8002),
(9510, 'Creación de laboratorios de informática 3', 'Tercera fase de creación', '2025-04-06', '2025-04-11', 8002),
(9511, 'Creación de laboratorios de informática 4', 'Cuarta fase de creación', '2025-04-06', '2025-04-13', 8002),

-- Project 9003
(9512, 'Desarrollo de materiales educativos 1', 'Primera fase de desarrollo', '2025-02-19', '2025-02-27', 8003),
(9513, 'Desarrollo de materiales educativos 2', 'Segunda fase de desarrollo', '2025-03-06', '2025-03-13', 8003),
(9514, 'Desarrollo de materiales educativos 3', 'Tercera fase de desarrollo', '2025-03-03', '2025-03-07', 8003),
(9515, 'Desarrollo de materiales educativos 4', 'Cuarta fase de desarrollo', '2025-02-20', '2025-02-26', 8003),

-- Project 9004
(9516, 'Capacitación en herramientas digitales 1', 'Primera sesión de capacitación', '2025-09-08', '2025-09-17', 8004),
(9517, 'Capacitación en herramientas digitales 2', 'Segunda sesión de capacitación', '2025-09-08', '2025-09-17', 8004),
(9518, 'Capacitación en herramientas digitales 3', 'Tercera sesión de capacitación', '2025-09-11', '2025-09-17', 8004),
(9519, 'Capacitación en herramientas digitales 4', 'Cuarta sesión de capacitación', '2025-09-05', '2025-09-08', 8004),

-- Project 9005
(9520, 'Charlas sobre ciberseguridad 1', 'Primera charla sobre seguridad', '2025-07-24', '2025-08-02', 8005),
(9521, 'Charlas sobre ciberseguridad 2', 'Segunda charla sobre seguridad', '2025-07-30', '2025-08-03', 8005),
(9522, 'Charlas sobre ciberseguridad 3', 'Tercera charla sobre seguridad', '2025-07-19', '2025-07-29', 8005),
(9523, 'Charlas sobre ciberseguridad 4', 'Cuarta charla sobre seguridad', '2025-07-31', '2025-08-03', 8005),

-- Project 9006
(9524, 'Creación de laboratorios de informática 1', 'Primera fase de creación', '2025-03-29', '2025-04-08', 8006),
(9525, 'Creación de laboratorios de informática 2', 'Segunda fase de creación', '2025-03-24', '2025-03-28', 8006),
(9526, 'Creación de laboratorios de informática 3', 'Tercera fase de creación', '2025-03-21', '2025-03-30', 8006),
(9527, 'Creación de laboratorios de informática 4', 'Cuarta fase de creación', '2025-03-29', '2025-04-03', 8006),

-- Project 9007
(9528, 'Desarrollo de materiales educativos 1', 'Primera fase de desarrollo', '2025-03-19', '2025-03-28', 8007),
(9529, 'Desarrollo de materiales educativos 2', 'Segunda fase de desarrollo', '2025-03-08', '2025-03-18', 8007),
(9530, 'Desarrollo de materiales educativos 3', 'Tercera fase de desarrollo', '2025-03-17', '2025-03-21', 8007),
(9531, 'Desarrollo de materiales educativos 4', 'Cuarta fase de desarrollo', '2025-03-07', '2025-03-14', 8007),

-- Project 9008
(9532, 'Capacitación en herramientas digitales 1', 'Primera sesión de capacitación', '2025-02-15', '2025-02-24', 8008),
(9533, 'Capacitación en herramientas digitales 2', 'Segunda sesión de capacitación', '2025-02-20', '2025-02-27', 8008),
(9534, 'Capacitación en herramientas digitales 3', 'Tercera sesión de capacitación', '2025-02-10', '2025-02-15', 8008),
(9535, 'Capacitación en herramientas digitales 4', 'Cuarta sesión de capacitación', '2025-02-13', '2025-02-22', 8008),

-- Project 9009
(9536, 'Charlas sobre ciberseguridad 1', 'Primera charla sobre seguridad', '2025-04-01', '2025-04-05', 8009),
(9537, 'Charlas sobre ciberseguridad 2', 'Segunda charla sobre seguridad', '2025-04-08', '2025-04-12', 8009),
(9538, 'Charlas sobre ciberseguridad 3', 'Tercera charla sobre seguridad', '2025-03-28', '2025-04-07', 8009),
(9539, 'Charlas sobre ciberseguridad 4', 'Cuarta charla sobre seguridad', '2025-04-01', '2025-04-09', 8009),

-- Project 9010
(9540, 'Creación de laboratorios de informática 1', 'Primera fase de creación', '2025-01-18', '2025-01-21', 8010),
(9541, 'Creación de laboratorios de informática 2', 'Segunda fase de creación', '2025-01-24', '2025-01-28', 8010),
(9542, 'Creación de laboratorios de informática 3', 'Tercera fase de creación', '2025-01-24', '2025-01-31', 8010),
(9543, 'Creación de laboratorios de informática 4', 'Cuarta fase de creación', '2025-01-17', '2025-01-22', 8010),

-- Project 9011
(9544, 'Desarrollo de materiales educativos 1', 'Primera fase de desarrollo', '2025-05-27', '2025-06-06', 8011),
(9545, 'Desarrollo de materiales educativos 2', 'Segunda fase de desarrollo', '2025-05-31', '2025-06-08', 8011),
(9546, 'Desarrollo de materiales educativos 3', 'Tercera fase de desarrollo', '2025-05-17', '2025-05-25', 8011),
(9547, 'Desarrollo de materiales educativos 4', 'Cuarta fase de desarrollo', '2025-05-24', '2025-05-30', 8011),

-- Project 9012
(9548, 'Capacitación en herramientas digitales 1', 'Primera sesión de capacitación', '2025-02-09', '2025-02-12', 8012),
(9549, 'Capacitación en herramientas digitales 2', 'Segunda sesión de capacitación', '2025-02-02', '2025-02-10', 8012),
(9550, 'Capacitación en herramientas digitales 3', 'Tercera sesión de capacitación', '2025-02-22', '2025-02-28', 8012),
(9551, 'Capacitación en herramientas digitales 4', 'Cuarta sesión de capacitación', '2025-02-18', '2025-02-25', 8012),

-- Project 9013
(9552, 'Charlas sobre ciberseguridad 1', 'Primera charla sobre seguridad', '2025-06-15', '2025-06-18', 8013),
(9553, 'Charlas sobre ciberseguridad 2', 'Segunda charla sobre seguridad', '2025-07-01', '2025-07-04', 8013),
(9554, 'Charlas sobre ciberseguridad 3', 'Tercera charla sobre seguridad', '2025-06-28', '2025-07-01', 8013),
(9555, 'Charlas sobre ciberseguridad 4', 'Cuarta charla sobre seguridad', '2025-06-27', '2025-07-03', 8013),

-- Project 9014
(9556, 'Creación de laboratorios de informática 1', 'Primera fase de creación', '2025-09-09', '2025-09-18', 8014),
(9557, 'Creación de laboratorios de informática 2', 'Segunda fase de creación', '2025-09-08', '2025-09-16', 8014),
(9558, 'Creación de laboratorios de informática 3', 'Tercera fase de creación', '2025-09-05', '2025-09-09', 8014),
(9559, 'Creación de laboratorios de informática 4', 'Cuarta fase de creación', '2025-09-10', '2025-09-18', 8014),

-- Project 9015
(9560, 'Desarrollo de materiales educativos 1', 'Primera fase de desarrollo', '2025-02-12', '2025-02-20', 8015),
(9561, 'Desarrollo de materiales educativos 2', 'Segunda fase de desarrollo', '2025-02-14', '2025-02-21', 8015),
(9562, 'Desarrollo de materiales educativos 3', 'Tercera fase de desarrollo', '2025-02-17', '2025-02-20', 8015),
(9563, 'Desarrollo de materiales educativos 4', 'Cuarta fase de desarrollo', '2025-02-23', '2025-02-28', 8015);

-- 19. PROJECT-ACTIVITY RELATIONSHIP
INSERT INTO projectActivity (idProject, idActivity) VALUES
-- Project 9000
(9000, 9500), (9000, 9501), (9000, 9502), (9000, 9503),
-- Project 9001
(9001, 9504), (9001, 9505), (9001, 9506), (9001, 9507),
-- Project 9002
(9002, 9508), (9002, 9509), (9002, 9510), (9002, 9511),
-- Project 9003
(9003, 9512), (9003, 9513), (9003, 9514), (9003, 9515),
-- Project 9004
(9004, 9516), (9004, 9517), (9004, 9518), (9004, 9519),
-- Project 9005
(9005, 9520), (9005, 9521), (9005, 9522), (9005, 9523),
-- Project 9006
(9006, 9524), (9006, 9525), (9006, 9526), (9006, 9527),
-- Project 9007
(9007, 9528), (9007, 9529), (9007, 9530), (9007, 9531),
-- Project 9008
(9008, 9532), (9008, 9533), (9008, 9534), (9008, 9535),
-- Project 9009
(9009, 9536), (9009, 9537), (9009, 9538), (9009, 9539),
-- Project 9010
(9010, 9540), (9010, 9541), (9010, 9542), (9010, 9543),
-- Project 9011
(9011, 9544), (9011, 9545), (9011, 9546), (9011, 9547),
-- Project 9012
(9012, 9548), (9012, 9549), (9012, 9550), (9012, 9551),
-- Project 9013
(9013, 9552), (9013, 9553), (9013, 9554), (9013, 9555),
-- Project 9014
(9014, 9556), (9014, 9557), (9014, 9558), (9014, 9559),
-- Project 9015
(9015, 9560), (9015, 9561), (9015, 9562), (9015, 9563);

-- 20. PARTICIPANTS (Table without dependencies)
INSERT INTO participant (idParticipant, name, position, phone, age, email) VALUES
(1, 'Juan Pérez', 'Participante', '5551112233', 25, 'juan.perez@email.com'),
(2, 'María López', 'Participante', '5552223344', 30, 'maria.lopez@email.com'),
(3, 'Carlos Ruiz', 'Participante', '5553334455', 28, 'carlos.ruiz@email.com'),
(4, 'Ana García', 'Participante', '5554445566', 35, 'ana.garcia@email.com'),
(5, 'Luisa Martínez', 'Participante', '5555556677', 40, 'luisa.martinez@email.com'),
(6, 'Pedro Sánchez', 'Participante', '5556667788', 22, 'pedro.sanchez@email.com'),
(7, 'Sofía Ramírez', 'Participante', '5557778899', 27, 'sofia.ramirez@email.com'),
(8, 'Jorge Hernández', 'Participante', '5558889900', 32, 'jorge.hernandez@email.com');

-- 21. ACTIVITY-PARTICIPANT RELATIONSHIP (Example for some activities)
INSERT INTO activityParticipant (idActivity, idParticipant) VALUES
(9500, 1), (9500, 2), (9500, 3),
(9501, 4), (9501, 5),
(9502, 6), (9502, 7), (9502, 8),
(9503, 1), (9503, 4),
(9504, 2), (9504, 5), (9504, 7),
(9505, 3), (9505, 6), (9505, 8),
(9506, 1), (9506, 3), (9506, 5),
(9507, 2), (9507, 4), (9507, 6);

-- 22. POPULATION (Depends on city)
INSERT INTO population (idPopulation, age, idCity) VALUES
(1, 25, 1), (2, 30, 1), (3, 35, 1), (4, 40, 1),
(5, 45, 2), (6, 50, 2), (7, 55, 2), (8, 60, 2),
(9, 20, 3), (10, 25, 3), (11, 30, 3), (12, 35, 3),
(13, 40, 4), (14, 45, 4), (15, 50, 4), (16, 55, 4);

-- 23. PROJECT-POPULATION RELATIONSHIP (Example for some projects)
INSERT INTO projectPopulation (idProject, idPopulation) VALUES
(9000, 1), (9000, 2), (9000, 3),
(9001, 4), (9001, 5), (9001, 6),
(9002, 7), (9002, 8), (9002, 9),
(9003, 10), (9003, 11), (9003, 12),
(9004, 13), (9004, 14), (9004, 15),
(9005, 16), (9005, 1), (9005, 2),
(9006, 3), (9006, 4), (9006, 5),
(9007, 6), (9007, 7), (9007, 8);
