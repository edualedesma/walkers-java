package practica.eduardo.model;

import java.util.Date;

public class Usuario {
	private String id;
    private String email;
    private String nombre;
    private Date created_at;
    
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
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
                + ", email=" + email + "]";
    }
}
