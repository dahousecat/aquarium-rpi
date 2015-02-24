<?php
$from = get_from_date();
$to = get_to_date();
$granularity = get_granularity();
$data = fetch_data($from, $to, $granularity);
?>

<table class="table table-striped">
  <thead>
    <tr>
      <th>Date</th>
      <th>Time</th>
      <th>Ambient Temprature</th>
      <th>Aquarium Temprature</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($data as $row) { ?>
    <tr>
      <td><?=date('d/m/Y', strtotime($row['timestamp']))?></td>
      <td><?=date('h:i:s', strtotime($row['timestamp']))?></td>
      <td><?=$row['ambient_temp']?></td>
      <td><?=$row['aquarium_temp']?></td>
    </tr>  
    <?php } ?>
  </tbody>
</table>