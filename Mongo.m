conn = mongo('localhost',27017,'RFID')
%doc = find(conn,'user_scripts')
conn.CollectionNames