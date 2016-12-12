<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.service;

import java.util.Date;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.collections.CollectionUtils;

import org.junit.Test;
import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carme.platform.base.vo.SimplePageVo;
import ${basePackage}.service.${className}Service;
import ${basePackage}.bo.${className};
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextHierarchy({ @ContextConfiguration(name = "parent", locations = { "classpath:applicationContext.xml" }) })
public class ${className}ServiceTest {

	@Autowired
    ${className}Service service;
	
    /**
     * 根据ID获取记录
     */
    @Test
	public void testGetById() {
		${className}Vo vo = getOne();
		if (vo == null) {
			System.out.println("${className} data is empty");
			return;
		}
		System.out.println(service.getById(vo.getId()));
	}

    /**
     * 更新记录（主键不为空）
     */
    @Test
	public void testUpdate() {
		${className}Vo vo = getOne();
		if (vo == null) {
			System.out.println("${className} data is empty");
			return;
		}
		${className} entity = new ${className}();
		entity.setId(vo.getId());
		entity.setChangedAt(new Date());
		entity.setChangedBy("change username");
		if (service.update(entity) <= 0) {
			Assert.fail("编辑失败");
		}
	}

	private ${className}Vo getOne() {
		Query${className}Vo param = new Query${className}Vo();
		param.setPageSize(1);
		param.setPageNo(1);
		SimplePageVo<${className}Vo> page = service.query${className}Page(param);
		if (CollectionUtils.isEmpty(page.getItems())) {
			return null;
		}
		return page.getItems().get(0);
	}

    /**
     * 根据ID删除记录（逻辑）
     */
    @Test
	public void testLogicDelById() {
		${className}Vo vo = getOne();
		if (vo == null) {
			System.out.println("${className} data is empty");
			return;
		}
		service.logicDelById(vo.getId());
		if (service.getById(vo.getId()) != null) {
			Assert.fail("逻辑删除失败");
		}
	}

    /**
     * 多条件组合查询
     */
    @Test
	public void testQuery() {
		${className}Vo vo = getOne();
		if (vo == null) {
			System.out.println("${className} data is empty");
			return;
		}
		${className} record = new ${className}();
		record.setId(vo.getId());
		System.out.println(JSONObject.toJSONString(service.query(record)));
	}

    /**
     * 分页查找
     */
    @Test
	public void testQuery${className}Page() {
		Query${className}Vo param = new Query${className}Vo();
		param.setPageSize(20);
		param.setPageNo(1);
		System.out.println(JSONObject.toJSONString(service.query${className}Page(param)));
	}

}