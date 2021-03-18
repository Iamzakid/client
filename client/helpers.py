from app import mysql
from MySQLdb import _exceptions


def select_one(sql, values):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute(sql, values)
        result = cursor.fetchone()
        cursor.close()
        return result
    except (_exceptions.Error, _exceptions.DatabaseError, _exceptions.MySQLError, _exceptions.IntegrityError) as e:
        print(e)
        return


def select_many(sql, values):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute(sql, values)
        results = cursor.fetchall()
        cursor.close()
        return results
    except (_exceptions.Error, _exceptions.DatabaseError, _exceptions.MySQLError, _exceptions.IntegrityError) as e:
        print(e)
        return


def insert_update(sql, values):
    try:
        cursor = mysql.connection.cursor()
        cursor.execute(sql, values)
        mysql.connection.commit()
        insert_id = cursor.lastrowid
        cursor.close()
        return insert_id
    except (_exceptions.Error, _exceptions.DatabaseError, _exceptions.MySQLError, _exceptions.IntegrityError) as e:
        print(e)
        mysql.connection.rollback()
        return
