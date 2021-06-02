from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = API(app)

class Product(Resource):
    def get(self):
        return {
            'product': []
        }
        