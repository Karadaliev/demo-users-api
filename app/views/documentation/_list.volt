<h5>LIST</h5>
<p>
    Read user's list from the database. As a option you can determine the start position of the listing, and the limit of the results.<br>
    Both parameters (`start`, and `limit`) are <strong>optional</strong>, and they accept "0" as a parameter too. <br>
    url: <strong class="text-info">http://{{ request.getServer("HTTP_HOST") }}/api/list</strong>
</p>

<div class="card">
    <div class="card-body">
        <h6 class="card-title">Expected parameters:</h6>
        <nav>
            <div class="nav nav-tabs" id="nav-tabs-list" role="tablist">
                <a class="nav-item nav-link active" data-toggle="tab" href="#nav-tab-list-php" role="tab" aria-controls="nav-tab-list-php" aria-selected="true">PHP Array</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#nav-tab-list-js" role="tab" aria-controls="nav-tab-list-js" aria-selected="false">JavaScript Object</a>
            </div>
        </nav>
        <div class="tab-content" id="nav-tab-content-list">
            <div class="tab-pane fade show active" id="nav-tab-list-php" role="tabpanel" aria-labelledby="nav-tab-list-php">
<pre class="card-text bg-light mt-3 p-3">
[
    "start" => 0,
    "limit" => 2,
]
</pre>
            </div>
            <div class="tab-pane fade" id="nav-tab-list-js" role="tabpanel" aria-labelledby="nav-tab-list-js">
<pre class="card-text bg-light mt-3 p-3">
{
    start: 0,
    limit: 2
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
[
    {
        id: 1,
        email: "your@email.com",
        givenName: "John",
        familyName: "Smith",
        created: "2018-12-16 09:39:30"
    },
    {
        id: 1,
        email: "another@email.com",
        givenName: "Jenny",
        familyName: "Jones",
        created: "2018-12-16 11:01:00"
    },
]
</pre>
    </div>
</div>