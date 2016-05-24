package practica.eduardo.model;

import java.util.Date;

public class Ruta {
	private int id;
    private String nombre;
    private String informacion;
    private int dificultad;
    private int puntuacion;
    private String imagen;
    private Date created_at;
    private int user_id;
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getDificultad() {
		return dificultad;
	}
	public void setDificultad(int dificultad) {
		this.dificultad = dificultad;
	}
	public String getInformacion() {
		return informacion;
	}
	public void setInformacion(String informacion) {
		this.informacion = informacion;
	}
	public int getPuntuacion() {
		return puntuacion;
	}
	public void setPuntuacion(int puntuacion) {
		this.puntuacion = puntuacion;
	}
	public String getImagen() {
		return imagen;
	}
	public void setImagen(String imagen) {
		this.imagen = imagen;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
    @Override
    public String toString() {
        return "Ruta [id=" + id + ", nombre=" + nombre
                + ", informacion=" + informacion + ", fecha=" + created_at + ", usuario="
                + user_id + "]";
    }
}
