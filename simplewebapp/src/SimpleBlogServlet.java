import simplewebapp.Article;
import simplewebapp.ArticleDAO;
import simplewebapp.UserDao;
import simplewebapp.UserVo;

import java.io.*;
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

		if (request.getParameter("article") != null) {
			displayArticle(request, response);
		} else {
			displayHome(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		System.out.println("Email is: " + request.getParameter("email"));
		System.out.println("Step0" + request.getParameter("action"));
		/*
		 * We need to check to see whether the user is attempting to login or
		 * register. At this point, we are checking to see if he's trying to
		 * register by validating the email parameter
		 */
		if (request.getParameter("action") != null) {
			System.out.println("step1");
			String action = (String) request.getParameter("action");
			String userName = request.getParameter("username");
			System.out.println("username is" + userName);
			String userPassword = request.getParameter("password");
			String userEmail = request.getParameter("email");
			String userConfirm = request.getParameter("confirm");

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

					request.getRequestDispatcher("/Register.jsp").forward(request, response);
				}

			} else {
				UserVo updateUser = (UserVo) request.getSession().getAttribute("userDetails");
				System.out.println("entered Upodate");
				updateUser.setUserName(userName);
				System.out.println(userName);
				updateUser.setUserPassword(userPassword);
				updateUser.setUserEmail(userEmail);
				updateUser.setUserconfirm(userConfirm);

				UserDao userDao = new UserDao();
				userDao.updateUserProfile(updateUser);

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

				displayHome(request, response);

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
}