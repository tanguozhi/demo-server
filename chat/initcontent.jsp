<?xml version="1.0" encoding="UTF-8" ?>
<content>
    <head>
        <style>
            .body {background-color:#c88c9c;}
            .labl {font-size:20px;}
        </style>
        <script type="text/x-lua" src="RYTL.lua"></script>
        <script type="text/x-lua">
                <![CDATA[
                	function httpCallback(response)
                		--window:alert(response["responseBody"]);
                		local textStr = response["responseBody"];
                		location:replace(textStr);
                	end;
                    function jump4()
                    	--http:postAsyn(null, "/test", "aa=sdfsdf", httpCallback, null);
                    	local version = deviceInfo:getVersion("qweqweqw");
                    	--local os = deviceInfo:getOS()
                    	window:alert(version);
                    end;
                ]]>
        </script>
    </head>
    <body class='body' name='body'>
        <label class="labl">界面3</label>
        <input type="text" name="inp"/>
        <br/>
        <input type="button" value="跳转到界面444444" onclick="jump4()"/>
    </body>  
</content>
