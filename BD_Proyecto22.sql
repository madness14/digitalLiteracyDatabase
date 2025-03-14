drop database if exists prueba1;
CREATE DATABASE prueba1;
USE prueba1;

CREATE TABLE Tipo_Usuario (
    ID_Tipo_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(100)
);

CREATE TABLE Continente (
    Codigo_Continente INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Area DECIMAL(10,2),
    Poblacion INT
);

CREATE TABLE Pais (
    Codigo_Pais INT PRIMARY KEY,
    Codigo_Continente INT,
    Nombre VARCHAR(255),
    Area DECIMAL(10,2),
    Poblacion INT,
    FOREIGN KEY (Codigo_Continente) REFERENCES Continente(Codigo_Continente)
);

CREATE TABLE Estado (
    Codigo_Estado INT PRIMARY KEY,
    Codigo_Pais INT,
    Nombre VARCHAR(255),
    Area DECIMAL(10,2),
    Poblacion INT,
    FOREIGN KEY (Codigo_Pais) REFERENCES Pais(Codigo_Pais)
);

CREATE TABLE Ciudad (
    Codigo_Ciudad INT PRIMARY KEY,
    Codigo_Estado INT,
    Nombre VARCHAR(255),
    Area DECIMAL(10,2),
    Poblacion INT,
    FOREIGN KEY (Codigo_Estado) REFERENCES Estado(Codigo_Estado)
);

CREATE TABLE Cargo (
    ID_Cargo INT PRIMARY KEY,
    Titulo VARCHAR(255),
    Descripcion TEXT,
    Tipo_Usuario INT,
    FOREIGN KEY (Tipo_Usuario) REFERENCES Tipo_Usuario(ID_Tipo_Usuario)
);

CREATE TABLE Organizacion (
    ID_Organizacion INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Lenguaje VARCHAR(50),
    Tipo VARCHAR(100),
    Sitio_Web VARCHAR(255),
    Estado VARCHAR(50)
);

CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY,
    ID_Organizacion INT,
    Nombre VARCHAR(255),
    Telefono VARCHAR(20),
    Correo VARCHAR(255),
    ID_Cargo INT,
    FOREIGN KEY (ID_Organizacion) REFERENCES Organizacion(ID_Organizacion),
    FOREIGN KEY (ID_Cargo) REFERENCES Cargo(ID_Cargo)
);

ALTER TABLE Organizacion ADD COLUMN Responsable INT, 
ADD FOREIGN KEY (Responsable) REFERENCES Usuario(ID_Usuario);

CREATE TABLE Usuario_Tipo (
    ID_Usuario INT,
    ID_Tipo_Usuario INT,
    PRIMARY KEY (ID_Usuario, ID_Tipo_Usuario),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Tipo_Usuario) REFERENCES Tipo_Usuario(ID_Tipo_Usuario)
);

CREATE TABLE Proyecto (
    ID_Proyecto INT PRIMARY KEY,
    ID_Organizacion INT,
    Nombre VARCHAR(255),
    Estado VARCHAR(50),
    Descripcion TEXT,
    Recursos TEXT,
    Participantes TEXT,
    Fondos_Solicitados DECIMAL(15,2),
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    id_Encargado INT,
    FOREIGN KEY (ID_Organizacion) REFERENCES Organizacion(ID_Organizacion),
    FOREIGN KEY (Encargado) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Poblacion (
    ID_Poblacion INT PRIMARY KEY,
    Edad INT,
    Codigo_Ciudad INT,
    ID_Proyecto INT,
    FOREIGN KEY (Codigo_Ciudad) REFERENCES Ciudad(Codigo_Ciudad),
    FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto)
);

CREATE TABLE Actividad (
    ID_Actividad INT PRIMARY KEY,
    Nombre varchar(50) not null unique,
    Descripcion TEXT, --cambiar?
    ID_Organizacion INT,
    ID_Proyecto INT,
    ID_Poblacion INT,
    ID_Costos INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Responsable INT,
    FOREIGN KEY (ID_Costos) REFERENCES Costos(ID_Costos)
    FOREIGN KEY (Responsable) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Organizacion) REFERENCES Organizacion(ID_Organizacion),
    FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto(ID_Proyecto),
    FOREIGN KEY (ID_Poblacion) REFERENCES Poblacion(ID_Poblacion)
);

CREATE TABLE Telefono (
    Telefono VARCHAR(20) PRIMARY KEY,
    Prefijo VARCHAR(5),
    ID_Usuario INT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Correo (
    Correo VARCHAR(255) PRIMARY KEY,
    ID_Usuario INT,
    Dominio VARCHAR(100),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Datos_Fiscales (
    RFC VARCHAR(20) PRIMARY KEY,
    ID_Organizacion INT,
    Regimen VARCHAR(255),
    FOREIGN KEY (ID_Organizacion) REFERENCES Organizacion(ID_Organizacion)
);

create table Tipo_Apoyo (
    ID_transaccion int primary key,
    tipo_transaccion varchar(20) not null,
    proveedor varchar(30) not null,
    rfc varchar(20),
    monto_otorgado decimal(15, 2) not null,
    foreign key (rfc) references datos_fiscales(rfc)
)

CREATE TABLE Recursos_Financieros (
    ID_Recurso INT PRIMARY KEY,
    Presupuesto_Solicitado DECIMAL(15,2),
    Presupuesto_Otorgado DECIMAL(15,2),
    ID_Organizacion INT,
    Divisa VARCHAR(10),
    ID_transaccion INT,
    FOREIGN KEY (ID_Organizacion) REFERENCES Organizacion(ID_Organizacion),
    FOREIGN KEY (ID_transaccion) REFERENCES Tipo_Apoyo(ID_transaccion)
);

CREATE TABLE Costos (
    ID_Costos INT PRIMARY KEY not null,
    Costo_RH DECIMAL(15,2) not null,
    Costo_Material DECIMAL(15,2) not null,
    Costo_Financiero DECIMAL(15,2) not null,
    Costo_Total DECIMAL(15,2) not null, -- procedimiento a futuro 
    FOREIGN KEY (ID_Costos) REFERENCES Actividad(ID_Costos)
);
