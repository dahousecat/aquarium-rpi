<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="#" class="navbar-brand">Aquarium Stats</a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li<?php echo $_SERVER['REQUEST_URI'] == '/' ? ' class="active"' : ''; ?>><a href="/">Home</a></li>
        <li<?php echo substr($_SERVER['REQUEST_URI'], 0, 9) == '/data.php' ? ' class="active"' : ''; ?>><a href="/data.php">Data</a></li>
        <li<?php echo substr($_SERVER['REQUEST_URI'], 0, 11) == '/graphs.php' ? ' class="active"' : ''; ?>><a href="/graphs.php">Graphs</a></li>
      </ul>
    </div>
  </div>
</nav>
