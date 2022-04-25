from flask import (
    Flask,
    request
)

from datetime import datetime

from app.database import user

app = Flask(__name__)
VERSION = "1.0.0" 


@app.get("/version")
def get_version():
    out = {
        "server_time": datetime.now().strftime("%F %H:%M:%S"),
        "version": VERSION
    }
    return out

@app.get("/users/")
def get_all_users():
    user_list = user.scan()
    resp = {
        "status": "ok",
        "message": "success",
        "user": user_list
    }
    return resp


@app.get("/users/<int:pk>/")
def get_user_by_id(pk):
    target_user = user.select_by_id(pk)
    resp = {
        "status": "ok",
        "message": "success"
    }
    if target_user:              #IF "target_user" is not empty
        resp["user"] = target_user
        return resp                #Flask will return an HTTP STATUS of 200 by default
    else:
        resp["status"] = "error"
        resp["message"] = "user not found"
        return resp, 404        #WE can explicitly set a diff status code like this.


    return resp

@app.post("/users/")
def create_user():
    user_data = request.json       #request is a Flask context object
    user.insert(user_data)
    return "", 204              #NO content status code, Operation successfule but
                                #no content to display or return

@app.put("/users/<int:pk>/")
def update_user(pk):        
    user_data = request.json
    user.update(pk, user_data)
    return "", 204


@app.delete("/users/<int:pk>/")
def deactivate_user(pk):
    user.deactivate(pk)  #soft delete set active bit for target to 0 to deactivate
    return "", 204

    #VEHICLES

@app.post("/vehicles/")
def create_vehicle(pk):
    vehicle_data = request.json       #request is a Flask context object
    vehicle.insert(vehicle_data)
    return "", 204

@app.get("/vehicles/")
def get_all_vehicles():
    vehicle_list = vehicle.scan()
    resp = {
        "status": "ok",
        "message": "success",
        "vehicles": vehicle_list
    }
    return resp

@app.get("/vehicles/<int:pk>/")
def get_vehicle_by_id(pk):
    target_vehicle = vehicle.select_by_id(pk)
    resp = {
        "status": "ok",
        "message": "success"
    }
    if target_vehicle:              #IF "target_user" is not empty
        resp["vehicle"] = target_vehicle
        return resp                #Flask will return an HTTP STATUS of 200 by default
    else:
        resp["status"] = "error"
        resp["message"] = "vehicle not found"
        return resp, 404        #WE can expl

@app.put("/vehicles/<int:pk>/")
def update_vehicle(pk):        
    vehicle_data = request.json
    vehicle.update(pk, vehicle_data)
    return "", 204

@app.delete("/vehicles/<int:pk>/")
def deactivate_vehicle(pk):
    vehicle.deactivate(pk)  #soft delete set active bit for target to 0 to deactivate
    return "", 204


