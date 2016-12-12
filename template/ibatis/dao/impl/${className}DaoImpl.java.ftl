<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 

package ${basePackage}.dao.impl;

import org.springframework.stereotype.Repository;

import com.carme.platform.base.vo.SimplePageVo;
import com.carme.platform.dao.impl.EduBaseDaoImpl;
import java.util.List;
import ${basePackage}.bo.${className};
import ${basePackage}.dao.${className}Dao;
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;

@Repository
public class ${className}DaoImpl extends EduBaseDaoImpl<Long, ${className}> implements ${className}Dao {

	public String getNameSpace(String suffix) {
		return "edu${className}." + suffix;
	}

	
	@Override
	public SimplePageVo<${className}Vo> query${className}Page(Query${className}Vo param) {
		return this.page(getNameSpace("query${className}Page"), param);
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<${className}> getByIds(${className}Vo record) {
		return queryForList(getNameSpace("getByIds"), record);
	}

    @Override
    @SuppressWarnings("unchecked")
    public List<${className}> query(${className} record) {
    	return queryForList(getNameSpace("query"), record);
    }

}
