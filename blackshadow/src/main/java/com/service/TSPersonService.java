package com.service;

import java.util.List;

import com.domain.TSPerson;

public interface TSPersonService {
	public TSPerson getPersonByUsercode(Object userCode);
	public TSPerson getPersonById(Object id);
}
