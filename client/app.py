from flask import Flask, request, send_from_directory
from flask_mysqldb import MySQL


app = Flask(__name__)
app.config['MYSQL_USER'] = ""
app.config['MYSQL_PASSWORD'] = ""
app.config['MYSQL_DB'] = "asterx_client"
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)


from helpers import select_one, insert_update


@app.route('/')
def test_main():
    print(request)
    action = request.args.get('f')
    device = request.args.get('device')
    if device and action == 'cmd':
        action_todo = select_one("SELECT row_id, action, done_time FROM scheduled WHERE device_id=%s ORDER BY row_id DESC LIMIT 1",(device,))
        if action_todo:
            if action_todo['done_time'] == 'NULL':
                insert_update("UPDATE scheduled SET done_time=CURRENT_TIMESTAMP WHERE row_id=%s", (action_todo['row_id'],))
            print(action_todo['action'])
            return f"{action_todo['action']} {action_todo['row_id']}"
        return "None command"
    return "Bad request"


@app.route('/fw/')
def test_fw():
    return send_from_directory('/tmp/', filename='file.txt', as_attachment=True)
