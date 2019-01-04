package in.bushansirgur.vis.dao;

import java.util.List;

import in.bushansirgur.vis.model.InsuranceModel;

/**
 * Represents the DAO for Insurance related use cases
 * */
public interface InsuranceDAO {
	
	boolean save(InsuranceModel insurance);
	
	List<InsuranceModel> list();
	
	boolean delete(int id);
	
	InsuranceModel get(int id);
	
	InsuranceModel getInsuranceBasedOnUserId(int userId);
}
