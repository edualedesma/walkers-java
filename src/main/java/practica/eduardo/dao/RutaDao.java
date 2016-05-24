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

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

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
	
	public void addRuta(Ruta ruta) {
        try {
        	UserService userService = UserServiceFactory.getUserService();
            User user = userService.getCurrentUser();
        	
        	//Connection connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection
                    .prepareStatement("insert into Rutas (nombre, informacion, dificultad, puntuacion, user_id) values (?, ?, ?, ?, ?)");
            // Parameters start with 1
            preparedStatement.setString(1, ruta.getNombre());
            preparedStatement.setString(2, ruta.getInformacion());
            preparedStatement.setInt(3, ruta.getDificultad());
            preparedStatement.setInt(4, ruta.getPuntuacion());
            preparedStatement.setString(5, user.getUserId());
            
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

    public void updateRuta(Ruta ruta) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("update Rutas set nombre=?, informacion=?, dificultad=?, puntuacion=? " +
                            "where id=?");
            // Parameters start with 1
            preparedStatement.setString(1, ruta.getNombre());
            preparedStatement.setString(2, ruta.getInformacion());
            preparedStatement.setInt(3, ruta.getDificultad());
            preparedStatement.setInt(4, ruta.getPuntuacion());
            preparedStatement.setInt(5, ruta.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Ruta> getAllRutas() {
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
    	
        List<Ruta> rutas = new ArrayList<Ruta>();
        try {
        	
            //Statement statement = connection.createStatement();
            //ResultSet rs = statement.executeQuery("select * from Rutas");
            
            PreparedStatement preparedStatement = connection
                    .prepareStatement("select * from Rutas where user_id=?");
            preparedStatement.setString(1, user.getUserId());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Ruta ruta = new Ruta();
                ruta.setId(rs.getInt("id"));
                ruta.setNombre(rs.getString("nombre"));
                ruta.setInformacion(rs.getString("informacion"));
                ruta.setDificultad(rs.getInt("dificultad"));
                ruta.setPuntuacion(rs.getInt("puntuacion"));
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
                ruta.setDificultad(rs.getInt("dificultad"));
                ruta.setPuntuacion(rs.getInt("puntuacion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ruta;
    }
}
