<%@ page import="cars.Car" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<button id="newCarBtn" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent">
			New Car
		</button>
		<div class="mdl-grid filterPanel">
			<div class="mdl-cell mdl-cell--4-col"><!-- Numeric Textfield -->
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" pattern="-?[0-9]*(\.[0-9]+)?" id="yearFilter">
					<label class="mdl-textfield__label" for="yearFilter">Year</label>
					<span class="mdl-textfield__error">Input is not a number!</span>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="makeFilter">
					<label class="mdl-textfield__label" for="makeFilter">Make</label>
				</div>
			</div>
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="modelFilter">
					<label class="mdl-textfield__label" for="modelFilter">Model</label>
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
				<th>Year</th>
				<th>Make</th>
				<th>Model</th>
			</tr>
			</thead>
			<tbody id="carTBody">
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
					<input type="hidden" id="id" name="id">

					<div class="mdl-textfield mdl-js-textfield">
						<input id="year" name="year" type="text" class="mdl-textfield__input"  pattern="-?[0-9]*(\.[0-9]+)?">
						<label for="year" class="mdl-textfield__label">Year</label>
						<span class="mdl-textfield__error">Input is not a number!</span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="make" name="make" type="text" class="mdl-textfield__input">
						<label for="make" class="mdl-textfield__label">Make</label>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="model" name="model" type="text" class="mdl-textfield__input">
						<label for="model" class="mdl-textfield__label">Model</label>
					</div>
					<div>
						<div class="mdl-textfield mdl-js-textfield" style="width: 60%">
							<input id="owner" name="owner" type="text" class="mdl-textfield__input">
							<label for="owner" class="mdl-textfield__label">Owner</label>
						</div>
						<!-- Colored FAB button with ripple -->
						<button id="addOwnerBtn" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="height: 30px;">
							<i class="material-icons">person_add</i>
						</button>
					</div>
					<div id="ownerFinder">
						<button id="saveOwnerBtn" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored">
							<i class="material-icons">ckeck</i>
						</button>
					</div>
				<p>
			</div>
			<div>
				<button type="button" class="mdl-button" onclick="javascript:updateCar();">Accept</button>
				<button type="button" class="mdl-button close">Cancel</button>
				<button type="button" class="mdl-button" onclick="javascript:deleteCar();">Delete</button>
			</div>
		</dialog>
	<g:javascript src="pagesControllers/pagination.js"/>
	<g:javascript src="pagesControllers/carsController.js"/>
	</body>
</html>
