var messageLoading = "The request is sent to the API, waiting response...",
    messageRequiredFieldsMissing = "Please fill up all of the required fields and try to submit the form again!",
    messageRequiredEmail = "Please fill up the email address!",
    messagePickAUser = "Please pick a user from the list above!";

function getUserList($selectHolder)
{
    // removing all of the options first
    $selectHolder.children('option').remove();
    $.ajax({
        method: "POST",
        url: "/api/list",
        data: {
            start: 0,
            limit: 0
        }
    }).done(function(result) {
        // inserting the "pick user" option first
        $selectHolder.append($('<option>', {
            value: 0,
            text : "--- Pick a user ---",
            "data-given-name": "",
            "data-family-name": ""
        }));
        // inserting the result into the select
        $.each( result, function( key, item ) {
            $selectHolder.append($('<option>', {
                value: item.id,
                text : item.email,
                "data-given-name": item.givenName,
                "data-family-name": item.familyName
            }));
        });
    });
}

$(document).ready(function() {
    $("#create-submit").on("click", function() {
        // collect the form data
        var formData = {},
            errors = 0,
            $responseHolder = $("#create-result");
        $("#create-form input").each(function(i, e) {
            if ($(e).val() !== "") {
                formData[$(e).attr('name')] = $(e).val();
            } else {
                errors++;
            }
        });
        if (errors > 0) {
            // we have empty fields
            $responseHolder.html('<div class="alert alert-danger">'+messageRequiredFieldsMissing+'</div>');
        } else {
            // SUCCESS, sending the call to the API
            $responseHolder.html('<div class="alert alert-info">'+messageLoading+'</div>');
            $.ajax({
                method: "POST",
                url: "/api/create",
                data: {
                    user: formData
                }
            }).done(function(result) {
                // showing the result
                $responseHolder.html("<pre class='alert alert-warning'>"+prettyPrintJson.toHtml(result)+"</pre>");
            });
        }
    });

    $("#read-submit").on("click", function() {
        var formEmail = $("#read_email").val(),
            $responseHolder = $("#read-result");
        if (formEmail !== "") {
            // we do have the email address, sending the call
            $responseHolder.html('<div class="alert alert-info">'+messageLoading+'</div>');
            $.ajax({
                method: "POST",
                url: "/api/read",
                data: {
                    user_email: formEmail
                }
            }).done(function(result) {
                // showing the result
                $responseHolder.html("<pre class='alert alert-warning'>"+prettyPrintJson.toHtml(result)+"</pre>");
            });
        } else {
            // we have empty email field
            $responseHolder.html('<div class="alert alert-danger">'+messageRequiredEmail+'</div>');
        }
    });

    $(".refresh_list_btn").on("click", function() {
        // this handles all of the user lists
        var $selectHolder = $("select#"+$(this).attr('rel'));
        getUserList($selectHolder);
    });

    $("#update-id").on("change", function() {
        var $selectedOption = $(this).children('option:selected');
        // fill up the fields with the data from the option
        $("#update_given_name").val($selectedOption.data('given-name'));
        $("#update_family_name").val($selectedOption.data('family-name'));
        // enable the button if the id its not 0
        if ($selectedOption.val() !== "0") {
            $("#update-submit").prop("disabled", false);
        } else {
            $("#update-submit").prop("disabled", true);
        }
    });

    $("#update-submit").on("click", function() {
        // collect the form data
        var formData = {},
            errors = 0,
            $responseHolder = $("#update-result");
        $("#update-form input, #update-form select").each(function(i, e) {
            if ($(e).val() !== "") {
                formData[$(e).attr('name')] = $(e).val();
            } else {
                errors++;
            }
        });
        if (errors > 0) {
            // we have empty fields
            $responseHolder.html('<div class="alert alert-danger">'+messageRequiredFieldsMissing+'</div>');
        } else {
            // SUCCESS, sending the call to the API
            $responseHolder.html('<div class="alert alert-info">'+messageLoading+'</div>');
            $.ajax({
                method: "POST",
                url: "/api/update",
                data: {
                    user: formData
                }
            }).done(function(result) {
                // showing the result
                $responseHolder.html("<pre class='alert alert-warning'>"+prettyPrintJson.toHtml(result)+"</pre>");
            });
        }
    });

    $("#delete-id").on("change", function() {
        var $selectedOption = $(this).children('option:selected');
        // enable the button if the id its not 0
        if ($selectedOption.val() !== "0") {
            $("#delete-submit").prop("disabled", false);
        } else {
            $("#delete-submit").prop("disabled", true);
        }
    });

    $("#delete-submit").on("click", function() {
        if (confirm("This will delete the user with all of his data, are you sure?")) {
            var formId = $("#delete-id").val(),
                $responseHolder = $("#delete-result");
            if (formId > 0) {
                // we do have the user Id, sending the call
                $responseHolder.html('<div class="alert alert-info">'+messageLoading+'</div>');
                $.ajax({
                    method: "POST",
                    url: "/api/delete",
                    data: {
                        user_id: formId
                    }
                }).done(function(result) {
                    // showing the result
                    $responseHolder.html("<pre class='alert alert-warning'>"+prettyPrintJson.toHtml(result)+"</pre>");
                    // refreshing the users list
                    getUserList($("#delete-id"));
                });
            } else {
                // we have empty email field
                $responseHolder.html('<div class="alert alert-danger">'+messagePickAUser+'</div>');
            }
        } else {
            return false;
        }
    });

    $("#users-clear-btn").on("click", function() {
        if (confirm('This will empty the users whole table and you will lose all of the data. Are you sure?')) {
            location.href = '/utilities/usersClear';
        } else {
            return false;
        }
    })
});