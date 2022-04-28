import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import RPi.GPIO as GPIO

# Declare the GPIO settings
GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)

# set up GPIO pins
GPIO.setup(7, GPIO.OUT)  # Connected to PWMA
GPIO.setup(11, GPIO.OUT)  # Connected to AIN2
GPIO.setup(12, GPIO.OUT)  # Connected to AIN1

GPIO.setup(13, GPIO.OUT)  # Connected to STBY

GPIO.setup(15, GPIO.OUT)  # Connected to BIN1
GPIO.setup(16, GPIO.OUT)  # Connected to BIN2
GPIO.setup(18, GPIO.OUT)  # Connected to PWMB

GPIO.setup(38, GPIO.OUT)
GPIO.setup(40, GPIO.OUT)

# LED1 = gpiozero.LED(20)
# LED2 = gpiozero.LED(21)

cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)
database = firestore.client()
collection = database.collection("devices")

while True:
    living_room = collection.document('living_room').get().to_dict()
    bedroom1 = collection.document('bedroom1').get().to_dict()

    if living_room['1']:
        GPIO.output(38, GPIO.HIGH)
        print('LED1 - ON')

    if not living_room['1']:
        GPIO.output(38, GPIO.LOW)
        print('LED1 - OFF')

    if living_room['2']:
        GPIO.output(12, GPIO.LOW)
        GPIO.output(11, GPIO.HIGH)
        GPIO.output(7, GPIO.HIGH)
        print('MOTOR1 - ON')

    if not living_room['2']:
        GPIO.output(12, GPIO.LOW)  # Set AIN1
        GPIO.output(11, GPIO.LOW)  # Set AIN2
        GPIO.output(7, GPIO.LOW)  # Set PWMA
        print('MOTOR1 - OFF')

    if bedroom1['1']:
        GPIO.output(40, GPIO.HIGH)
        print('LED2 - ON')

    if not bedroom1['1']:
        GPIO.output(40, GPIO.LOW)
        print('LED2 - OFF')

    if bedroom1['2']:
        GPIO.output(16, GPIO.LOW)
        GPIO.output(15, GPIO.HIGH)
        GPIO.output(18, GPIO.HIGH)
        print('MOTOR2 - ON')

    if not bedroom1['2']:
        GPIO.output(16, GPIO.LOW)  # Set AIN1
        GPIO.output(15, GPIO.LOW)  # Set AIN2
        GPIO.output(18, GPIO.LOW)  # Set PWMA
        print('MOTOR2 - OFF')

    print()
    print()
