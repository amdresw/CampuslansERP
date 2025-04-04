
INSERT INTO camperstatus (StatusType)  
VALUES  
    ('En proceso de ingreso'),  
    ('Inscrito'),  
    ('Aprobado'),  
    ('Cursando'),  
    ('Graduado'),  
    ('Expulsado'),  
    ('Retirado');

INSERT INTO risklevel (Level)
VALUES
    ('Alto'),
    ('Bajo'),
    ('Medio');

INSERT INTO statusmodulep (Status)
VALUES
    ('Pendiente'),
    ('Finalizado'),
    ('En Proceso');

INSERT INTO assessmenttype (Type, Percentage)
VALUES
    ('Evaluación teórica',30.00),
    ('Evaluación práctica', 60.00),
    ('Trabajos/Quizzes', 10.00);

INSERT INTO assessmentstatus (Status)
VALUES
    ('Pendiente'),
    ('Finalizado'),
    ('En Proceso');

INSERT INTO dbms (Description)
VALUES 
    ('MySQL'),
    ('MongoDB'),
    ('PostgreSQL');

INSERT INTO learningpath (PathName)
VALUES
    ('Java'),
    ('JavaScript'),
    ('C#');

INSERT INTO module (ModuleName)
VALUES
    ('Fundamentos de programación'),
    ('Programación Web'),
    ('Programación formal '),
    ('Bases de datos'),
    ('Backend');

INSERT INTO Company (CompanyName)  
VALUES  
    ('Universidad de los Andes'),  
    ('Pontificia Universidad Javeriana'),  
    ('Universidad Nacional de Colombia'),  
    ('Universidad del Rosario'),  
    ('Universidad EAFIT'),  
    ('Universidad ICESI'),  
    ('Universidad de Antioquia'),  
    ('Universidad de la Sabana'),  
    ('Universidad del Norte'),  
    ('Universidad Tecnológica de Pereira');

INSERT INTO classroomstatus (Status)
VALUES
    ('Disponible'),
    ('Ocupado');

INSERT INTO Country (CountryName)  
VALUES  
    ('Colombia'),  
    ('Argentina'),  
    ('Brasil'),  
    ('Chile'),  
    ('Ecuador'),  
    ('México'),  
    ('Perú'),  
    ('Venezuela'),  
    ('Uruguay'),  
    ('Paraguay');

INSERT INTO Department (DepartmentName, idCountry)  
VALUES  
    ('Antioquia', 1),  
    ('Cundinamarca', 1),  
    ('Valle del Cauca', 1),  
    ('Atlántico', 1),  
    ('Santander', 1),  
    ('Bolívar', 1),  
    ('Risaralda', 1),  
    ('Nariño', 1),  
    ('Caldas', 1),  
    ('Tolima', 1);

INSERT INTO City (CityName, idDepartment)  
VALUES  
    ('Medellín', 1),  
    ('Bogotá', 2),  
    ('Cali', 3),  
    ('Barranquilla', 4),  
    ('Bucaramanga', 5),  
    ('Cartagena', 6),  
    ('Pereira', 7),  
    ('Pasto', 8),  
    ('Manizales', 9),  
    ('Ibagué', 10);

INSERT INTO Address (Address, idCity) VALUES  
    ('Calle 10 #23-45', 5),  
    ('Carrera 50 #12-30', 2),  
    ('Av. Siempre Viva #742', 3),  
    ('Calle 8 #21-14', 4),  
    ('Carrera 100 #15-60', 5),  
    ('Calle 45 #67-89', 1),  
    ('Carrera 12 #34-56', 2),  
    ('Av. Las Palmas #101-15', 5),  
    ('Calle 77 #50-99', 4),  
    ('Carrera 40 #20-80', 5);
    
INSERT INTO Campus (CampusName) VALUES
    ('Campus Zona Franca'),
    ('Campus Puerta del sol'),
    ('Campus Rolos'),
    ('Campus Guerrillos'),
    ('Campus llano');

INSERT INTO CampusAddress (idCampus, idAddress) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Inserts para Parents

INSERT INTO Parent (IdNumber,Name, LastName, Telephone) VALUES
    ('1234567795','Carlos', 'Gómez', '3012345678'),
    ('1234567895','María', 'López', '3023456789'),
    ('1234562295','Juan', 'Martínez', '3034567890'),
    ('1234561195','Ana', 'Rodríguez', '3045678901'),
    ('1234067895','Luis', 'Fernández', '3056789012');

-- Inserts para Campers y Trainers

INSERT INTO Campers (IdNumber, Name, LastName, RegistrationDate, idRiskLevel, idCamperStatus, idParent, idLearningPath) VALUES
    ('1001234512', 'Andrés', 'Pérez', '2005-04-10', 2, 2, 1, 1),
    ('1002234512', 'Sofía', 'Martínez', '2006-06-12', 3, 3, 2, 2),
    ('1003234512', 'Mateo', 'González', '2004-07-15', 1, 4, 3, 3),
    ('1004234512', 'Valentina', 'Ramírez', '2005-09-20', 2, 2, 4, 1),
    ('1005234512', 'Daniel', 'Torres', '2006-11-25', 3, 3, 5, 2);

INSERT INTO Trainers (Name, LastName, IdNumber, idCampus) VALUES
    ('Javier', 'Sánchez','1006234512', 1),
    ('Mónica', 'Díaz','1007234512', 2),
    ('Fernando', 'Castro','1008234512', 3),
    ('Paola', 'Hernández','1009234512', 4),
    ('Ricardo', 'Moreno','1006534512', 5);

-- Sesiones comunes para todos los Learning Paths
INSERT INTO Sessions (idModule, Date, Topic) VALUES
(1, '2025-01-10', 'Algoritmos y pseudocódigo'),
(1, '2025-01-12', 'Tipos de datos y operadores'),
(2, '2025-01-15', 'HTML y estructura básica'),
(2, '2025-01-17', 'CSS y estilos básicos');

-- Java Path (idLearningPath = 1)
INSERT INTO Sessions (idModule, Date, Topic) VALUES
(3, '2025-01-20', 'Estructuras de control en Java'),
(4, '2025-01-22', 'MySQL y JDBC'),
(5, '2025-01-25', 'APIs con Spring Boot');

-- JavaScript Path (idLearningPath = 2)
INSERT INTO Sessions (idModule, Date, Topic) VALUES
(3, '2025-01-20', 'Closures y promesas'),
(4, '2025-01-22', 'MongoDB y Mongoose'),
(5, '2025-01-25', 'Express y desarrollo de REST APIs');

-- C# Path (idLearningPath = 3)
INSERT INTO Sessions (idModule, Date, Topic) VALUES
(3, '2025-01-20', 'LINQ y estructuras'),
(4, '2025-01-22', 'SQL Server y Entity Framework'),
(5, '2025-01-25', 'ASP.NET Core y MVC');

INSERT INTO `Group` (idLearningPath, GroupName, StartDate) VALUES
(1, 'J1', '2025-01-10'),
(1, 'J2', '2025-01-12'),
(2, 'M1', '2025-01-14'),
(2, 'M2', '2025-01-16'),
(3, 'C1', '2025-01-18'),
(3, 'C2', '2025-01-20');


