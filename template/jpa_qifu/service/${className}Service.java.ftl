<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.service.${table.sqlName?split("_")[1]};

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import ${basePackage}.repository.${table.sqlName?split("_")[1]}.${className}Dao;
import ${basePackage}.domain.${table.sqlName?split("_")[1]}.${className};
import ${basePackage}.support.form.${table.sqlName?split("_")[1]}.${className}SearchForm;


@Service
public class ${className}Service {

@Autowired
private ${className}Dao ${classNameLower}Dao;

    @Transactional(readOnly = true)
public Page<${className}> findAll(${className}SearchForm ${classNameLower}SearchForm) {
return ${classNameLower}Dao.findAll(getWhereClause(${classNameLower}SearchForm),
new PageRequest(${classNameLower}SearchForm.getPageNo(), ${classNameLower}SearchForm.getPageSize()));
    }

private Specification<${className}> getWhereClause(final ${className}SearchForm ${classNameLower}SearchForm) {
return new Specification<${className}>() {
@Override
public Predicate toPredicate(Root<${className}> r, CriteriaQuery<?> q, CriteriaBuilder cb) {
Predicate predicate = cb.conjunction();
//insert your condition here
predicate.getExpressions().add(cb.equal(r.
<String> get("isDelete"), 0));

    return predicate;
    }
    };
    }

    @Transactional(readOnly = true)
    public ${className} findOne(Long id) {
    return ${classNameLower}Dao.findOne(id);
    }
    }
