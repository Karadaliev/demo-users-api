{% extends "_master.volt" %}

{% block body %}
    <h4>Unit Tests</h4>
    <p>The unit tests are created using the <a href="https://codeception.com/">Codeception Suit</a>, the same tools are used to create the html coverage you can see below.</p>
    <hr>
    <iframe src="{{ coveragePath }}" frameborder="0" width="100%" height="{{ coverageHeight }}"></iframe>
{% endblock %}