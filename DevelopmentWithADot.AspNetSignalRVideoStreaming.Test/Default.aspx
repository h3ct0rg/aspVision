﻿<%@ Page Language="C#" CodeBehind="Default.aspx.cs" Inherits="DevelopmentWithADot.AspNetSignalRVideoStreaming.Test.Default" %>
<%@ Register assembly="DevelopmentWithADot.AspNetSignalRVideoStreaming" namespace="DevelopmentWithADot.AspNetSignalRVideoStreaming" tagPrefix="web" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript" src="/Scripts/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="/Scripts/jquery.signalR-2.1.2.js"></script>
	<script type="text/javascript">

		function startStreaming()
		{
			document.getElementById('video').startStream();
		}

		function stopStreaming()
		{
			document.getElementById('video').stopStream();
		}

		function onStreamed(imageUrl, imageWidth, imageHeight)
		{
			//for StreamingMode="Event"
			var canvas = document.getElementById('received');
			var ctx = canvas.getContext('2d');
			var img = new Image();
			img.src = imageUrl;
			img.onload = function()
			{
				ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
			}
		}

	</script>
</head>
<body>
	<form runat="server">
	<div>
		<web:VideoStreaming runat="server" ID="video" ClientIDMode="Static" Width="200px" Height="200px" Resolution="Default" Interval="500" ScalingMode="TargetSize" StreamingMode="Target" TargetClientID="received" OnStreamed="onStreamed" Style="border: solid 1px black" />
		<canvas id="received" width="640" height="480" style="border: solid 1px black"></canvas>
		<br/>
		<input type="button" value="Start Streaming" onclick="startStreaming()"/>
		<input type="button" value="Stop Streaming" onclick="stopStreaming()" />
	</div>
	</form>
</body>
</html>
