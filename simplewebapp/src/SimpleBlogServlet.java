import simplewebapp.Article;
import simplewebapp.ArticleDAO;
import simplewebapp.UserDao;
import simplewebapp.UserVo;

import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.net.ssl.SSLSession;
import javax.servlet.*;
import javax.servlet.http.*;

public class SimpleBlogServlet extends HttpServlet {

	/** Identify the version of this class for serialization */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("logout") != null) {
			request.getSession().invalidate();
		}
// check article id and if it is not null display all info in  home page else dont display article
		
		if (request.getParameter("article") != null) {
			if (request.getParameter("edit") != null) {
				editArticle(request, response);
			} else {
				// Getting the instance of the ArticleDAO
				ArticleDAO articleDAO = ArticleDAO.getInstance();
				// Parsing the parameter to an int
				int id = Integer.parseInt(request.getParameter("article"));
				// Getting all the articles as a list
				Article a = articleDAO.getByArticleID(id);
				request.setAttribute("Article", a);
				displayHome(request, response);
			}
		} else {
			displayHome(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("Step0" + request.getParameter("action"));
		// goto edit article if the article paramater is set in the request
		if (request.getParameter("article") != null) {
			editArticle(request, response);
			return;
		} 
		/*
		 * We need to check to see whether the user is attempting to login or
		 * register or update. At this point, we are checking the
		 * action(register or update if not both it goes to login part atlast)
		 * from the form get all the request parameters from the user to check
		 * the information
		 **/

		if (request.getParameter("action") != null) {
			System.out.println("step1");
			String action = (String) request.getParameter("action");
			String userName = request.getParameter("username");
			System.out.println("username is" + userName);
			String userPassword = request.getParameter("password");
			String userConfirm = request.getParameter("userconfirm");
			String userEmail = request.getParameter("email");
			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String occupation = request.getParameter("occupation");
			String birthday = request.getParameter("birthday");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String travel = request.getParameter("travel");
			String favourite = request.getParameter("favourite");
			String profilePhoto = request.getParameter("profilePhoto");
			System.out.println("profilePhoto is: "+profilePhoto);
			

			// by using the email parameter checking whether the user is
			// entering the regiter part or update paet
			if (action.equals("register")) {
				System.out.println("step2");
				if (request.getParameter("email") != null) {
					System.out.println("Di got the register part");

					System.out.println(userName);

					UserVo user = new UserVo();

					user.setUserName(userName);
					user.setUserPassword(userPassword);
					user.setUserEmail(userEmail);
					user.setUserconfirm(userConfirm);

					UserDao userDao = new UserDao();

					userDao.insertUser(user);

					//request.getRequestDispatcher("/home.jsp").forward(request, response);
					displayHome(request, response);
				}

			} else {
				UserVo updateUser = (UserVo) request.getSession().getAttribute("userDetails");
				System.out.println("entered Upodate");
				updateUser.setUserName(userName);
				System.out.println(userName);
				updateUser.setUserEmail(userEmail);
				updateUser.setName(name);
				updateUser.setTitle(title);
				updateUser.setOccupation(occupation);
				if (birthday != null) {
					DateFormat format = new SimpleDateFormat("yyyy-mm-dd");
					Date date;
					try {
						date = format.parse(birthday);
						updateUser.setBirthday(date);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					
				}

				updateUser.setCity(city);
				updateUser.setCountry(country);
				updateUser.setTravel(travel);
				updateUser.setFavourite(favourite);
				updateUser.setProfilePhoto(profilePhoto);
				

				UserDao userDao = new UserDao();
				userDao.updateUserProfile(updateUser);
				//request.getRequestDispatcher("/editProfile.jsp").forward(request, response);
				String message = "Your profile details updated successfully";						
				request.setAttribute("message", message);
				displayHome(request, response);

			}
		} else
		/*
		 * Here is where the user is attempting to login. We know this because
		 * email parameter ought to be null
		 */
		{
			UserVo user = new UserVo();
			UserDao userDao = new UserDao();
			String userName = request.getParameter("username");

			String userPassword = request.getParameter("password");
			UserVo checkUserLogin = userDao.judgeUserPassword(userName, userPassword);
			// login is successful
			if (checkUserLogin != null) {
				// set the session once logged in
				HttpSession session = request.getSession();
				session.setAttribute("userDetails", checkUserLogin);

				request.getRequestDispatcher("/editProfile.jsp").forward(request, response);

			} else {
				displayHome(request, response);
			}

		}
	}

	protected void displayHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Getting the instance of the ArticleDAO
		ArticleDAO articleDAO = ArticleDAO.getInstance();

		// Getting all the articles as a list
		List<Article> listOfArticles = articleDAO.getAll();

		request.setAttribute("Articles", listOfArticles);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
		dispatcher.forward(request, response);
	}

	protected void displayArticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Getting the instance of the ArticleDAO
		ArticleDAO articleDAO = ArticleDAO.getInstance();

		// Parsing the parameter to an int
		int id = Integer.parseInt(request.getParameter("article"));

		// Getting all the articles as a list
		Article a = articleDAO.getByArticleID(id);

		request.setAttribute("Article", a);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/article.jsp");
		dispatcher.forward(request, response);
	}
	
	protected void editArticle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Getting the instance of the ArticleDAO
		ArticleDAO articleDAO = ArticleDAO.getInstance();

		// Parsing the parameter to an int
		int id = Integer.parseInt(request.getParameter("article"));
		// Getting all the articles as a list
		Article a = articleDAO.getByArticleID(id);
		
		String action = request.getParameter("articleAction");
		
		if( action != null && action.equals("update")){
			//Article updateArticle = (Article) request.getAttribute("Article");
			String title = request.getParameter("title");
			String body = request.getParameter("body");
			a.setTitle(title);
			a.setBody(body);
			articleDAO.updateArticle(a);		
			
		}
		
		request.setAttribute("Article", a);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editArticle.jsp");
		dispatcher.forward(request, response);
	}
	
	
}