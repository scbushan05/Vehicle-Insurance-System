package in.bushansirgur.vis.dao;

import java.util.List;

import javax.persistence.Tuple;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import in.bushansirgur.vis.model.InsuranceModel;
import in.bushansirgur.vis.model.SearchModel;
import in.bushansirgur.vis.model.UserModel;
import in.bushansirgur.vis.model.VehicleModel;

/**
 * Represents DAO implementation for search related use cases
 * */
@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * Retrives the search result
	 * @param search
	 * @return nUser
	 * */
	@Transactional
	@Override
	public UserModel searchResult(SearchModel search) {
		Session session = sessionFactory.getCurrentSession();
		UserModel nUser = null;
		try {
			String name = search.getUsername();
			String licenceNo = search.getLicenceNo();
			String plateNo = search.getPlateNo();
			String query = "";
			if(name != null) {
				query = query + "and u.name like '%"+name+"%' ";
			}
			if(licenceNo != null) {
				query = query + "and u.licence like '%"+licenceNo+"%' ";
			}
			if(plateNo != null) {
				query = query + "and v.plate_number like '%"+plateNo+"%' ";
			}
			String sqlQuery = "select u.name, u.gender, u.nationality, u.licence, i.provider, i.insurance_number, i.valid_date, v.source, v.category, v.plate_number, v.manufacture, v.type, v.color, v.registration_date, v.pending_fines"
					+ " from tbl_user u, tbl_insurance i, tbl_vehicles v where u.id = i.user_id and u.id = v.user_id and i.user_id = v.user_id "+query;
			List<Object[]> list = session.createNativeQuery(sqlQuery).list();
			for(Object[] row : list) {
				nUser = new UserModel();
				nUser.setName(row[0].toString());
				nUser.setGender(row[1].toString());
				nUser.setNationality(row[2].toString());
				nUser.setLicence(row[3].toString());
				InsuranceModel nInsurance = new InsuranceModel();
				nInsurance.setProvider(row[4].toString());
				nInsurance.setInsuranceNumber(row[5].toString());
				nInsurance.setInsuranceValidDate(row[6].toString());
				nUser.setInsuranceModel(nInsurance);
				VehicleModel nVehicle = new VehicleModel();
				nVehicle.setSource(row[7].toString());
				nVehicle.setCategory(row[8].toString());
				nVehicle.setPlateNumber(row[9].toString());
				nVehicle.setManufacture(row[10].toString());
				nVehicle.setType(row[11].toString());
				nVehicle.setColor(row[12].toString());
				nVehicle.setRegistrationDate(row[13].toString());
				nVehicle.setPendingFines(row[14].toString());
				nUser.setVehicleModel(nVehicle);
			}
			
		}catch(HibernateException e) {
			e.printStackTrace();
		}
		return nUser;
	}

}
