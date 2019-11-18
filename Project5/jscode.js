function data_communication(){
		var xhr = new XMLHttpRequest();
		window.alert("server is not ready");
		xhr.onreadystatechange = function (e) {
			// The request finished and response is ready
			if (xhr.readyState == 4 && xhr.status == 200) {

					var replydata = JSON.parse(xhr.responseText);
					populateImages(replydata.images);
					populateEvents(replydata.events);
					populateMovies(replydata.movies);
					populateWeather(replydata.weather);
			}
			else {
				window.alert("server is not ready");
			}
		}
		xhr.open("POST", document.URL, true);
		xhr.setRequestHeader("Content-type", 'text/html');
		xhr.send(location_ip.value);
	}