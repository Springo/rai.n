
$(function () {
			$('#container').highcharts({
                title: {
                    text: 'Hourly Temperature'
                },
                xAxis: {
                    categories: ['12am', '1am', '2am', '3am', '4am', '5am',
                '6am', '7am', '8am', '9am', '10am', '11am', '12pm', '1pm','2pm','3pm','4pm','5pm','6pm','7pm','8pm','9pm','10pm','11pm']
                },
                yAxis: {
                    min: -1,
                    title: {
                        text: 'Temperature (C)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} F</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
        	   	series: [{
        		    name: 'Todays Temperatures',
      		        data: [1.76, 1.38, 1.01, 0.22, 0.08, -0.69, -0.48, -0.21, -0.26, 1.08, 2.58, 3.88, 4.78, 5.15, 5.27, 5.01, 4.28, 4.15, 3.54, 3.28, 2.15, 1.37, 1.30, 0.53]
      	 		 }]
			 });
 });
