import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import gpiozero

LED1 = 12
LED2 = 14
MOTOR1 = 15
MOTOR2 = 16

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)
database = firestore.client()
collection = database.collection("devices")

living_room = collection.document('living_room').get().to_dict()
bedroom1 = collection.document('bedroom1').get().to_dict()


while True:
    led1 = gpiozero.LED(LED1)
    led1.value = 1