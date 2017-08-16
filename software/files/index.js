$( document ).ready(function() {
	
	(function worker() {
		$.getJSON('/state', function(data) {
			document.getElementById('adc_1').textContent = data.adc_1;
			document.getElementById('adc_2').textContent = data.adc_2;
			document.getElementById('adc_3').textContent = data.adc_3;
			document.getElementById('adc_4').textContent = data.adc_4;
			
			//var text = document.getElementById('raw_adc');
			//text.value += data.raw_adc; 
			
			setTimeout(worker, 500);
		});
	})();
});
