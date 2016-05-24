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

import practica.eduardo.dao.RutaDao;
import practica.eduardo.model.Ruta;

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
		try {
			dao = new RutaDao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String forward="";
        String action = request.getParameter("action");
        
        //PrintWriter out = response.getWriter();
		//out.println(action);
		
		if (action.equalsIgnoreCase("listRuta")){
        	request.setAttribute("rutas", dao.getAllRutas());
        	RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/listRuta.jsp");
            jspPage.forward(request, response);
		}

        /*if (action.equalsIgnoreCase("delete")){
            int rutaId = Integer.parseInt(request.getParameter("id"));
            dao.deleteRuta(rutaId);
            forward = "/listRuta.jsp";
            request.setAttribute("rutas", dao.getAllRutas());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = "/ruta.jsp";
            int id = Integer.parseInt(request.getParameter("id"));
            Ruta ruta = dao.getRutaById(id);
            request.setAttribute("ruta", ruta);
        } else if (action.equalsIgnoreCase("listRuta")){
        	out.println("PINTAME");
        	request.setAttribute("rutas", dao.getAllRutas());
        	//RequestDispatcher jspPage = getServletContext().getRequestDispatcher( "/listRuta.jsp");
            //jspPage.forward(request, response);
        } else {
            forward = "/ruta.jsp";
        }*/

        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("Dentro del post");
		

		/*try {
			out.println("DAO creada");

			dao = new RutaDao();
			
			Ruta ruta = new Ruta();
			ruta.setNombre(request.getParameter("nombre"));
			ruta.setInformacion(request.getParameter("informacion"));
			
	        dao.addRuta(ruta);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
        //ruta.setEmail(request.getParameter("email"));
        //String userid = request.getParameter("userid");
        //if(userid == null || userid.isEmpty())
        //{
        //    dao.addUser(ruta);
        //}
        //else
        //{
        //	ruta.setUserid(Integer.parseInt(userid));
        //    dao.updateUser(ruta);
        //}
      //  RequestDispatcher view = request.getRequestDispatcher("Index.jsp");
        //request.setAttribute("users", dao.getAllUsers());
      //  view.forward(request, response);*/
    }
}
