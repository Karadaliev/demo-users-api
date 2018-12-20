<h5>READ</h5>
<p>
    Read user from the database using his `email` field as a key. <br>
    url: <strong class="text-info">http://{{ request.getServer("HTTP_HOST") }}/api/read</strong>
</p>

<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected parameters:</h6>
        <nav>
            <div class="nav nav-tabs" id="nav-tabs-read" role="tablist">
                <a class="nav-item nav-link active" data-toggle="tab" href="#nav-tab-read-php" role="tab" aria-controls="nav-tab-read-php" aria-selected="true">PHP Array</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#nav-tab-read-js" role="tab" aria-controls="nav-tab-read-js" aria-selected="false">JavaScript Object</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tab-content-read">
            <div class="tab-pane fade show active" id="nav-tab-read-php" role="tabpanel" aria-labelledby="nav-tab-read-php">
<pre class="card-text bg-light mt-3 p-3">
[
    "email" => "your@email.com"
]
</pre>
            </div>
            <div class="tab-pane fade" id="nav-tab-read-js" role="tabpanel" aria-labelledby="nav-tab-read-js">
<pre class="card-text bg-light mt-3 p-3">
{
    email: "your@email.com"
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
   message: "User found!",
   data: {
      id: "1",
      email: "your@email.com",
      givenName: "John",
      familyName: "Smith",
      created: "2018-12-16 07:49:49"
   }
}
</pre>
    </div>
</div>