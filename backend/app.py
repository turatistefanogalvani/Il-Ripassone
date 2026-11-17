from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)

def get_conn():
    # il MySQL nel container Docker (sezione 1)
    return mysql.connector.connect(
        host="127.0.0.1", user="root",
        password="root", database="gamestore")

def riga_to_dict(r):
    return {"id": r[0], "nome": r[1],
            "prezzo": float(r[2]),
            "prezzo_scontato": float(r[3])}

@app.get("/api/giochi")
def lista_giochi():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, nome, prezzo, "
                "prezzo * 0.8 AS prezzo_scontato "
                "FROM giochi")
    righe = cur.fetchall()
    cur.close(); conn.close()
    giochi = [riga_to_dict(r) for r in righe]
    return jsonify(giochi), 200