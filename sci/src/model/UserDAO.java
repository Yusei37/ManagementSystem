package model;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDAO {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public UserDAO(){
		
	};
	
	public synchronized List listAllUser() {
		List<User> users = getSession().createQuery("from User where userId <> 'admin'").list();
		return users;
	}
	
	public synchronized void addUser(User user) {
		getSession().save(user);
	}
	
	public synchronized void saveUser(User user) {
		getSession().update(user);
	}
	
	public synchronized String deleteUser(String userId) {
		Query query = getSession().createQuery("from Sci where userId = ?0 and status <> '不通过' and endDate > ?1");
		query.setParameter(0, userId);
		query.setTimestamp(1, new Date());
		if (query.list().size() > 0) {
			return "fail";
		}
		User user = getSession().get(User.class, userId);
		getSession().delete(user);
		return "ok";
	}
	
	public synchronized User readUser(String userId) {
		User user = getSession().get(User.class, userId);
		return user;
	}
}
