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
	saveTextAsFile();
}

// https://stackoverflow.com/questions/21479107/saving-html5-textarea-contents-to-file
function saveTextAsFile() {
  var textToWrite = document.getElementById('raw_samples').value;
  var textFileAsBlob = new Blob([ textToWrite ], { type: 'text/plain' });
  var fileNameToSaveAs = "samples.csv";

  var downloadLink = document.createElement("a");
  downloadLink.download = fileNameToSaveAs;
  downloadLink.innerHTML = "Download File";
  if (window.webkitURL != null) {
    // Chrome allows the link to be clicked without actually adding it to the DOM.
    downloadLink.href = window.webkitURL.createObjectURL(textFileAsBlob);
  } else {
    // Firefox requires the link to be added to the DOM before it can be clicked.
    downloadLink.href = window.URL.createObjectURL(textFileAsBlob);
    downloadLink.onclick = destroyClickedElement;
    downloadLink.style.display = "none";
    document.body.appendChild(downloadLink);
  }

  downloadLink.click();
}

function destroyClickedElement(event) {
  // remove the link from the DOM
  document.body.removeChild(event.target);
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