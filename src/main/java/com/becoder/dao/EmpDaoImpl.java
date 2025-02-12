package com.becoder.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.becoder.entity.Emp;

@Repository
public class EmpDaoImpl implements EmpDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	@Transactional
	public int saveEmp(Emp emp) {
		int i  =(Integer) hibernateTemplate.save(emp);
		return i;
	}

	public Emp getEmpById(int id) {
		Emp emp = this.hibernateTemplate.get(Emp.class, id);
		return emp;
	}

	public List<Emp> getAllEmp() {
		List<Emp>  list = this.hibernateTemplate.loadAll(Emp.class);
		return list;
	}

	@Transactional
	public void update(Emp emp) {
		this.hibernateTemplate.update(emp);
		
	}

	@Transactional
	public void deleteEmp(int id) {
	Emp emp = this.hibernateTemplate.get(Emp.class, id);
		this.hibernateTemplate.delete(emp);
	}

}
