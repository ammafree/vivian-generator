<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
package ${basePackage}.bo.${table.sqlName?split("_")[1]};

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
*
* @ClassName: ${className}
* @Description: 映射${table.sqlName}表
* @author: carme-generator
*
*/
@Entity
@Table(name="${table.sqlName}")
public class ${className} implements Serializable {

    private static final long serialVersionUID = 5454155825314635342L;
<#list table.columns as column>
    <#if column.pk>
    /**
    * ${column.columnAlias}
    */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "${column.sqlName}")
    private Long   ${column.columnNameLower};
    <#elseif column.nullable ==false>
    /**
    * ${column.columnAlias}
    */
    @NotNull
    @Column(name = "${column.sqlName}")
    private ${column.javaType}  ${column.columnNameLower};
    <#else>
    /**
    * ${column.columnAlias}
    */
    @Column(name = "${column.sqlName}")
    private ${column.javaType}  ${column.columnNameLower};

    </#if>

</#list>
<#list table.columns as column>
    <@genGetterAndSetter propertyName=column.columnNameLower javaType=column.javaType></@genGetterAndSetter>
</#list>







}