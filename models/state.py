#!/usr/bin/python3
""" State Module for HBNB project """
from models.base_model import BaseModel, Base
from os import getenv
from sqlalchemy.orm import relationship
from sqlalchemy import Column, String


class State(BaseModel, Base):
    """ State class """
    __tablename__ = "states"
    name = Column(String(128), nullable=False)

    if getenv("HBNB_TYPE_STORAGE", None) != "db":
        """ get cities for file storage"""
        @property
        def cities(self):
            """ getter method"""
            all_cities = model.storage.all('City')
            return [city for city in all_cities.values() if city.state_id == self.id]

    # Set attributes for a database storage
    cities = relationship('City', cascade='all, delete-orphan')
