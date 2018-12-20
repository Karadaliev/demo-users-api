{% extends "_master.volt" %}

{% block body %}
    <h4>API Demos</h4>
    <p>Pick any of the CRUD functions below, and set the parameters to test them. The result will be displayed using AJAX calls.</p>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <h4>CREATE</h4>
            <p>Adds new user into the database</p>
            <div id="create-result"></div>
            <div id="create-form">
                <div class="form-group">
                    <label for="create_email">Email Address <strong class="text-danger">*</strong></label>
                    <input type="email" name="email" value="" id="create_email" class="form-control form-control-sm">
                </div>
                <div class="form-group">
                    <label for="create_given_name">Given/First Name <strong class="text-danger">*</strong></label>
                    <input type="text" name="given_name" value="" id="create_given_name" class="form-control form-control-sm">
                </div>
                <div class="form-group">
                    <label for="create_family_name">Family/Last Name <strong class="text-danger">*</strong></label>
                    <input type="text" name="family_name" value="" id="create_family_name" class="form-control form-control-sm">
                </div>
            </div>
            <button class="btn btn-primary" id="create-submit">Create User</button>
        </div>
        <div class="col-md-6">
            <h4>READ</h4>
            <p>Read user from the database using his email address as a key</p>
            <div id="read-result"></div>
            <div id="read-form">
                <div class="form-group">
                    <label for="read_email">Email Address <strong class="text-danger">*</strong></label>
                    <input type="email" name="email" value="" id="read_email" class="form-control form-control-sm">
                </div>
            </div>
            <button class="btn btn-primary" id="read-submit">Read User</button>
        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="col-md-6">
            <h4>UPDATE</h4>
            <p>Pick a user from the drop-down and edit his data</p>
            <div id="update-result"></div>
            <div id="update-form">
                <div class="input-group">
                    <select name="id" id="update-id" class="form-control form-control-sm">
                        <option value="0">--- Pick a user ---</option>
                    </select>
                    <div class="input-group-append" id="button-addon4">
                        <button class="btn btn-sm btn-success refresh_list_btn" type="button" id="update_list_btn" rel="update-id">Load/Refresh Users</button>
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="update_given_name">Given/First Name <strong class="text-danger">*</strong></label>
                    <input type="text" name="given_name" value="" id="update_given_name" class="form-control form-control-sm">
                </div>
                <div class="form-group">
                    <label for="update_family_name">Family/Last Name <strong class="text-danger">*</strong></label>
                    <input type="text" name="family_name" value="" id="update_family_name" class="form-control form-control-sm">
                </div>
            </div>
            <button class="btn btn-primary" id="update-submit" disabled>Update User</button>
        </div>
        <div class="col-md-6">
            <h4>DELETE</h4>
            <p>Pick a user from the drop-down and delete him</p>
            <div id="delete-result"></div>
            <div id="delete-form">
                <div class="input-group">
                    <select name="id" id="delete-id" class="form-control form-control-sm">
                        <option value="0">--- Pick a user ---</option>
                    </select>
                    <div class="input-group-append" id="button-addon4">
                        <button class="btn btn-sm btn-success refresh_list_btn" type="button" id="update_list_btn" rel="delete-id">Load/Refresh Users</button>
                    </div>
                </div>
            </div>
            <br>
            <button class="btn btn-primary" id="delete-submit" disabled>Delete User</button>
        </div>
    </div>
    <br>
    <hr>
    <h5>Legend:</h5>
    <p>
        &bull; Fields marked with <strong class="text-danger">*</strong> (astrix) are required!
    </p>
{% endblock %}