<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.dao;



import java.util.List;

import com.carme.platform.base.vo.SimplePageVo;
import com.carme.platform.base.dao.BaseDao;
import ${basePackage}.bo.${className};
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;


public interface ${className}Dao extends BaseDao<Long, ${className}>{

	
	/**
	 * 分页查找
	 * 
	 * @param param
	 * @return
	 */
	public SimplePageVo<${className}Vo> query${className}Page(Query${className}Vo param);

	/**
	 * 根据Ids获取记录
	 * 
	 * @param record
	 * @return
	 */
	public List<${className}> getByIds(${className}Vo record);

    /**
    * 多条件组合查询
    * 
    * @param record
    * @return
    */
    public List<${className}> query(${className} record);

}