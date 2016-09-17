
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
                        text: 'Temperature (F)'
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
      		      data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6, 9.4, 9.2, 9.4, 9.2, 9.4, 9.3, 9.7, 9.4, 10.2, 10.2, 10.2, 12.2]
      	 		 }]
			 });
 });
