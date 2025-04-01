CREATE DATABASE IF NOT EXISTS CampusLands_erp ;
USE CampusLands_erp ;

CREATE TABLE IF NOT EXISTS CampusLands_erp.CamperStatus (
  IdCamperStatus INT NOT NULL AUTO_INCREMENT,
  StatusType VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCamperStatus)
  );

CREATE TABLE IF NOT EXISTS CampusLands_erp.Company (
  IdCompany INT NOT NULL AUTO_INCREMENT,
  CompanyName VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCompany));

CREATE TABLE IF NOT EXISTS CampusLands_erp.Campus (
  IdCampus INT NOT NULL AUTO_INCREMENT,
  CampusName VARCHAR(45) NOT NULL,
  idCompany INT NOT NULL,
  PRIMARY KEY (IdCampus),
    CONSTRAINT fk_Campus_Company1
    FOREIGN KEY (idCompany)
    REFERENCES CampusLands_erp.Company (IdCompany)
    
    );

CREATE TABLE IF NOT EXISTS CampusLands_erp.RiskLevel (
  IdRiskLevel INT NOT NULL AUTO_INCREMENT,
  Level VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdRiskLevel));

CREATE TABLE IF NOT EXISTS CampusLands_erp.Parent (
  IdParent INT NOT NULL AUTO_INCREMENT,
  IdNumber VARCHAR(10) NOT NULL,
  Name VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  Telephone VARCHAR(15) NOT NULL,
  PRIMARY KEY (IdParent));

CREATE TABLE IF NOT EXISTS CampusLands_erp.LearningPath (
  IdLearningPath INT NOT NULL AUTO_INCREMENT,
  PathName VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdLearningPath));

CREATE TABLE IF NOT EXISTS CampusLands_erp.Campers (
  IdCampers INT NOT NULL AUTO_INCREMENT,
  IdNumber VARCHAR(10) NOT NULL,
  Name VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  RegistrationDate DATE NOT NULL,
  idCamperStatus INT NOT NULL,
  idCampus INT NOT NULL,
  idRiskLevel INT NOT NULL,
  idParent INT NOT NULL,
  idLearningPath INT NOT NULL,
  PRIMARY KEY (IdCampers),
            CONSTRAINT fk_Campers_CamperStatus
    FOREIGN KEY (idCamperStatus)
    REFERENCES CampusLands_erp.CamperStatus (IdCamperStatus)
    
    ,
  CONSTRAINT fk_Campers_Campus1
    FOREIGN KEY (idCampus)
    REFERENCES CampusLands_erp.Campus (IdCampus)
    
    ,
  CONSTRAINT fk_Campers_RiskLevel1
    FOREIGN KEY (idRiskLevel)
    REFERENCES CampusLands_erp.RiskLevel (IdRiskLevel)
    
    ,
  CONSTRAINT fk_Campers_Parent1
    FOREIGN KEY (idParent)
    REFERENCES CampusLands_erp.Parent (IdParent)
    
    ,
  CONSTRAINT fk_Campers_LearningPath1
    FOREIGN KEY (idLearningPath)
    REFERENCES CampusLands_erp.LearningPath (IdLearningPath)
    
    );

CREATE TABLE IF NOT EXISTS CampusLands_erp.Graduates (
  IdGraduates INT NOT NULL AUTO_INCREMENT,
  Date DATE NOT NULL,
  idCampers INT NOT NULL,
  PRIMARY KEY (IdGraduates),
    CONSTRAINT fk_Graduates_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Module (
  IdModule INT NOT NULL AUTO_INCREMENT,
  ModuleName VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdModule));


CREATE TABLE IF NOT EXISTS CampusLands_erp.StatusModuleP (
  IdStatusModuleP INT NOT NULL AUTO_INCREMENT,
  Status VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdStatusModuleP));


