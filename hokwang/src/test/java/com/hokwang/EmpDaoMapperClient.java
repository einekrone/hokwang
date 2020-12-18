package com.hokwang;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hokwang.config.DBConfiguration;
import com.hokwang.config.MybatisConfiguration;
import com.hokwang.dao.EmpMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { DBConfiguration.class, MybatisConfiguration.class } )

public class EmpDaoMapperClient {
	@Autowired EmpMapper empDAO;
	@Test
	public void empdaoTest() {
		System.out.println(empDAO.getEmpList(null));
	}
}
