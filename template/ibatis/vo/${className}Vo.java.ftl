<#include "/macro.include"/>
<#include "/custom.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basePackage}.vo;

import ${basePackage}.bo.${className};

/**
 * 
 * @ClassName: ${className}Vo
 * @Description:
 * @author: carme-generator
 *
 */
public class ${className}Vo extends ${className} {
	private static final long serialVersionUID = 1L;

	/**
	 * id集合
	 */
	private String[] codes;

	

	public String[] getCodes() {
		return codes;
	}

	public void setCodes(String[] codes) {
		this.codes = codes;
	}

	

}
