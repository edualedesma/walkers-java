package practica.eduardo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import practica.eduardo.model.Ruta;



public class RutaDao {
	
	Connection connection;

	public RutaDao() throws SQLException {
		String url;
        if (System
            .getProperty("com.google.appengine.runtime.version").startsWith("Google App Engine/")) {
          // Check the System properties to determine if we are running on appengine or not
          // Google App Engine sets a few system properties that will reliably be present on a remote
          // instance.
          url = System.getProperty("ae-cloudsql.cloudsql-database-url");
          try {
            // Load the class that provides the new "jdbc:google:mysql://" prefix.
            Class.forName("com.mysql.jdbc.GoogleDriver");
          } catch (ClassNotFoundException e) {
            try {
				throw new ServletException("Error loading Google JDBC Driver", e);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
          }
        }
        else {
          // Set the url with the local MySQL database connection url when running locally
          url = System.getProperty("ae-cloudsql.local-database-url");
        }
        
        connection = DriverManager.getConnection(url);

    }
	
	public void addRuta(Ruta user) {
        try {
        	//Connection connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into Rutas (nombre, informacion) values (?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, user.getNombre());
            preparedStatement.setString(2, user.getInformacion());
            //preparedStatement.setDate(3, ); insert new date
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteRuta(int rutaId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from Rutas where id=?");
            // Parameters start with 1
            preparedStatement.setInt(1, rutaId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /*public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update users set firstname=?, lastname=?, dob=?, email=?" +
                            "where userid=?");
            // Parameters start with 1
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setInt(5, user.getUserid());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

    public List<Ruta> getAllRutas() {
        List<Ruta> rutas = new ArrayList<Ruta>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Rutas");
            while (rs.next()) {
                Ruta ruta = new Ruta();
                ruta.setId(rs.getInt("id"));
                ruta.setNombre(rs.getString("nombre"));
                ruta.setInformacion(rs.getString("informacion"));
                rutas.add(ruta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rutas;
    }

    public Ruta getRutaById(int id) {
        Ruta ruta = new Ruta();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from Rutas where id=?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                ruta.setId(rs.getInt("id"));
                ruta.setNombre(rs.getString("nombre"));
                ruta.setInformacion(rs.getString("informacion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ruta;
    }
}
