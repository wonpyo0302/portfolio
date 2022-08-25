/**
 * 
 */
 $(function(){
	
})
 
 window.onload = function() {
	let today = new Date();
	let year = today.getFullYear();
	let month = today.getMonth()+1;
	let date = today.getDate();
	console.log(today);
	console.log(year);
	console.log(month);
	console.log(date);
	year + '-' + month + '-' + date
	
	
	
	new Chart(document.getElementById("bar-chart"), {
	    type: 'bar',
	    
	    data: {
	
	      labels: [
					 month + '월' + (date-6)+"일 : "+$("#sale1").val()+"￦",
					 month + '월' + (date-5)+"일 : "+$("#sale2").val()+"￦",
					 month + '월' + (date-4)+"일 : "+$("#sale3").val()+"￦",
					 month + '월' + (date-3)+"일 : "+$("#sale4").val()+"￦",
					 month + '월' + (date-2)+"일 : "+$("#sale5").val()+"￦",
					 month + '월' + (date-1)+"일 : "+$("#sale6").val()+"￦",
					 month + '월' + (date)+"일 : "+$("#sale6").val()+"￦",
	      			],
	      			
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","red","yellow"],
	          data: [
						$("#sale1").val(),
						$("#sale2").val(),
						$("#sale3").val(),
						$("#sale4").val(),
						$("#sale5").val(),
						$("#sale6").val(),
						$("#sale7").val()
					]
	        }
	      ]
	    },
	    options: {
	      legend: { display: false },
	      title: {
	        display: true,
	        text: '최근 일주일 매출현황'
	      }
	    }
	});
	}