CREATE TABLE IF NOT EXISTS CampusLands_erp.ModulePath (
  IdModulePath INT NOT NULL AUTO_INCREMENT,
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  idModule INT NOT NULL,
  idLearningPath INT NOT NULL,
  idStatusModuleP INT NOT NULL,
  PRIMARY KEY (IdModulePath),
        CONSTRAINT fk_ModulePath_LearningPath1
    FOREIGN KEY (idLearningPath)
    REFERENCES CampusLands_erp.LearningPath (IdLearningPath)
    
    ,
  CONSTRAINT fk_ModulePath_Module1
    FOREIGN KEY (idModule)
    REFERENCES CampusLands_erp.Module (IdModule)
    
    ,
  CONSTRAINT fk_ModulePath_StatusModuleP1
    FOREIGN KEY (idStatusModuleP)
    REFERENCES CampusLands_erp.StatusModuleP (IdStatusModuleP)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.DBMS (
  IdDBMS INT NOT NULL AUTO_INCREMENT,
  Description VARCHAR(60) NOT NULL,
  PRIMARY KEY (IdDBMS));


CREATE TABLE IF NOT EXISTS CampusLands_erp.SystemPath (
  IdSystemPath INT NOT NULL AUTO_INCREMENT,
  IdDBMSA INT NOT NULL,
  idLearningPath INT NOT NULL,
  idDBMS INT NOT NULL,
  PRIMARY KEY (IdSystemPath),
      CONSTRAINT fk_SystemPath_LearningPath1
    FOREIGN KEY (idLearningPath)
    REFERENCES CampusLands_erp.LearningPath (IdLearningPath)
    
    ,
  CONSTRAINT fk_SystemPath_DBMS1
    FOREIGN KEY (idDBMS)
    REFERENCES CampusLands_erp.DBMS (IdDBMS)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.AssessmentType (
  IdAssessmentType INT NOT NULL AUTO_INCREMENT,
  Type VARCHAR(45) NOT NULL,
  Percentage DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (IdAssessmentType));



CREATE TABLE IF NOT EXISTS CampusLands_erp.AssessmentStatus (
  IdAssessmentStatus INT NOT NULL AUTO_INCREMENT,
  Status VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdAssessmentStatus));


CREATE TABLE IF NOT EXISTS CampusLands_erp.Assessment (
  IdAssessment INT NOT NULL AUTO_INCREMENT,
  Description VARCHAR(45) NOT NULL,
  Date DATE NOT NULL,
  idModulePath INT NOT NULL,
  idAssessmentType INT NOT NULL,
  idAssessmentStatus INT NOT NULL,
  PRIMARY KEY (IdAssessment),
        CONSTRAINT fk_Assessment_ModulePath1
    FOREIGN KEY (idModulePath)
    REFERENCES CampusLands_erp.ModulePath (IdModulePath)
    
    ,
  CONSTRAINT fk_Assessment_AssessmentType1
    FOREIGN KEY (idAssessmentType)
    REFERENCES CampusLands_erp.AssessmentType (IdAssessmentType)
    
    ,
  CONSTRAINT fk_Assessment_AssessmentStatus1
    FOREIGN KEY (idAssessmentStatus)
    REFERENCES CampusLands_erp.AssessmentStatus (IdAssessmentStatus)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Tuition (
  IdTuition INT NOT NULL AUTO_INCREMENT,
  Date DATE NOT NULL,
  idCampers INT NOT NULL,
  idModulePath INT NOT NULL,
  PRIMARY KEY (IdTuition),
      CONSTRAINT fk_Tuition_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    ,
  CONSTRAINT fk_Tuition_ModulePath1
    FOREIGN KEY (idModulePath)
    REFERENCES CampusLands_erp.ModulePath (IdModulePath)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Grades (
  IdGrades INT NOT NULL AUTO_INCREMENT,
  Grade DECIMAL(10,2) NOT NULL,
  idAssessment INT NOT NULL,
  idTuition INT NOT NULL,
  PRIMARY KEY (IdGrades),
      CONSTRAINT fk_Grades_Assessment1
    FOREIGN KEY (idAssessment)
    REFERENCES CampusLands_erp.Assessment (IdAssessment)
    
    ,
  CONSTRAINT fk_Grades_Tuition1
    FOREIGN KEY (idTuition)
    REFERENCES CampusLands_erp.Tuition (IdTuition)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.FinalGrade (
  IdFinalGrade INT NOT NULL,
  Grade DECIMAL(10,2) NOT NULL,
  idGrades INT NOT NULL,
  PRIMARY KEY (IdFinalGrade),
    CONSTRAINT fk_FinalGrade_Grades1
    FOREIGN KEY (idGrades)
    REFERENCES CampusLands_erp.Grades (IdGrades)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Sessions (
  IdSessions INT NOT NULL AUTO_INCREMENT,
  Date DATE NOT NULL,
  Topic VARCHAR(45) NOT NULL,
  idModulePath INT NOT NULL,
  PRIMARY KEY (IdSessions),
    CONSTRAINT fk_Sessions_ModulePath1
    FOREIGN KEY (idModulePath)
    REFERENCES CampusLands_erp.ModulePath (IdModulePath)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Attendance (
  IdAttendance INT NOT NULL AUTO_INCREMENT,
  idCampers INT NOT NULL,
  idSessions INT NOT NULL,
  PRIMARY KEY (IdAttendance),
      CONSTRAINT fk_Attendance_Sessions1
    FOREIGN KEY (idSessions)
    REFERENCES CampusLands_erp.Sessions (IdSessions)
    
    ,
  CONSTRAINT fk_Attendance_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Telephone (
  IdTelephone INT NOT NULL,
  TelephoneNumber VARCHAR(45) NOT NULL,
  idCampers INT NOT NULL,
  PRIMARY KEY (IdTelephone),
    CONSTRAINT fk_Telephone_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.CamperHistory (
  IdCamperHistory INT NOT NULL AUTO_INCREMENT,
  PreviousStatus VARCHAR(45) NOT NULL,
  NewStatus VARCHAR(45) NOT NULL,
  idCampers INT NOT NULL,
  PRIMARY KEY (IdCamperHistory),
    CONSTRAINT fk_CamperHistory_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Country (
  IdCountry INT NOT NULL AUTO_INCREMENT,
  CountryName VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdCountry));


CREATE TABLE IF NOT EXISTS CampusLands_erp.Department (
  IdDepartment INT NOT NULL AUTO_INCREMENT,
  DepartmentName VARCHAR(45) NOT NULL,
  idCountry INT NOT NULL,
  PRIMARY KEY (IdDepartment),
    CONSTRAINT fk_Department_Country1
    FOREIGN KEY (idCountry)
    REFERENCES CampusLands_erp.Country (IdCountry)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.City (
  IdCity INT NOT NULL AUTO_INCREMENT,
  CityName VARCHAR(45) NOT NULL,
  idDepartment INT NOT NULL,
  PRIMARY KEY (IdCity),
    CONSTRAINT fk_City_Department1
    FOREIGN KEY (idDepartment)
    REFERENCES CampusLands_erp.Department (IdDepartment)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Address (
  IdAddress INT NOT NULL AUTO_INCREMENT,
  Address VARCHAR(60) NULL,
  idCity INT NOT NULL,
  PRIMARY KEY (IdAddress),
    CONSTRAINT fk_Address_City1
    FOREIGN KEY (idCity)
    REFERENCES CampusLands_erp.City (IdCity)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.CamperAddress (
  IdCamperAddress INT NOT NULL AUTO_INCREMENT,
  idAddress INT NOT NULL,
  idCampers INT NOT NULL,
  PRIMARY KEY (IdCamperAddress),
      CONSTRAINT fk_CamperAddress_Address1
    FOREIGN KEY (idAddress)
    REFERENCES CampusLands_erp.Address (IdAddress)
    
    ,
  CONSTRAINT fk_CamperAddress_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.CampusAddress (
  IdCampusAddress INT NOT NULL AUTO_INCREMENT,
  idCampus INT NOT NULL,
  idAddress INT NOT NULL,
  PRIMARY KEY (IdCampusAddress),
      CONSTRAINT fk_CampusAddress_Campus1
    FOREIGN KEY (idCampus)
    REFERENCES CampusLands_erp.Campus (IdCampus)
    
    ,
  CONSTRAINT fk_CampusAddress_Address1
    FOREIGN KEY (idAddress)
    REFERENCES CampusLands_erp.Address (IdAddress)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Trainers (
  IdTrainers INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(45) NOT NULL,
  LastName VARCHAR(45) NOT NULL,
  IdNumber VARCHAR(10) NOT NULL,
  idCampus INT NOT NULL,
  PRIMARY KEY (IdTrainers),
    CONSTRAINT fk_Trainers_Campus1
    FOREIGN KEY (idCampus)
    REFERENCES CampusLands_erp.Campus (IdCampus)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Group (
  IdGroup INT NOT NULL AUTO_INCREMENT,
  GroupCode VARCHAR(45) NOT NULL,
  idTrainers INT NOT NULL,
  idLearningPath INT NOT NULL,
  PRIMARY KEY (IdGroup),
      CONSTRAINT fk_Group_Trainers1
    FOREIGN KEY (idTrainers)
    REFERENCES CampusLands_erp.Trainers (IdTrainers)
    
    ,
  CONSTRAINT fk_Group_LearningPath1
    FOREIGN KEY (idLearningPath)
    REFERENCES CampusLands_erp.LearningPath (IdLearningPath)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.GroupDetails (
  IdGroupDetails INT NOT NULL AUTO_INCREMENT,
  idGroup INT NOT NULL,
  idCampers INT NOT NULL,
  PRIMARY KEY (IdGroupDetails),
      CONSTRAINT fk_GroupDetails_Group1
    FOREIGN KEY (idGroup)
    REFERENCES CampusLands_erp.Group (IdGroup)
    
    ,
  CONSTRAINT fk_GroupDetails_Campers1
    FOREIGN KEY (idCampers)
    REFERENCES CampusLands_erp.Campers (IdCampers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Skills (
  IdSkills INT NOT NULL,
  SkillsName VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdSkills));


CREATE TABLE IF NOT EXISTS CampusLands_erp.TrainerSkills (
  IdTrainerSkills INT NOT NULL AUTO_INCREMENT,
  idSkills INT NOT NULL,
  idTrainers INT NOT NULL,
  PRIMARY KEY (IdTrainerSkills),
      CONSTRAINT fk_TrainerSkills_Skills1
    FOREIGN KEY (idSkills)
    REFERENCES CampusLands_erp.Skills (IdSkills)
    
    ,
  CONSTRAINT fk_TrainerSkills_Trainers1
    FOREIGN KEY (idTrainers)
    REFERENCES CampusLands_erp.Trainers (IdTrainers)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.ClassroomStatus (
  IdClassroomStatus INT NOT NULL AUTO_INCREMENT,
  Status VARCHAR(45) NOT NULL,
  PRIMARY KEY (IdClassroomStatus));


CREATE TABLE IF NOT EXISTS CampusLands_erp.Classroom (
  IdClassroom INT NOT NULL AUTO_INCREMENT,
  ClassroomName VARCHAR(45) NOT NULL,
  Capacity VARCHAR(45) NOT NULL,
  idClassroomStatus INT NOT NULL,
  PRIMARY KEY (IdClassroom),
    CONSTRAINT fk_Classroom_ClassroomStatus1
    FOREIGN KEY (idClassroomStatus)
    REFERENCES CampusLands_erp.ClassroomStatus (IdClassroomStatus)
    
    );


CREATE TABLE IF NOT EXISTS CampusLands_erp.Schedule (
  IdSchedule INT NOT NULL AUTO_INCREMENT,
  Date DATE NOT NULL,
  Description VARCHAR(45) NOT NULL,
  AM VARCHAR(45) NULL,
  PM VARCHAR(45) NULL,
  PRIMARY KEY (IdSchedule));


CREATE TABLE IF NOT EXISTS CampusLands_erp.TrainerSchedule (
  IdTrainerSchedule INT NOT NULL AUTO_INCREMENT,
  idTrainers INT NOT NULL,
  idClassroom INT NOT NULL,
  idSchedule INT NOT NULL,
  PRIMARY KEY (IdTrainerSchedule),
        CONSTRAINT fk_TrainerSchedule_Trainers1
    FOREIGN KEY (idTrainers)
    REFERENCES CampusLands_erp.Trainers (IdTrainers)
    
    ,
  CONSTRAINT fk_TrainerSchedule_Classroom1
    FOREIGN KEY (idClassroom)
    REFERENCES CampusLands_erp.Classroom (IdClassroom)
    
    ,
  CONSTRAINT fk_TrainerSchedule_Schedule1
    FOREIGN KEY (idSchedule)
    REFERENCES CampusLands_erp.Schedule (IdSchedule)
    
    );