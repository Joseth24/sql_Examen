/* vizualizar los medicos que tienen empleados */
CREATE VIEW vw_Medico
AS
SELECT Medicos.NomMedico AS 'Nombre del Medico', Medicos.DNIMedico AS 'DNI del Medico',
Empleados.NomEmpleado as 'Nombre del Empledao'
FROM Medicos
INNER JOIN Empleados ON Medicos.Empleados_IdEmpleados = Empleados.IdEmpleados
GO
/* Ejecutamos la Vista */
SELECT * FROM vw_Medico
GO

/* vizualizar los pacientes y el medico que lo atendio + el medico sustituto */
CREATE VIEW vw_Paciente
AS
SELECT Pacientes.NomPaciente AS 'Nombre del Paciente', Pacientes.TelPaciente AS 'Telefono del Paciente',
Pacientes.DirPaciente AS 'Dirección del Paciente',Medicos.NomMedico AS 'Nombre del Medico Titular',
MedicosSutitutos.NomMedicoSus AS 'Nombre del Medico Sustituto'
FROM Pacientes
INNER JOIN Medicos ON Pacientes.Medicos_IdMedicos = Medicos.IdMedicos
INNER JOIN MedicosSutitutos ON Pacientes.MedicosSutitutos_IdMedicosSus = MedicosSutitutos.IdMedicosSus
GO

/* Ejecutamos la Vista vw_Paciente */
SELECT * FROM vw_Paciente
GO

/* vizualizar los medicos Sustitutos Activos */  
CREATE VIEW vw_MedicosSustitutosActivos
AS
SELECT MedicosSutitutos.NomMedicoSus as 'Nombre del Medico Sustituto', MedicosSutitutos.DirMedicoSus AS 'Dirección',
MedicosSutitutos.DNIMedicoSus as 'DNI',MedicosSutitutos.TelMedicoSus as 'Telefono',
MedicosSutitutos.EstadoMedicoSus AS 'Estado'
from MedicosSutitutos
WHERE EstadoMedicoSus like 'Activo'
GO
/* ejecutamos la vista vw_MedicosSustitutosActivos */
SELECT * FROM vw_MedicosSustitutosActivos
GO

/* vizualizar el medico Sustituto y a que medico va a Reemplazar */
CREATE VIEW vw_MedicosSustReemplazar
AS
SELECT MedicosSutitutos.NomMedicoSus as 'Nombre del Medico Sustituto', MedicosSutitutos.DirMedicoSus AS 'Dirección',
MedicosSutitutos.DNIMedicoSus as 'DNI',MedicosSutitutos.TelMedicoSus as 'Telefono',
Medicos.NomMedico AS 'Medico a Reemplazar'
from MedicosSutitutos
INNER JOIN Medicos ON MedicosSutitutos.Medicos_IdMedicos = Medicos.IdMedicos
Go
/* ejecutamos la Vista  vw_MedicosSustReemplazar*/
SELECT * FROM vw_MedicosSustReemplazar
GO