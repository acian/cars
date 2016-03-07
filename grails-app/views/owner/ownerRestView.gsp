<%@ page import="cars.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<button id="newOwnerBtn" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
			New Owner
		</button>
		<div class="mdl-grid filterPanel">
			<div class="mdl-cell mdl-cell--4-col"><!-- Numeric Textfield -->
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="dniFilter">
					<label class="mdl-textfield__label" for="dniFilter">DNI</label>
					<span class="mdl-textfield__error">Input is not a number!</span>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="lastNameFilter">
					<label class="mdl-textfield__label" for="lastNameFilter">Last Name</label>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="nameFilter">
					<label class="mdl-textfield__label" for="nameFilter">Name</label>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="nationalityFilter">
					<label class="mdl-textfield__label" for="nationalityFilter">Nationality</label>
				</div>
			</div>
			<button id="findBtn" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
				Find
			</button>
		</div>
		<table id="carsTable" class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
			<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">Number</th>
				<th>DNI</th>
				<th>Last Name</th>
				<th>Name</th>
				<th>Nationality</th>
			</tr>
			</thead>
			<tbody id="ownerTBody">
			</tbody>
		</table>
		<div class="pagination">
				<button id="flechaIquierda"><</button>
				<span id="currentPageSpn"></span>/<span id="maxPagesSpn"></span>
				<button id="flechaDerecha">></button>
		</div>

		<dialog class="mdl-dialog">
			<h4 id="popupTitle" class="mdl-dialog__title"></h4>
			<div class="mdl-dialog__content">
				<p>
				<form action="#">
					<input type="hidden" id="id" name="id">

					<div class="mdl-textfield mdl-js-textfield">
						<input id="dni" name="dni" type="text" class="mdl-textfield__input">
						<label for="dni" class="mdl-textfield__label">DNI</label>
						<span id="dniMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="lastName" name="lastName" type="text" class="mdl-textfield__input">
						<label for="lastName" class="mdl-textfield__label">Last Name</label>
						<span id="lastNameMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="name" name="name" type="text" class="mdl-textfield__input">
						<label for="name" class="mdl-textfield__label">Name</label>
						<span id="nameMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="nationality" name="nationality" type="text" class="mdl-textfield__input">
						<label for="nationality" class="mdl-textfield__label">Nationality</label>
						<span id="nationalityMessage" class="inputErrorMessage"></span>
					</div>
				</form>
				<p>
			</div>
			<div>
				<button type="button" class="mdl-button" onclick="javascript:updateOwner();">Accept</button>
				<button type="button" class="mdl-button close">Cancel</button>
				<button id="deleteBtn" type="button" class="mdl-button" onclick="javascript:deleteOwner();">Delete</button>
			</div>
		</dialog>
	<g:javascript src="pagesControllers/pagination.js"/>
	<g:javascript src="pagesControllers/ownerController.js"/>
	</body>
</html>
