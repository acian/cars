<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'dialog-polyfill.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'material.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<g:layoutHead/>
		<g:javascript library="application"/>
		<g:javascript src="jquery-2.2.1.js"/>
		<g:javascript src="dialog-polyfill.js"/>
		<g:javascript src="material.js"/>
		<r:layoutResources />
	</head>
	<body>
	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<span class="mdl-layout-title">The Cars Manager</span>
				<span class="mdl-layout-title powered">Powered by Kaitzen</span>
				<div class="mdl-layout-spacer"></div>
			</div>
		</header>
		<div class="mdl-layout__drawer">
			<span class="mdl-layout-title">Options</span>
			<nav class="mdl-navigation">
				<a class="mdl-navigation__link" href="/cars/">Car</a>
				<a class="mdl-navigation__link" href="/cars/owner">Owner</a>
			</nav>
		</div>
		<main class="mdl-layout__content">
			<div class="page-content">
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<r:layoutResources />
			</div>
		</main>
	</div>
	</body>
</html>
