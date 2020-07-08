
/* https://github.com/4wekromi*/

function readJsonFile(){
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", "user_ip_status.json", true);
    rawFile.onreadystatechange = function (){
        if(rawFile.readyState === 4){
            if(rawFile.status === 200 || rawFile.status == 0){
                var buffer = JSON.parse(rawFile.responseText);
				generateResult(buffer);
            }
        }
    }
    rawFile.send(null);
}

function generateResult(result) {
  var output = "";
  var i;
  var serial;
  output+='<table cellpadding="10"><tr><th>SL No.</th><th>Status</th><th>IP Address</th><th>System</th></tr>';
  for(i = 0; i < result.length; i++) {
	serial=i+1;
	output+='<tr><td>'+serial+'</td><td>';
  	if(result[i].status==1)
		output+='<span style="color:green">Online</span></td>';
	else
		output+='<span style="color:red">Offline</span></td>';
    output +='<td><span style="color:blue">' + result[i].ip + '</span></td><td>'+result[i].user+'</td><br />';
	output+='</tr>';
  }
  output+='</table>';
  document.getElementById("id01").innerHTML = output;
}