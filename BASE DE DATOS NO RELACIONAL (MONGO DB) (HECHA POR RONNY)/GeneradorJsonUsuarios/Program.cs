using System;
using System.Security.Cryptography;
using System.Text;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Xml;


//El json que se genera en la consola, pegarlo en la coleccion de usuarios en mongodb
class Program
{
    static void Main()
    {
        List<Usuario> usuarios = new List<Usuario>
        {
            new Usuario("Juan Pérez", "juanp", "Masculino", "Amante del fútbol.", "juanp@mail.com", "pass123", "activo", "1995-03-15T00:00:00Z"),
            new Usuario("María Gómez", "mariag", "Femenino", "Me encanta viajar.", "mariag@mail.com", "pass456", "activo", "1992-07-21T00:00:00Z"),
            new Usuario("Carlos López", "carlosl", "Masculino", "Cine y tecnología.", "carlosl@mail.com", "pass789", "activo", "1988-11-03T00:00:00Z"),
            new Usuario("Ana Torres", "anatorres", "Femenino", "Amante de los libros.", "ana@mail.com", "pass101", "suspendido", "1999-05-29T00:00:00Z"),
            new Usuario("Pedro Díaz", "pedrod", "Masculino", "Fotógrafo aficionado.", "pedro@mail.com", "pass202", "bloqueado", "1990-12-10T00:00:00Z"),
            new Usuario("Lucía Fernández", "luciaf", "Femenino", "Música y arte.", "lucia@mail.com", "pass303", "activo", "2000-06-25T00:00:00Z"),
            new Usuario("Javier Ortega", "javiero", "Masculino", "Fanático de los videojuegos.", "javier@mail.com", "pass404", "activo", "1993-09-08T00:00:00Z"),
            new Usuario("Sofía Herrera", "sofiaher", "Femenino", "Amante de los animales.", "sofia@mail.com", "pass505", "activo", "1997-04-14T00:00:00Z"),
            new Usuario("Andrés Castro", "andresc", "Masculino", "Runner y montañista.", "andres@mail.com", "pass606", "activo", "1991-01-31T00:00:00Z"),
            new Usuario("Paula Rojas", "paular", "Femenino", "Cocina y repostería.", "paula@mail.com", "pass707", "activo", "1985-08-20T00:00:00Z"),

            new Usuario("David Salazar", "davids", "Masculino", "Apasionado por la programación.", "david@mail.com", "pass909", "activo", "1994-12-06T00:00:00Z"),
            new Usuario("Elena Cruz", "elenac", "Femenino", "Yoga y meditación.", "elena@mail.com", "pass010", "activo", "1987-03-11T00:00:00Z"),
            new Usuario("Sergio Mendoza", "sergiom", "Masculino", "Me gusta el ajedrez.", "sergio@mail.com", "pass111", "activo", "1995-09-17T00:00:00Z"),
            new Usuario("Camila Duarte", "camilad", "Femenino", "Aprendiendo idiomas.", "camila@mail.com", "pass222", "activo", "1998-12-24T00:00:00Z"),
            new Usuario("Fernando Ruiz", "fernandor", "Masculino", "Aficionado a la astronomía.", "fernando@mail.com", "pass333", "activo", "1990-05-30T00:00:00Z"),
            new Usuario("Gabriela Soto", "gabrielas", "Femenino", "Me encanta la moda.", "gabriela@mail.com", "pass444", "activo", "2001-06-18T00:00:00Z"),
            new Usuario("Roberto Vargas", "robertov", "Masculino", "Músico de corazón.", "roberto@mail.com", "pass555", "activo", "1986-10-05T00:00:00Z"),
            new Usuario("Angela Morales", "angelam", "Femenino", "Fanática de la tecnología.", "angela@mail.com", "pass666", "activo", "1993-07-08T00:00:00Z"),
            new Usuario("Cristian López", "cristianl", "Masculino", "Guitarrista y viajero.", "cristian@mail.com", "pass777", "activo", "1997-11-22T00:00:00Z"),
            new Usuario("Patricia Ramírez", "patriciar", "Femenino", "Escritora en progreso.", "patricia@mail.com", "pass888", "activo", "1989-08-14T00:00:00Z")
        };

        string jsonOutput = JsonConvert.SerializeObject(usuarios, Newtonsoft.Json.Formatting.Indented);
        Console.WriteLine(jsonOutput);
    }

    public class Usuario
    {
        public string Nombre { get; set; }
        public string Username { get; set; }
        public string Genero { get; set; }
        public string Biografia { get; set; }
        public string Correo { get; set; }
        public string Contrasena { get; set; }
        public string Estado { get; set; }
        public string FechaNacimiento { get; set; }

        public Usuario(string nombre, string username, string genero, string biografia, string correo, string contrasena, string estado, string fechaNacimiento)
        {
            Nombre = nombre;
            Username = username;
            Genero = genero;
            Biografia = biografia;
            Correo = correo;
            Contrasena = HashPassword(contrasena);
            Estado = estado;
            FechaNacimiento = fechaNacimiento;
        }

        private static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hashBytes = sha256.ComputeHash(bytes);
                return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
            }
        }
    }
}
