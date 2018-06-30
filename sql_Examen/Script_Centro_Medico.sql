-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-06-30 14:15:19.818

-- tables
-- Table: Empleados
CREATE TABLE Empleados (
    IdEmpleados int  ,
    NomEmpleado varchar(50)  ,
    DirEmpleado varchar(50)  ,
    TelEmpleado char(7)  ,
    PoblaEmpleado varchar(50)  ,
    ProvEmpelado varchar(50)  ,
    DNIEmpleado char(8)  ,
    NumSegSociEmpleado char(20)  ,
    TipEmpleado varchar(50)  ,
    CONSTRAINT Empleados_pk PRIMARY KEY  (IdEmpleados)
);

-- Table: Medicos
CREATE TABLE Medicos (
    IdMedicos int  ,
    NomMedico varchar(50)  ,
    DirMedico varchar(50)  ,
    TelMedico char(7)  ,
    PoblaMedico varchar(50)  ,
    ProvMedico varchar(50)  ,
    DNIMedico char(8)  ,
    NumSegSocialMedico char(10)  ,
    NumDeColegiMedico char(20)  ,
    TipMedico varchar(50)  ,
    HoraMedico varchar(50)  ,
    Empleados_IdEmpleados int  ,
    VacacionMedico date  ,
    CONSTRAINT Medicos_pk PRIMARY KEY  (IdMedicos)
);

-- Table: MedicosSutitutos
CREATE TABLE MedicosSutitutos (
    IdMedicosSus int  ,
    NomMedicoSus varchar(50)  ,
    DirMedicoSus varchar(50)  ,
    TelMedicoSus char(7)  ,
    PoblaMedicoSus varchar(50)  ,
    ProvMedicoSus varchar(50)  ,
    DNIMedicoSus char(8)  ,
    NumSegSocialMedicoSus char(10)  ,
    NumDeColegiMedicoSus char(20)  ,
    TipMedicoSus varchar(50)  ,
    EstadoMedicoSus varchar(10)  ,
    FecAltaMedicoSus date  ,
    FecBajaMedicoSus date  ,
    HoraMedicoSus varchar(50)  ,
    Medicos_IdMedicos int  ,
    CONSTRAINT MedicosSutitutos_pk PRIMARY KEY  (IdMedicosSus)
);

-- Table: Pacientes
CREATE TABLE Pacientes (
    IdPaciente int  ,
    NomPaciente varchar(50)  ,
    DirPaciente varchar(50)  ,
    TelPaciente char(7)  ,
    NumSegSocial char(20)  ,
    Medicos_IdMedicos int  ,
    MedicosSutitutos_IdMedicosSus int  ,
    CONSTRAINT Pacientes_pk PRIMARY KEY  (IdPaciente)
);

-- foreign keys
-- Reference: MedicosSutitutos_Medicos (table: MedicosSutitutos)
ALTER TABLE MedicosSutitutos ADD CONSTRAINT MedicosSutitutos_Medicos
    FOREIGN KEY (Medicos_IdMedicos)
    REFERENCES Medicos (IdMedicos);

-- Reference: Medicos_Empleados (table: Medicos)
ALTER TABLE Medicos ADD CONSTRAINT Medicos_Empleados
    FOREIGN KEY (Empleados_IdEmpleados)
    REFERENCES Empleados (IdEmpleados);

-- Reference: Pacientes_Medicos (table: Pacientes)
ALTER TABLE Pacientes ADD CONSTRAINT Pacientes_Medicos
    FOREIGN KEY (Medicos_IdMedicos)
    REFERENCES Medicos (IdMedicos);

-- Reference: Pacientes_MedicosSutitutos (table: Pacientes)
ALTER TABLE Pacientes ADD CONSTRAINT Pacientes_MedicosSutitutos
    FOREIGN KEY (MedicosSutitutos_IdMedicosSus)
    REFERENCES MedicosSutitutos (IdMedicosSus);

-- End of file.

