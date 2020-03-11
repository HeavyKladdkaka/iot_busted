# iot_busted

An app used when away from home to control a PIR Motion Sensor and a Camera attached to a Raspberry Pi 3 to prevent your apartment from getting robbed.


# Node-Red flow (copy-paste):

[{"id":"2c712a3c.733f16","type":"tab","label":"Flow 1","disabled":false,"info":""},{"id":"81a25f30.3391e","type":"rpi-gpio in","z":"2c712a3c.733f16","name":"","pin":"12","intype":"up","debounce":"25","read":false,"x":330,"y":400,"wires":[["53232de8.8fac34"]]},{"id":"53232de8.8fac34","type":"firebase modify","z":"2c712a3c.733f16","name":"PIR Value to Firebase","firebaseconfig":"","childpath":"PIR-SENSOR","method":"set","value":"msg.payload","priority":"msg.priority","x":600,"y":380,"wires":[["ae1ba151.24e42"]]},{"id":"ae1ba151.24e42","type":"switch","z":"2c712a3c.733f16","name":"","property":"payload","propertyType":"msg","rules":[{"t":"eq","v":"0","vt":"num"},{"t":"eq","v":"1","vt":"num"}],"checkall":"true","repair":false,"outputs":2,"x":970,"y":420,"wires":[["b9fc6e01.bd74d"],[]]},{"id":"b9fc6e01.bd74d","type":"camerapi-takephoto","z":"2c712a3c.733f16","filemode":"1","filename":"snapshot","filedefpath":"1","filepath":"","fileformat":"jpeg","resolution":"1","rotation":"0","fliph":"0","flipv":"0","brightness":"50","contrast":"0","sharpness":"0","quality":"80","imageeffect":"none","exposuremode":"auto","iso":"0","agcwait":"1.0","led":"0","awb":"auto","name":"","x":960,"y":560,"wires":[["b09deb9a.b25d98"]]},{"id":"d85ad841.6a3208","type":"firebase modify","z":"2c712a3c.733f16","name":"Camera Value to Firebase","firebaseconfig":"","childpath":"CAMERA","method":"set","value":"msg.payload","priority":"msg.priority","x":1230,"y":600,"wires":[[]]},{"id":"669f3b75.822fd4","type":"function","z":"2c712a3c.733f16","name":"","func":"let storageRef = \"https://iotproject01-47f02.firebaseio.com/CAMERA\";\n\nlet snapshotRef = msg.payload;\n\n\nreturn msg;","outputs":1,"noerr":0,"x":710,"y":540,"wires":[[]]},{"id":"b09deb9a.b25d98","type":"file in","z":"2c712a3c.733f16","name":"snapshot Buffer","filename":"/home/pi/Pictures/snapshot","format":"","chunk":false,"sendError":false,"encoding":"none","x":560,"y":660,"wires":[["59990e9e.f615f"]]},{"id":"8c3747fb.0d67d8","type":"image viewer","z":"2c712a3c.733f16","name":"","width":"100","data":"payload","dataType":"msg","x":1030,"y":740,"wires":[[]]},{"id":"6bed71b2.89cf7","type":"file","z":"2c712a3c.733f16","name":"","filename":"/home/pi/Pictures/snapshot","appendNewline":true,"createDir":false,"overwriteFile":"false","encoding":"none","x":300,"y":660,"wires":[[]]},{"id":"2c06d533.e19a8a","type":"jimp-image","z":"2c712a3c.733f16","name":"Promote Worf (Blit)","data":"payload","dataType":"msg","ret":"img","parameter1":"worf","parameter1Type":"msg","parameter2":"10","parameter2Type":"num","parameter3":"5","parameter3Type":"num","parameter4":"0","parameter4Type":"num","parameter5":"0","parameter5Type":"num","parameter6":"100","parameter6Type":"num","parameter7":"52","parameter7Type":"num","parameter8":"","parameter8Type":"","parameterCount":7,"jimpFunction":"blit","selectedJimpFunction":{"name":"blit","fn":"blit","description":"blit the image with another Jimp image at x, y, optionally cropped","parameters":[{"name":"src","type":"","required":true,"hint":"the source Jimp instance","defaultType":"msg","defaultValue":"payload"},{"name":"x","type":"num","required":true,"hint":"the x position to blit the image"},{"name":"y","type":"num","required":true,"hint":"the y position to blit the image"},{"name":"srcx","type":"num","required":false,"hint":"the x position from which to crop the source image"},{"name":"srcy","type":"num","required":false,"hint":"the y position from which to crop the source image"},{"name":"srcw","type":"num","required":false,"hint":"the width to which to crop the source image"},{"name":"srch","type":"num","required":false,"hint":"the height to which to crop the source image"}]},"x":510,"y":1680,"wires":[["38fc9e0d.de1cf2","83cf4241.8e1fc"]],"icon":"font-awesome/fa-image"},{"id":"38fc9e0d.de1cf2","type":"debug","z":"2c712a3c.733f16","name":"","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"true","targetType":"full","x":470,"y":1720,"wires":[]},{"id":"cdf19db2.49c85","type":"inject","z":"2c712a3c.733f16","name":"","topic":"","payload":"true","payloadType":"bool","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":430,"y":1600,"wires":[["e80c983a.1bb5c8"]]},{"id":"e80c983a.1bb5c8","type":"jimp-image","z":"2c712a3c.733f16","name":"Worf","data":"data:image/jpeg;base64,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","dataType":"str","ret":"img","parameter1":"100","parameter1Type":"num","parameter2":"100","parameter2Type":"num","parameter3":"RESIZE_BICUBIC","parameter3Type":"none","parameter4":"","parameter4Type":"","parameter5":"","parameter5Type":"","parameter6":"","parameter6Type":"","parameter7":"","parameter7Type":"","parameter8":"","parameter8Type":"","parameterCount":3,"jimpFunction":"resize","selectedJimpFunction":{"name":"resize","fn":"resize","description":"resize the image. One of the w or h parameters can be set to automatic (\"Jimp.AUTO\" or -1).","parameters":[{"name":"w","type":"num|auto","required":true,"hint":"the width to resize the image to (or \"Jimp.AUTO\" or -1)"},{"name":"h","type":"num|auto","required":true,"hint":"the height to resize the image to (or \"Jimp.AUTO\" or -1)"},{"name":"mode","type":"resizeMode","required":false,"hint":"a scaling method (e.g. Jimp.RESIZE_BEZIER)"}]},"x":550,"y":1600,"wires":[["7464aaa3.bf1724","b9457dcb.21b04"]],"icon":"font-awesome/fa-image"},{"id":"7464aaa3.bf1724","type":"change","z":"2c712a3c.733f16","name":"","rules":[{"t":"set","p":"worf","pt":"msg","to":"payload","tot":"msg"}],"action":"","property":"","from":"","to":"","reg":false,"x":435,"y":1640,"wires":[["31fd93f.ec2b36c"]],"l":false},{"id":"31fd93f.ec2b36c","type":"jimp-image","z":"2c712a3c.733f16","name":"Picard","data":"data:image/png;base64,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","dataType":"str","ret":"img","parameter1":"120","parameter1Type":"num","parameter2":"120","parameter2Type":"num","parameter3":"RESIZE_BILINEAR","parameter3Type":"none","parameter4":"","parameter4Type":"","parameter5":"","parameter5Type":"","parameter6":"","parameter6Type":"","parameter7":"","parameter7Type":"","parameter8":"","parameter8Type":"","parameterCount":3,"jimpFunction":"resize","selectedJimpFunction":{"name":"resize","fn":"resize","description":"resize the image. One of the w or h parameters can be set to automatic (\"Jimp.AUTO\" or -1).","parameters":[{"name":"w","type":"num|auto","required":true,"hint":"the width to resize the image to (or \"Jimp.AUTO\" or -1)"},{"name":"h","type":"num|auto","required":true,"hint":"the height to resize the image to (or \"Jimp.AUTO\" or -1)"},{"name":"mode","type":"resizeMode","required":false,"hint":"a scaling method (e.g. Jimp.RESIZE_BEZIER)"}]},"x":550,"y":1640,"wires":[["2c06d533.e19a8a","292ff8e1.81a978"]],"icon":"font-awesome/fa-image"},{"id":"d39b2349.ed3bb","type":"comment","z":"2c712a3c.733f16","name":"Working with multiple images and demonstrating Blit function","info":"","x":580,"y":1560,"wires":[]},{"id":"b9457dcb.21b04","type":"image viewer","z":"2c712a3c.733f16","name":"Worf","width":"100","data":"payload","dataType":"msg","x":990,"y":1600,"wires":[[]]},{"id":"292ff8e1.81a978","type":"image viewer","z":"2c712a3c.733f16","name":"Jean Luc","width":"100","data":"payload","dataType":"msg","x":860,"y":1640,"wires":[[]]},{"id":"83cf4241.8e1fc","type":"image viewer","z":"2c712a3c.733f16","name":"Capt' Worf","width":"100","data":"payload","dataType":"msg","x":710,"y":1680,"wires":[[]]},{"id":"59990e9e.f615f","type":"jimp-image","z":"2c712a3c.733f16","name":"Convert to base64","data":"payload","dataType":"msg","ret":"img","parameter1":"","parameter1Type":"","parameter2":"","parameter2Type":"","parameter3":"","parameter3Type":"","parameter4":"","parameter4Type":"","parameter5":"","parameter5Type":"","parameter6":"","parameter6Type":"","parameter7":"","parameter7Type":"","parameter8":"","parameter8Type":"","parameterCount":0,"jimpFunction":"none","selectedJimpFunction":{"name":"none","fn":"none","description":"Just loads the image.","parameters":[]},"x":830,"y":660,"wires":[["8c3747fb.0d67d8","d85ad841.6a3208"]]}]
