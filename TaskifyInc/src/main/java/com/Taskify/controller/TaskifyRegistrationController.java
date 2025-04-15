package com.Taskify.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;


import com.Taskify.model.memberModel;
import com.Taskify.model.userModel;
import com.Taskify.service.taskifyRegisterService;

/**
 * Servlet implementation class registrationController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class TaskifyRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final taskifyRegisterService taskifyRegistrationService=new taskifyRegisterService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskifyRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			userModel userModelDetails = extractUserModel(request);
			memberModel memberModelDetails= extractMemberModel(request);
			
			Boolean enteredrows=taskifyRegistrationService.registerUserandMember(userModelDetails,memberModelDetails);
			if(enteredrows!=false) {
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	  private userModel extractUserModel(HttpServletRequest req) throws Exception {
	        String username = req.getParameter("userName");
	        String password = req.getParameter("password");
	        return new userModel(username, password);
	    }

	    private memberModel extractMemberModel(HttpServletRequest req) throws Exception {
	        String firstName = req.getParameter("firstName");
	        String lastName = req.getParameter("lastName");
	        LocalDate dob = LocalDate.parse(req.getParameter("dob"));
	        String gender = req.getParameter("gender");
	        String email = req.getParameter("email");
	        int number = Integer.parseInt(req.getParameter("phoneNumber"));
	
	        return new memberModel(firstName, lastName, dob, gender, email, number);
	    }
}
