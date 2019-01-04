package in.bushansirgur.vis.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.bushansirgur.vis.model.Authorities;

/**
 * Represents the DAO implementation for Authorities related use cases
 * */
@Repository
public class AuthoritiesDAOImpl implements AuthorityDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * Retrieves the Authorities list
	 * @return list
	 * */
	@Transactional
	@Override
	public List<Authorities> list() {
		List<Authorities> list = null;
		try {
			list = new ArrayList<Authorities>();
			Query<Authorities> query = sessionFactory.getCurrentSession().createQuery("from Authorities");
			list = query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

}
