<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>API Demo</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/public/css/pretty-print-json.css" type="text/css">
    <link  rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="/public/js/pretty-print-json.min.js"></script>
    <script src="/public/js/demo.js"></script>

    <style>
        i.material-icons {
            vertical-align: bottom;
        }
    </style>
</head>
<body>
<div class="container">
    <br>
    <h3>Users API Demo</h3>
    <br>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link {% if router.getControllerName() == "" %}active{% endif %}" href="/">
                <i class="material-icons">chrome_reader_mode</i>
                API Demos
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link {% if router.getControllerName() == "documentation" %}active{% endif %}" href="/documentation">
                <i class="material-icons">live_help</i>
                API Documentation
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-info {% if router.getControllerName() == "unit_tests" %}active{% endif %}" href="/unit_tests">
                <i class="material-icons">assessment</i>
                Unit Tests
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link text-danger {% if router.getControllerName() == "utilities" %}active{% endif %}" href="/utilities">
                <i class="material-icons">dns</i>
                Utilities
            </a>
        </li>
    </ul>
    <br>
    {% block body %}
    {% endblock %}
</div>
</body>
</html>