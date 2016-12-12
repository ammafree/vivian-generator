<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.dao;

import java.util.List;
import java.util.ArrayList;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.collections.CollectionUtils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carme.platform.base.vo.SimplePageVo;
import ${basePackage}.bo.${className};
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextHierarchy({ @ContextConfiguration(name = "parent", locations = { "classpath:applicationContext.xml" }) })
public class ${className}DaoTest {

	@Autowired
    ${className}Dao dao;
	
	/**
	 * 分页查找
	 */
	@Test
	public void testQuery${className}Page() {
		Query${className}Vo param = new Query${className}Vo();
		param.setPageSize(20);
		param.setPageNo(1);
		System.out.println(JSONObject.toJSONString(dao.query${className}Page(param)));
	}

	/**
	 * 根据Ids获取记录
	 */
	@Test
	public void testGetByIds() {
		Query${className}Vo param = new Query${className}Vo();
		param.setPageSize(20);
		param.setPageNo(1);
		SimplePageVo<${className}Vo> page = dao.query${className}Page(param);
		if (CollectionUtils.isEmpty(page.getItems())) {
			System.out.println("${className} data is empty");
			return;
		}
		List<String> codesList = new ArrayList<>();
		for (${className}Vo vo : page.getItems()) {
			codesList.add(vo.getId().toString());
		}
		${className}Vo query = new ${className}Vo();
		query.setCodes(codesList.toArray(new String[codesList.size()]));
		System.out.println(JSONObject.toJSONString(dao.getByIds(query)));
	}

    /**
     * 多条件组合查询
     */
   	@Test
	public void testQuery() {
		${className} query = new ${className}();
		query.setId(1L);
		System.out.println(JSONObject.toJSONString(dao.query(query)));
	}

}