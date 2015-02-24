<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Filters</h3>
  </div>
  <div class="panel-body">

    <form class="filter-form" method="POST">
      
      <button type="submit" class="btn btn-secondary" name="back"><< 1 Day</button>
      
      <div class="form-group">
        <label for="from-date">From</label>
        <input type="text" class="form-control datepicker" name="from" id="from-date" value="<?=get_from_date()?>">
      </div>
      
      <div class="form-group">
        <label for="to-date">To</label>
        <input type="text" class="form-control datepicker" name="to" id="to-date" value="<?=get_to_date()?>">
      </div>
      
      <button type="submit" class="btn btn-secondary" name="forwards">1 Day >></button>
      
      <div class="form-group">
        <label for="granularity">Granularity</label>
        <?php $granularity = get_granularity(); ?>
        <select class="form-control" name="granularity" id="granularity">
          <option<?=$granularity=='half-hour'?' selected="SELECTED"':''?> value="half-hour">Half Hour</option>
          <option<?=$granularity=='hour'?' selected="SELECTED"':''?> value="hour">Hour</option>
          <option<?=$granularity=='day'?' selected="SELECTED"':''?> value="day">Day</option>
          <option<?=$granularity=='week'?' selected="SELECTED"':''?> value="week">Week</option>
        </select>
      </div>
      
      <div class="form-group">
        <label for="dataset">Dataset</label>
        <?php $dataset = get_dataset(); ?>
        <select class="form-control" name="dataset" id="dataset">
          <option<?=$dataset=='temp'?' selected="SELECTED"':''?> value="temp">Temp</option>
          <option<?=$dataset=='ph'?' selected="SELECTED"':''?> value="ph">PH</option>
        </select>
      </div>
       
      <button type="submit" class="btn btn-primary" name="submit">Search</button>
    
    </form>
    
  </div>
</div>

