package practica.eduardo.walkers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import practica.eduardo.dao.RutaDao;
import practica.eduardo.model.Ruta;
import practica.eduardo.model.Usuario;

/**
 * Servlet implementation class AddRuta
 */
public class AddRutaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private RutaDao dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRutaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        
        try {
			dao = new RutaDao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String action = request.getParameter("action");
        /*if (action == null) {
        	RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/Index.jsp");
            jspPage.forward(request, response);
        }*/

        if (user != null) {
        	Usuario userdb = new Usuario();
        	userdb.setId(user.getUserId());
        	userdb.setNombre(user.getNickname());
        	userdb.setEmail(user.getEmail());
        	
        	// Add user into database if not exists
        	dao.addUser(userdb);
        	
			String forward="";
	        
	        //PrintWriter out = response.getWriter();
			//out.println(action);
	        if (action == null) {
	        	RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/Index.jsp");
	            jspPage.forward(request, response);
	        }
	        else if (action.equalsIgnoreCase("listRuta")){
	        	request.setAttribute("rutas", dao.getAllRutas());
	        	RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/listRuta.jsp");
	            jspPage.forward(request, response);
			}
			else if (action.equalsIgnoreCase("delete")) {
				int rutaId = Integer.parseInt(request.getParameter("id"));
	            dao.deleteRuta(rutaId);
	            request.setAttribute("rutas", dao.getAllRutas()); 
	            RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/listRuta.jsp");
	            jspPage.forward(request, response);
			}
			else if (action.equalsIgnoreCase("edit")) {
				forward = "/ruta.jsp";
	            int id = Integer.parseInt(request.getParameter("id"));
	            Ruta ruta = dao.getRutaById(id);
	            request.setAttribute("ruta", ruta);
			}
			else if (action.equalsIgnoreCase("insert")) {
				forward = "/ruta.jsp";
			}
	
	        RequestDispatcher view = request.getRequestDispatcher(forward);
	        view.forward(request, response);
        }
        else {
			response.sendRedirect(userService.createLoginURL("/Index.jsp"));
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Dentro del post");
		

		try {
			out.println("DAO creada");

			dao = new RutaDao();
			
			Ruta ruta = new Ruta();
			ruta.setNombre(request.getParameter("nombre"));
			ruta.setInformacion(request.getParameter("informacion"));
			ruta.setDificultad(Integer.parseInt(request.getParameter("dificultad")));
			ruta.setPuntuacion(Integer.parseInt(request.getParameter("puntuacion")));
			
	        //dao.addRuta(ruta);
			String rutaId = request.getParameter("id");
	        if(rutaId == null || rutaId.isEmpty())
	        {
	            dao.addRuta(ruta);
	        }
	        else
	        {
	        	ruta.setId(Integer.parseInt(rutaId));
	            dao.updateRuta(ruta);
	        }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("rutas", dao.getAllRutas());
		RequestDispatcher view = request.getRequestDispatcher("/listRuta.jsp");
        //request.setAttribute("users", dao.getAllUsers());
		view.forward(request, response);
    }
}
