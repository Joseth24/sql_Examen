/* SP Para ingresar en la Tabla Medicos */
CREATE PROCEDURE sp_Medicos
    @IdMedicos INT,
    @Nombre VARCHAR(50),
    @Direccion VARCHAR(50),
    @Telefono CHAR(7),
    @Poblacion VARCHAR(50),
    @Provincia VARCHAR(50),
    @DNI CHAR(8),
    @SeguroSocial CHAR(10),
    @Colegiado CHAR(20),
    @TipoMedico VARCHAR(50),
    @Horario VARCHAR(50),
    @EmpleadoId INT,
    @Vacacion CHAR(10)
AS
    BEGIN
        INSERT INTO Medicos
        (IdMedicos,NomMedico,DirMedico,TelMedico,PoblaMedico,ProvMedico,DNIMedico,NumSegSocialMedico,
        NumDeColegiMedico,TipMedico,HoraMedico,Empleados_IdEmpleados,VacacionMedico)
        VALUES(@IdMedicos,@Nombre,@Direccion,@Telefono,@Poblacion,@Provincia,@DNI,@SeguroSocial,@Colegiado,
        @TipoMedico,@Horario,@EmpleadoId,FORMAT( CONVERT(date, @Vacacion, 103),'dd/MM/yyyy','en-gb'));
        SELECT * FROM Medicos
    
    END
GO
/* Ejecutamos el SP_Medicos */
EXEC sp_Medicos @IdMedicos='5',@Nombre='Issac',@Direccion='Tupac',@Telefono='0125436',@Poblacion='San Luis',
                @Provincia='Cañete',@DNI='78965402',@SeguroSocial='96325874017',@Colegiado='01478523699',
                @TipoMedico='Medico Titular',@Horario='Consultas',@EmpleadoId='2',@Vacacion='01/01/2017'
GO

/* SP Para ELiminar datos de la Tabla */
CREATE PROCEDURE sp_MedicoElim
    @Codigo INT
AS
    BEGIN
        DELETE FROM Medicos
            WHERE Medicos.IdMedicos = @Codigo
            SELECT * FROM Medicos
    END
GO

/* Ejecutamos el SP_MedicoELim */
EXEC sp_MedicoElim @Codigo=5
GO
 
/* SP para Listar Datos de la Tabla Medicos */
CREATE PROCEDURE sp_MedicoList
AS
    BEGIN
        SELECT * FROM Medicos
    END
GO
/* Ejecutamos SP_MedicoList */ 
EXEC sp_MedicoList
GO

