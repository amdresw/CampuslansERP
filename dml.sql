
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
      

