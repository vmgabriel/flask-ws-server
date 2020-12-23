"""
Server Configuration Load Base
"""

# Libraries
import os
from dotenv import load_dotenv


# Variables
load_dotenv(verbose=True)


configurations = {
    'host': os.getenv('HOST'),
    'port': os.getenv('PORT'),
}
