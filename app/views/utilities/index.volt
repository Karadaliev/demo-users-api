{% extends "_master.volt" %}

{% block body %}
    <h4>Utilities</h4>
    <p>You can use this tools to manipulate the data in the database.</p>
    <hr>
    {{ flash.output() }}
    <a href="#users-clear" class="btn btn-danger" id="users-clear-btn">Clear the Users Data</a>
{% endblock %}