<h5>CREATE</h5>
<p>
    Adds a new user to the database. <br>
    url: <strong class="text-info">http://{{ request.getServer("HTTP_HOST") }}/api/create</strong>
</p>

<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected parameters:</h6>
        <nav>
            <div class="nav nav-tabs" id="nav-tabs-create" role="tablist">
                <a class="nav-item nav-link active" data-toggle="tab" href="#nav-tab-create-php" role="tab" aria-controls="nav-tab-create-php" aria-selected="true">PHP Array</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#nav-tab-create-js" role="tab" aria-controls="nav-tab-create-js" aria-selected="false">JavaScript Object</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tab-content-create">
            <div class="tab-pane fade show active" id="nav-tab-create-php" role="tabpanel" aria-labelledby="nav-tab-create-php">
<pre class="card-text bg-light mt-3 p-3">
[
    "user" => [
        "email" => "your@email.com",
        "given_name" => "John",
        "family_name" => "Smith"
    ]
]
</pre>
            </div>
            <div class="tab-pane fade" id="nav-tab-create-js" role="tabpanel" aria-labelledby="nav-tab-create-js">
<pre class="card-text bg-light mt-3 p-3">
{
    user: {
        email: "your@email.com",
        given_name: "John",
        family_name: "Smith"
    }
}
</pre>
            </div>
        </div>
    </div>
</div>
<br>
<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected result:</h6>
<pre class="card-text bg-light mt-3 p-3">
{
   type: "success",
   message: "Created new user with ID: ?"
}
</pre>
    </div>
</div>