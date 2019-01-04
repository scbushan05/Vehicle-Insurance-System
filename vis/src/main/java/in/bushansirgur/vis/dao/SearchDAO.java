package in.bushansirgur.vis.dao;

import in.bushansirgur.vis.model.SearchModel;
import in.bushansirgur.vis.model.UserModel;

/**
 * Represents the DAO for search related use cases
 * */
public interface SearchDAO {
	
	UserModel searchResult(SearchModel search);
}
