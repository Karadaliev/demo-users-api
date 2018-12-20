<h5>UPDATE</h5>
<p>
    Updates user's data in the database using `id` field as a key. <br>
    url: <strong class="text-info">http://{{ request.getServer("HTTP_HOST") }}/api/update</strong>
</p>

<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected parameters:</h6>
        <nav>
            <div class="nav nav-tabs" id="nav-tabs-update" role="tablist">
                <a class="nav-item nav-link active" data-toggle="tab" href="#nav-tab-update-php" role="tab" aria-controls="nav-tab-update-php" aria-selected="true">PHP Array</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#nav-tab-update-js" role="tab" aria-controls="nav-tab-update-js" aria-selected="false">JavaScript Object</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tab-content-update">
            <div class="tab-pane fade show active" id="nav-tab-update-php" role="tabpanel" aria-labelledby="nav-tab-update-php">
<pre class="card-text bg-light mt-3 p-3">
[
    "user" => [
        "id" => 1,
        "given_name" => "John",
        "family_name" => "Smith"
    ]
]
</pre>
            </div>
            <div class="tab-pane fade" id="nav-tab-update-js" role="tabpanel" aria-labelledby="nav-tab-update-js">
<pre class="card-text bg-light mt-3 p-3">
{
    user: {
        id: 1,
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
   message: "Updated existing user with ID: 1"
}
</pre>
    </div>
</div>