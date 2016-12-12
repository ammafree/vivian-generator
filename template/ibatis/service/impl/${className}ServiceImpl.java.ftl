<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.service.impl;

import java.util.List;
import java.util.Date;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${basePackage}.bo.${className};
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;
import ${basePackage}.dao.${className}Dao;
import ${basePackage}.service.${className}Service;
import com.carme.platform.base.vo.SimplePageVo;

@Service
public class ${className}ServiceImpl implements ${className}Service {

	@Autowired
    private ${className}Dao dao;
	
	 @Override
    public ${className} getById(Long id) {
        return dao.getById(id);
    }

    @Override
	public List<${className}> query(${className} record) {
        return dao.query(record);
    }

    @Override
    public SimplePageVo<${className}Vo> query${className}Page(Query${className}Vo param) {
        return dao.query${className}Page(param);
    }

    @Override
    public int update(${className} entity) {
		entity.setChangedAt(new Date());
		if (StringUtils.isEmpty(entity.getChangedBy())) {
			throw new RuntimeException("changeBy is null");
		}
        return dao.update(entity);
    }

    @Override
    public int logicDelById(Long id) {
        return dao.logicDelById(id);
    }

}
