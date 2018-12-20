<h5>DELETE</h5>
<p>
    Deletes user from the database using his `id` field as a key. <br>
    url: <strong class="text-info">http://{{ request.getServer("HTTP_HOST") }}/api/delete</strong>
</p>

<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected parameters:</h6>
        <nav>
            <div class="nav nav-tabs" id="nav-tabs-delete" role="tablist">
                <a class="nav-item nav-link active" data-toggle="tab" href="#nav-tab-delete-php" role="tab" aria-controls="nav-tab-delete-php" aria-selected="true">PHP Array</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#nav-tab-delete-js" role="tab" aria-controls="nav-tab-delete-js" aria-selected="false">JavaScript Object</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tab-content-delete">
            <div class="tab-pane fade show active" id="nav-tab-delete-php" role="tabpanel" aria-labelledby="nav-tab-delete-php">
<pre class="card-text bg-light mt-3 p-3">
[
    "user_id" => 1
]
</pre>
            </div>
            <div class="tab-pane fade" id="nav-tab-delete-js" role="tabpanel" aria-labelledby="nav-tab-delete-js">
<pre class="card-text bg-light mt-3 p-3">
{
    user_id: 1
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
   message: "Deleted existing user with ID: 1"
}
</pre>
    </div>
</div>