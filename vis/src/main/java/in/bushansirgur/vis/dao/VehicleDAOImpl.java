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

import in.bushansirgur.vis.model.VehicleModel;

/**
 * Represents the DAO implementation for vehicle related use cases
 * */
@Repository
public class VehicleDAOImpl implements VehicleDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * Saves the vehicle object
	 * @param vehicle
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean save(VehicleModel vehicle) {
		boolean flag = false;
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(vehicle);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieves the vehicle list
	 * @return list
	 * */
	@Transactional
	@Override
	public List<VehicleModel> list() {
		List<VehicleModel> list = null;
		try {
			list = new ArrayList<VehicleModel>();
			Query<VehicleModel> query = sessionFactory.getCurrentSession().createQuery("from VehicleModel");
			list = query.getResultList();
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Deletes the vehicle object
	 * @param id
	 * @return flag
	 * */
	@Transactional
	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			Session session = sessionFactory.getCurrentSession();
			VehicleModel vehicle = (VehicleModel)session.load(VehicleModel.class, id);
			session.delete(vehicle);
			flag = true;
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * Retrieves the single vehicle object
	 * @param id
	 * @return vehicle
	 * */
	@Transactional
	@Override
	public VehicleModel get(int id) {
		VehicleModel vehicle = null;
		try {
			vehicle = (VehicleModel)sessionFactory.getCurrentSession().get(VehicleModel.class, id);
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return vehicle;
	}

	/**
	 * Retrieves the vehicle object based on user id
	 * @param userId
	 * @return vehicle
	 * */
	@Transactional
	@Override
	public VehicleModel getVehicleBasedOnUserId(int userId) {
		VehicleModel vehicle = null;
		List<VehicleModel> list = null;
		try {
			list = new ArrayList<VehicleModel>();
			Query<VehicleModel> query = sessionFactory.getCurrentSession().createQuery("from VehicleModel where user.id = :userid");
			query.setParameter("userid", userId);
			list = query.getResultList();
			if(list.size() > 0) {
				vehicle = list.get(0);
			}
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return vehicle;
	}

}
