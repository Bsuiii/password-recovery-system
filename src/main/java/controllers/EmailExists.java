package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.google.gson.Gson;

import dao.UserDAO;
import model.User;
import util.EmailSender;

/**
 * Servlet implementation class EmailExists
 */
@MultipartConfig
@WebServlet("/Email/Exists")
public class EmailExists extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailExists() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");
	String email=request.getParameter("user-email");
	System.out.println(email);
	UserDAO userDAO=new UserDAO();
	int id=-1;
	User user=userDAO.emailExists(email);
	int pin=0000;
	if(user!=null) {
		id=Integer.parseInt(user.getId());
		EmailSender emSender=new EmailSender();
		pin=new Random().nextInt(9000)+1000;
		userDAO.updatePin(id,pin);
		emSender.sendEmailTo(email, user.getFullName(),pin);
		}
	
	PrintWriter out =response.getWriter();
	String json=new Gson().toJson(id);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.print(json);
	out.flush();
	
			
			
	}
	public static void main(String[] args) {
		System.out.println(new UserDAO().emailExists("haitambessi@gmail.com"));
	}

}
