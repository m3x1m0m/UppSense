$( document ).ready(function() {
	
	(function worker() {
		$.getJSON('/state', function(data) {
			document.getElementById('adc_0').textContent = data.adc_0;
			document.getElementById('adc_1').textContent = data.adc_1;
			document.getElementById('adc_2').textContent = data.adc_2;
			document.getElementById('adc_3').textContent = data.adc_3;
			
			setTimeout(worker, 5000);
		});
	})();
});