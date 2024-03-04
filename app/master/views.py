import os
from flask_restful import Resource, Api
from flask import Flask, make_response, jsonify, Blueprint
from app import api

master_bp = Blueprint("master_bp", __name__)


class HealthCheck(Resource):
    def get(self):
        return make_response(jsonify({"health-check": "true"}), 200)


class Region(Resource):
    def get(self):
        region = os.environ.get("REGION")
        print(region)
        if region is None:
            return make_response(jsonify({"message": "In Asia Region"}), 200)

        return make_response(jsonify({"message": f"In {region} Region"}), 200)


api.add_resource(HealthCheck, "/health-check")
api.add_resource(Region, "/")
