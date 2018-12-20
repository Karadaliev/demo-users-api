{% extends "_master.volt" %}

{% block body %}
    <h4>API Documentation</h4>
    <p>List of the all available calls and the expected data to be sent and received. All of the data must be sent via the <strong>POST</strong> protocol.</p>
    <hr>
    <div class="row">
        <div class="col-md-6">
            {{ partial('documentation/_create') }}
        </div>
        <div class="col-md-6">
            {{ partial('documentation/_read') }}
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6">
            {{ partial('documentation/_update') }}
        </div>
        <div class="col-md-6">
            {{ partial('documentation/_delete') }}
        </div>
    </div>
    <br>
    {{ partial('documentation/_list') }}
    <br><br>
{% endblock %}