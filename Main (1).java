// Clase Base (Padre)
class Material {
    protected String titulo;
    protected boolean prestado;

    public Material(String titulo) {
        this.titulo = titulo;
        this.prestado = false;
    }

    public void mostrarDetalles() {
        System.out.print("Título: " + titulo + " | Estado: " + (prestado ? "Prestado" : "Disponible"));
    }
}

// Clase Derivada 1 (Hija) - Aplica HERENCIA
class Libro extends Material {
    private String autor;

    public Libro(String titulo, String autor) {
        super(titulo); // Reutiliza el constructor del padre
        this.autor = autor;
    }

    @Override
    public void mostrarDetalles() {
        super.mostrarDetalles(); // Reutiliza el método del padre
        System.out.println(" | Autor: " + autor);
    }
}

// Clase Derivada 2 (Hija) - Aplica HERENCIA
class Revista extends Material {
    private int numeroEdicion;

    public Revista(String titulo, int numeroEdicion) {
        super(titulo);
        this.numeroEdicion = numeroEdicion;
    }

    @Override
    public void mostrarDetalles() {
        super.mostrarDetalles();
        System.out.println(" | Edición N°: " + numeroEdicion);
    }
}

// Programa Principal
public class Main {
    public static void main(String[] args) {
        System.out.println("--- Sistema de Biblioteca (Herencia) ---");

        // Instanciamos objetos de las subclases
        Libro miLibro = new Libro("Java a Fondo", "Pablo Sznajdleder");
        Revista miRevista = new Revista("National Geographic", 254);

        // Probamos los métodos para verificar la herencia
        miLibro.mostrarDetalles();
        miRevista.mostrarDetalles();
    }
}