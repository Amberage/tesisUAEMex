CREATE DATABASE UAEMEX;

USE UAEMEX;

CREATE TABLE alumnos(
    matricula INT PRIMARY KEY,
    idAlumno INT,
    idPersona INT,
    nombre VARCHAR(255),
    licenciatura VARCHAR(255),
    plantel VARCHAR(255)
);
