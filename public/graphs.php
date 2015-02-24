<?php
include('inc/functions.php'); 

add_js('https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.1/Chart.min.js');

$from = get_from_date();
$to = get_to_date();
$granularity = get_granularity();
$dataset = get_dataset();
$data = fetch_data($from, $to, $granularity);
$formatted_data = $dataset == 'temp' ? format_for_graph($data, true, true, false) : format_for_graph($data, false, false, true);

include('templates/head.php');  
?>
  
<div class="form-inline">
  <?php include('templates/filter.php'); ?>
</div>  

<div class="row">
  <h3>
    <?php if($dataset == 'temp') { ?>
    <span class="label label-aquarium-temp">Aquarium Temprature</span>
    <span class="label label-ambient-temp">Ambient Temprature</span>  
    <?php } else { ?>
    <span class="label label-aquarium-ph">Aquarium PH</span>  
    <?php } ?>
    
  </h3>
</div>

<div class="row">
  <canvas id="graph" height="450" width="600"></canvas>
</div>

<script>
var chartData = <?=$formatted_data?>;

window.onload = function(){
  var ctx = document.getElementById("graph").getContext("2d");
  var options = {
    responsive: true
  }
  window.lineGraph = new Chart(ctx).Line(chartData, options);
}
</script>      

    
<?php include('templates/footer.php'); ?>