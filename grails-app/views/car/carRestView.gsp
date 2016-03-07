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
			<div class="mdl-cell mdl-cell--4-col">
				<div class="mdl-textfield mdl-js-textfield">
					<input class="mdl-textfield__input" type="text" id="plateFilter">
					<label class="mdl-textfield__label" for="modelFilter">Plate</label>
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
				<th>Plate</th>
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
					<input type="hidden" id="idOwner" name="idOwner">

					<div class="mdl-textfield mdl-js-textfield">
						<input id="year" name="year" type="text" class="mdl-textfield__input"  pattern="-?[0-9]*(\.[0-9]+)?">
						<label for="year" class="mdl-textfield__label">Year</label>
						<span id="yearMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="make" name="make" type="text" class="mdl-textfield__input">
						<label for="make" class="mdl-textfield__label">Make</label>
						<span id="makeMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="model" name="model" type="text" class="mdl-textfield__input">
						<label for="model" class="mdl-textfield__label">Model</label>
						<span id="modelMessage" class="inputErrorMessage"></span>
					</div>
					<div class="mdl-textfield mdl-js-textfield">
						<input id="plate" name="plate" type="text" class="mdl-textfield__input">
						<label for="plate" class="mdl-textfield__label">Plate</label>
						<span id="plateMessage" class="inputErrorMessage"></span>
					</div>
					<div>
						<div class="mdl-textfield mdl-js-textfield" style="width: 60%">
							<input id="ownerLastName" name="ownerLastName" type="text" class="mdl-textfield__input">
							<label for="ownerLastName" class="mdl-textfield__label" id="placeHolerOwnerFinder">Owner</label>
							<span id="ownerMessage" class="inputErrorMessage"></span>
						</div>
						<!-- Colored FAB button with ripple -->
						<button id="findOwnerPopupBtn" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="height: 30px; margin-left: 40px;">
							<i class="material-icons" id="iconBtnFinder">search</i>
						</button>
					</div>
					<div id="ownerFinder">
						<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
							<thead>
							<tr>
								<th>DNI</th>
								<th>Last Name</th>
								<th>Name</th>
							</tr>
							</thead>
							<tbody id="ownerPopupFinderTBody">
							</tbody>
						</table>
					</div>
				<p>
			</div>
			<div>
				<button type="button" class="mdl-button" onclick="javascript:updateCar();">Accept</button>
				<button type="button" class="mdl-button close">Cancel</button>
				<button id="deleteBtn" type="button" class="mdl-button" onclick="javascript:deleteCar();">Delete</button>
			</div>
		</dialog>
	<g:javascript src="pagesControllers/pagination.js"/>
	<g:javascript src="pagesControllers/carsController.js"/>
	<g:javascript src="pagesControllers/ownerPopupFinder.js"/>
	</body>
</html>
