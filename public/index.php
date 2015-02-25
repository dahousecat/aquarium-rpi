<?php
include('inc/functions.php'); 

include('templates/head.php');

$stats = get_latest_stats();


?>

<ul class="list-group">
  <li class="list-group-item list-group-item-info">
    <h4>
      <span class="glyphicon glyphicon-menu-right"></span>
      Aquarium temprature: <strong><?=$stats['aquarium_temp']?></strong>
    </h4>
  </li>
  <li class="list-group-item list-group-item-info">
    <h4>
      <span class="glyphicon glyphicon-menu-right"></span>
      Aquarium PH: <strong><?=$stats['aquarium_ph']?></strong>
    </h4>
  </li>
  <li class="list-group-item list-group-item-info">
    <h4>
      <span class="glyphicon glyphicon-menu-right"></span> 
      Ambient Temprature: <strong><?=$stats['ambient_temp']?></strong>
    </h4>
  </li>
  <li class="list-group-item list-group-item-info">
    <h4>
      <span class="glyphicon glyphicon-menu-right"></span> 
      Last reading: <strong><?=date('h:i', strtotime($stats['timestamp']))?></strong>
    </h4>
  </li>
</ul>

<?php
    
include('templates/footer.php'); 

?>