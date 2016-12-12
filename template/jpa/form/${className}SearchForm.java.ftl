<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>
<#assign classNameLower = className?uncap_first>
package ${basePackage}.controller.form.${classNameLower};

import com.carme.controller.form.BaseSearchForm;


public class ${className}SearchForm extends BaseSearchForm {
}
