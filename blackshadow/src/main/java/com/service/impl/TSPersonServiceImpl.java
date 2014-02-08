package com.service.impl;

import java.util.List;

import com.dao.ITSPersonDao;
import com.domain.TSPerson;
import com.service.TSPersonService;

public class TSPersonServiceImpl implements TSPersonService {
	private ITSPersonDao personImpl;

	@Override
	public TSPerson getPersonById(Object id) {
		return personImpl.findById((Integer)id);
	}

	@Override
	public TSPerson getPersonByUsercode(Object userCode) {
		List list = personImpl.findByUserCode(userCode);
		if(list==null)
			return null;
		else
			return (TSPerson) list.get(0);
	}

}
