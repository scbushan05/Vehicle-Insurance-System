package in.bushansirgur.vis.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.bushansirgur.vis.model.Authorities;
import in.bushansirgur.vis.model.UserModel;
import in.bushansirgur.vis.util.PasswordEncode;

/**
 * Represents the DAO implementation for user related use cases
 * */
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	BCryptPasswordEncoder bCryptPasswordEncoder = PasswordEncode.encode();
	
	/**
	 * Saves the user object
	 * @param user
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean save(UserModel user) {
		boolean flag = false;
		try {
			String encoded=new BCryptPasswordEncoder().encode(user.getPassword());
			user.setPassword(encoded);
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieves the users list
	 * @return list
	 * */
	@Transactional
	@Override
	public List<UserModel> list() {
		List<UserModel> list = null;
		try {
			list = new ArrayList<UserModel>();
			Query<UserModel> query = sessionFactory.getCurrentSession().createQuery("from UserModel");
			list = query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Retrieves the user object
	 * @param id
	 * @return user
	 * */
	@Transactional
	@Override
	public UserModel get(int id) {
		UserModel user = null;
		try {
			user = (UserModel)sessionFactory.getCurrentSession().get(UserModel.class, id);
			
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return user;
	}

	/**
	 * Delete the user object
	 * @param id
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean delete(int id) {
		boolean flag = false;
		UserModel user = null;
		try {
			Session session = sessionFactory.getCurrentSession();
			user = (UserModel)session.load(UserModel.class, id);
			session.delete(user);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieves the user object based on name
	 * @param name
	 * @return user
	 * */
	@Transactional
	@Override
	public UserModel findUserByName(String name) {
		List<UserModel> list = null;
		UserModel user = null;
		try {
			list = new ArrayList<UserModel>();
			Query<UserModel> query = sessionFactory.getCurrentSession().createQuery("from UserModel where name = :name");
			query.setParameter("name", name);
			list = query.getResultList();
			if(list.size() > 0) {
				user = list.get(0);
			}
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	@Transactional
	@Override
	public boolean changePassword(String newPassword, UserModel user) {
		boolean flag = false;
		try {
			String encoded=new BCryptPasswordEncoder().encode(newPassword);
			user.setPassword(encoded);
			sessionFactory.getCurrentSession().update(user);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}
}
