package com.HNTechno.model.Dao;

import java.util.List;

public interface genericDao {
	
	List display(String x);
	<E> E insert(E e);
	<T> void delete(T t);
	List display(String x,String y);
	int getid();
}
