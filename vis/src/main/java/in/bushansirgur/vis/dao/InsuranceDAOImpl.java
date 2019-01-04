package in.bushansirgur.vis.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.bushansirgur.vis.model.InsuranceModel;

/**
 * Represents the DAO implementation for Insurance related use cases
 * */
@Repository
public class InsuranceDAOImpl implements InsuranceDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * Saves the insurance object
	 * @param insurance
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean save(InsuranceModel insurance) {
		boolean flag = false;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(insurance);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieves the list of insurance
	 * @return list
	 * */
	@Transactional
	@Override
	public List<InsuranceModel> list() {
		List<InsuranceModel> list = null;
		try {
			list = new ArrayList<InsuranceModel>();
			Query<InsuranceModel> query = sessionFactory.getCurrentSession().createQuery("from InsuranceModel");
			list = query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Delete the insurance object
	 * @param id
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		boolean flag = false; 
		try {
			InsuranceModel insurance = (InsuranceModel)session.load(InsuranceModel.class, id);
			session.delete(insurance);
			flag = true;
		}catch(HibernateException e){
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieve the single Insurance object
	 * @param id
	 * @return insurance
	 * */
	@Transactional
	@Override
	public InsuranceModel get(int id) {
		InsuranceModel insurance = null;
		try {
			insurance = (InsuranceModel)sessionFactory.getCurrentSession().get(InsuranceModel.class, id);
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return insurance;
	}

	/**
	 * Retrieve the single insurance object based on user id
	 * @param user id
	 * @return insurance
	 * */
	@Transactional
	@Override
	public InsuranceModel getInsuranceBasedOnUserId(int userId) {
		InsuranceModel insurance = null;
		List<InsuranceModel> list = null;
		try {
			list = new ArrayList<InsuranceModel>();
			Query<InsuranceModel> query = sessionFactory.getCurrentSession().createQuery("from InsuranceModel where user.id = :userid");
			query.setParameter("userid", userId);
			list = query.getResultList();
			if(list.size() > 0) {
				insurance = list.get(0);
			}
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return insurance;
	}
}
