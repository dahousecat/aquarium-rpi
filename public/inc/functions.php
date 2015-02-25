<?php

if(isset($_POST['submit']) || isset($_POST['back']) || isset($_POST['forwards'])) {
  
  if(isset($_POST['back'])) {
    $from = date('d-m-Y', strtotime($_POST['from']) - 86400);
    $to = date('d-m-Y', strtotime($_POST['to']) - 86400);
  } elseif(isset($_POST['forwards'])) {
    $from = date('d-m-Y', strtotime($_POST['from']) + 86400);
    $to = date('d-m-Y', strtotime($_POST['to']) + 86400);
  } else {
    $from = $_POST['from'];
    $to = $_POST['to'];
  }
  
  $args = array(
    $_SERVER['SCRIPT_NAME'],
    $from,
    $to,
    $_POST['granularity'],
    $_POST['dataset'],  
  );
  
  $url = vsprintf('%s?from=%s&to=%s&granularity=%s&dataset=%s', $args);
  
  header('Location: ' . $url);
  
}

if(isset($_GET['request'])) {
  if(function_exists('request_' . $_GET['request'])) {
    call_user_func('request_' . $_GET['request']);
  }
}

function request_data() {
  $data = fetch_data($_GET['from'], $_GET['to'], $_GET['granularity']);
  $data = format_for_graph($data);
  header('Content-Type: application/json');
  echo $data;
  die();
}

function fetch_data($from = null, $to = null, $granularity = null) {
  
  include('config.php');
  
  $dbhandle = mysql_connect($hostname, $username, $password) or die("Unable to connect to MySQL");
  $selected = mysql_select_db("fish",$dbhandle)  or die("Could not select examples");
  
  $sql = 'SELECT timestamp, ambient_temp, aquarium_temp, aquarium_ph FROM data WHERE 1=1';
  
  if(!is_null($from)) {
    $from = date('Y-m-d 00:00:00', strtotime($from));
    $sql .= " AND timestamp > '$from'";
  }
  
  if(!is_null($to)) {
    $to = date('Y-m-d 23:59:59', strtotime($to));
    $sql .= " AND timestamp < '$to'";
  }
  
  if(!is_null($granularity) && $granularity!='half-hour') {
    switch($granularity) {
      case 'week':
       $sql .= ' AND DAYOFWEEK(`timestamp`) = 1';
      case 'day':
        $sql .= ' AND HOUR(`timestamp`) = 0';
      case 'hour':
        $sql .= ' AND MINUTE(`timestamp`) = 0';
    }
  }
  
  $result = mysql_query($sql);
  
  $data = array();
  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
     $data[] = $row;
  }
 
  mysql_close($dbhandle);
  
  return $data;
}

function get_from_date($format='d-m-Y') {
  return isset($_GET['from']) ? $_GET['from'] : date($format, strtotime('- 1 DAY'));
}

function get_to_date($format='d-m-Y') {
  return isset($_GET['to']) ? $_GET['to'] : date($format, strtotime('NOW'));
}

function get_granularity() {
  return isset($_GET['granularity']) ? $_GET['granularity'] : 'half-hour';
}

function get_dataset() {
  return isset($_GET['dataset']) ? $_GET['dataset'] : 'temp';
}

function pdie() {
  $args = func_get_args();
  $style = 'style="background:#EEEEEE;padding:10px;margin:10px;border:1px solid #999999;"';
  foreach($args as $arg) {
    if($arg!=='return') {
      echo "<pre $style>".PHP_EOL;
      if(in_array(gettype($arg), array('boolean', 'NULL'))) var_dump($arg);
      else print_r($arg);
      echo '</pre>'.PHP_EOL;
    }
  }
  if(!array_search('return', $args, true)) die();
}

function add_js($js=null, $type=null) {
  static $all_js;
  if(is_null($js)) {
    foreach($all_js as $js) {
      echo $js . PHP_EOL;
    }
  }
  if($type=='inline') {
    $all_js[] = "<script>$js</script>";
  } else {
    $all_js[] = "<script src='$js'></script>";
  }
}

function format_for_graph($data, $ambient=false,$temp=false,$ph=false) {
  $labels = array();
  $ambient_temp = array();
  $aquarium_temp = array();
  foreach($data as $row) {
    $labels[] = date('d-m-y h:i', strtotime($row['timestamp']));
    $ambient_temp[] = $row['ambient_temp'];
    $aquarium_temp[] = $row['aquarium_temp'];
    $aquarium_ph[] = $row['aquarium_ph'];
  }
  
  $dataset_ambient_temp = array(
    'label' => "Ambient Temprature",
    'fillColor' => "rgba(255,255,175,0.2)",
    'strokeColor' => "rgba(220,220,220,1)",
    'pointColor' => "rgba(255,255,175,0.6)",
    'pointStrokeColor' => "#fff",
    'pointHighlightFill' => "#fff",
    'pointHighlightStroke' => "rgba(220,220,220,1)",
    'data' => $ambient_temp,
  );
  
  $dataset_aquarium_temp = array(
    'label' => "Aquarium Temprature",
    'fillColor' => "rgba(220,220,220,0.2)",
    'strokeColor' => "rgba(220,220,220,1)",
    'pointColor' => "rgba(220,220,220,1)",
    'pointStrokeColor' => "#fff",
    'pointHighlightFill' => "#fff",
    'pointHighlightStroke' => "rgba(220,220,220,1)",
    'data' => $aquarium_temp,
  );
  
  $dataset_aquarium_ph = array(
    'label' => "Aquarium PH",
    'fillColor' => "rgba(89,235,91,0.2)",
    'strokeColor' => "rgba(89,235,91,1)",
    'pointColor' => "rgba(89,235,91,0.6)",
    'pointStrokeColor' => "#fff",
    'pointHighlightFill' => "#fff",
    'pointHighlightStroke' => "rgba(89,235,91,1)",
    'data' => $aquarium_ph,
  );
    
  $line_chart_data = array(
    'labels' => $labels,
    'datasets' => array(),
  );
  
  if($ambient) $line_chart_data['datasets'][] = $dataset_ambient_temp;
  if($temp) $line_chart_data['datasets'][] = $dataset_aquarium_temp;
  if($ph) $line_chart_data['datasets'][] = $dataset_aquarium_ph;
  
  return json_encode($line_chart_data);
  
}

function get_latest_stats() {
  include('config.php');
  
  $dbhandle = mysql_connect($hostname, $username, $password) or die("Unable to connect to MySQL");
  $selected = mysql_select_db("fish",$dbhandle)  or die("Could not select examples");
  
  $sql = 'SELECT timestamp, ambient_temp, aquarium_temp, aquarium_ph FROM data ORDER BY timestamp DESC LIMIT 0, 1';
  $result = mysql_query($sql);
  
  return mysql_fetch_array($result, MYSQL_ASSOC);

}
