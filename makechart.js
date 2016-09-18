
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
                    min: 0,
                    title: {
                        text: 'Temperature (C)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} C</b></td></tr>',
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
      		        data: [13.69, 13.30, 12.67, 11.60, 11.98, 12.09, 13.29, 14.42, 15.51, 16.70, 17.49, 18.16, 18.76, 18.96, 19.32, 19.72, 18.80, 18.13, 18.00, 17.93, 15.51, 15.83, 16.88, 15.97]
      	 		 }]
			 });
 });
