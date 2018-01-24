conn = new Mongo();
db = conn.getDB("RFID");

for (i = 0; i < 4; i++){
	db["raw_data_192.168.0.69"].aggregate([
		{$sort:{measurement_uuid:1}},
		{$match:{"data.AntennaPort" : {$mod:[4, i]}}},
		{$project:{RSSI:"$data.RSSI",EPC:"$data.EPC", measurement_uuid:1}}, 
		{$group:{_id: "$EPC", obs_by:{$push:{measurement_uuid:"$measurement_uuid", RSSI:"$RSSI"}}}},
		{$out:"temp_1_1_" + i.toString()}], 
		{allowDiskUse:true});
	db["temp"+ i.toString()].createIndex({_id: 1},{unique:true})
}

//Aufgabe 3

//for (i = 0; i < 4; i++){
	//db["raw_data_192.168.0.69"].aggregate([
		//{$match:{"data.AntennaPort" : {$mod:[4, i]}}},
		//{$group:{_id: "$data.EPC", count:{$sum:1}}},
		//{$out:"temp_3_1_" + i.toString()}], 
		//{allowDiskUse:true});
	//db["temp"+ i.toString()].createIndex({_id: 1},{unique:true})
//}
