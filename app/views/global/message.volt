{% if message|default(false) %}
    <div class="alert alert-{{ message.type|default('danger') }}">
        <strong>{{ message.title|default('Unknown Error!') }}</strong><br>
        {% if message.refresh|default(false) %}
            <small>refreshing the page in 3 seconds...</small>
            <script>
                setTimeout(function() {
                    location.href='./';
                }, 3000);
            </script>
        {% endif %}
    </div>
{% endif %}