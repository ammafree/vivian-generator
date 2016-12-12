<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
package ${basePackage}.repository.${table.sqlName?split("_")[1]};

import ${basePackage}.domain.${table.sqlName?split("_")[1]}.${className};
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface ${className}Dao extends JpaRepository<${className}, Long>, JpaSpecificationExecutor<${className}> {


Page<${className}> findAll(Specification<${className}> spec, Pageable page);
}
