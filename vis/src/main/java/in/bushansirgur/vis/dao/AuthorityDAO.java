package in.bushansirgur.vis.dao;

import java.util.List;

import in.bushansirgur.vis.model.Authorities;

/**
 * Represents the DAO for the Authorities related use case
 * */
public interface AuthorityDAO {
	
	List<Authorities> list();
}
