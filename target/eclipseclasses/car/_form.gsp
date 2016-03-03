<%@ page import="cars.Car" %>



<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'make', 'error')} ">
	<label for="make">
		<g:message code="car.make.label" default="Make" />
		
	</label>
	<g:textField name="make" value="${carInstance?.make}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'model', 'error')} ">
	<label for="model">
		<g:message code="car.model.label" default="Model" />
		
	</label>
	<g:textField name="model" value="${carInstance?.model}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: carInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="car.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${carInstance.year}" required=""/>

</div>

