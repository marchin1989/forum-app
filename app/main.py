from fastapi import FastAPI
import datetime
import mysql.connector
import json
from datetime import date, datetime

# date, datetimeの変換関数
def json_serial(obj):
    # 日付型の場合には、文字列に変換します
    if isinstance(obj, (datetime, date)):
        return obj.isoformat()
    # 上記以外はサポート対象外.
    raise TypeError ("Type %s not serializable" % type(obj))

app = FastAPI()

@app.get("/api/items")
def read_item():
    # dbに接続
    cnx = mysql.connector.connect(user='mysql', host='127.0.0.1', password="password", database='forum')
    cursor = cnx.cursor()
    query = ("SELECT id, message, created_at FROM posts")
    cursor.execute(query)

    items = list()
    for (id, message, created_at) in cursor:
        items.append({"id": id, "message": message, "created_at": created_at})

    return json.dumps({"items": items}, default=json_serial)
    cursor.close()
    cnx.close()

    return {"item_id": item_id, "q": q}

@app.get("/api/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
