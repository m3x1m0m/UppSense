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
	
	var wsUri = "ws://" + location.host + "/ws";
    websocket = new WebSocket(wsUri);
    websocket.onopen = function(evt) { onOpen(evt) };
    websocket.onclose = function(evt) { onClose(evt) };
    websocket.onmessage = function(evt) { onMessage(evt) };
    websocket.onerror = function(evt) { onError(evt) };
});

function buttonStartCallback(){
	websocket.send("start");
	var myTextArea = $('#raw_samples');
	myTextArea.val("");
}

function cleanCallback() { 
	var myTextArea = $('#raw_samples');
	myTextArea.val("");
}

function ch1() { 
	document.getElementById("channel_id").innerHTML = "Channel 1" 
	var myTextArea = $('#raw_samples');
	myTextArea.val("Stopped");
	websocket.send("ch1");
}

function ch2() {
	document.getElementById("channel_id").innerHTML = "Channel 2" 
	var myTextArea = $('#raw_samples');
	myTextArea.val("Stopped");
	websocket.send("ch2");
}

function ch3() {
	document.getElementById("channel_id").innerHTML = "Channel 3" 
	var myTextArea = $('#raw_samples');
	myTextArea.val("Stopped");
	websocket.send("ch3");
}

function ch4() {
	document.getElementById("channel_id").innerHTML = "Channel 4" 
	var myTextArea = $('#raw_samples');
	myTextArea.val("Stopped");
	websocket.send("ch4");
}



function buttonStopCallback(){
	websocket.send("stop");
	var myTextArea = $('#raw_samples');
}

function onOpen(evt) {
	console.log("CONNECTED"); 
}

function onClose(evt) {
	console.log("close");
}
  
function onMessage(evt) { 
	var myTextArea = $('#raw_samples');
	myTextArea.val(myTextArea.val() + evt.data);
}

function onError(evt){
    console.log("error: " + evt.data); 
}