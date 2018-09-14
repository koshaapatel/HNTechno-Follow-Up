package com.HNTechno.model.Dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.HNTechno.model.inquiry;
import com.HNTechno.model.Dao.genericDao;

@Repository
public class genericDaoImpl implements genericDao {

	@PersistenceContext
	private EntityManager en;
	@Transactional
	@Override
	public List display(String x) {
		return en.createQuery("from "+x+"").getResultList();
	}
	@Transactional
	@Override
	public <E> E insert(E e) {
		return en.merge(e);
	}
	@Transactional
	@Override
	public <T> void delete(T t) {
		en.remove(en.merge(t));
	}
	
	@Transactional
	@Override
	public List display(String x, String y) {
		return en.createQuery("from "+x+" where "+y+"").getResultList();
	}
	@Override
	public int getid() {
		int id = (int)en.createQuery("select MAX(imid) from inquiry").getResultList().get(0);
		return id;
	}
}

