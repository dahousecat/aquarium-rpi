 $(function() {
  $(".datepicker").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: "dd-mm-yy"
  });
  
  $('.filter-formXXX').submit(function(e){
    
    e.preventDefault();
    
    $.ajax({
      url: "/index.php",
      data: {
        'request': 'data',
        'from': $('#from-date').val(),
        'to': $('#to-date').val(),
        'granularity': $('#granularity').val(),
        'dataType': 'json',
      },
    }).success(function(data) {
      
      console.log(window.myLine);
      console.log(data);
      
      
      var numEtPoints = window.myLine.datasets[0].points.length;
      
      var numExistingPoints = window.myLine.scale.xLabels.length;
      var numNewPoints = data.labels.length;
      
      var difference = numExistingPoints - numNewPoints;
      
      // Remove points if there are too many
      if(difference > 0) {
        for (i = 0; i < difference; i++) {
            window.myLine.removeData();
        }
      }

      // Update point values
      for (i = 0; i < window.myLine.scale.xLabels.length; i++) {
          
          // Labels
          window.myLine.scale.xLabels[i] = data.labels[i];
          
          // Ambient Temprature
          window.myLine.datasets[0].points[i] = data.datasets[0].data[i];
          
          // Aquarium Temprature
          window.myLine.datasets[1].points[i] = data.datasets[1].data[i];
      }
      
      // Add any more points if there are not enough
      if(difference < 0) {
        for (i = window.myLine.scale.xLabels.length; i < window.myLine.scale.xLabels.length + difference; i++) {
            
            window.myLine.addData([data.datasets[0].data[i], data.datasets[1].data[i]], data.labels[i]);
            
        }
      }
      
      
      //var numNtPoints = data
      
      
      
      //lineChartData = data;
      
      window.myLine.update();
      
    });
    
  })
  
});