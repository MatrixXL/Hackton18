conn = new Mongo();
db = conn.getDB("RFID");

for (i = 0; i < 4; i ++){
	db["temp_1_1_" + i.toString()].drop()
}

for (i = 0; i < 4; i ++){
	db["temp_3_1_" + i.toString()].drop()
}
