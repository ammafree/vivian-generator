<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.support.form.${classNameLower};

import com.carme.support.form.BaseSearchForm;


public class ${className}SearchForm extends BaseSearchForm {
}
