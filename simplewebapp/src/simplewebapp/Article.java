package simplewebapp;

public class Article {
	private int id;
	private String title;
	private String body;

	Article(int id,String title,String body) {
		this.setId(id);
		this.setTitle(title);
		this.setBody(body);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}



}