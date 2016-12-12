<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.service;



import java.util.List;

import ${basePackage}.bo.${className};
import ${basePackage}.vo.${className}Vo;
import ${basePackage}.vo.Query${className}Vo;
import com.carme.platform.base.vo.SimplePageVo;


public interface ${className}Service {

	
    /**
     * 根据ID获取记录
     * @param id
     * @return
     */
    public ${className} getById(Long id);

    /**
     * 多条件组合查询
     * @param record
     * @return
     */
	public List<${className}> query(${className} record);

    /**
     * 分页查找
     * @param param
     * @return
     */
    public SimplePageVo<${className}Vo> query${className}Page(Query${className}Vo param);

    /**
     * 更新记录（主键不为空）
     * @param entity
     * @return
     */
    public int update(${className} entity);

    /**
     * 根据ID删除记录（逻辑）
     * @param id
     * @return
     */
    public int logicDelById(Long id);

}