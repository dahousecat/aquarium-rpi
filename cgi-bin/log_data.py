#! /usr/bin/python
 
from Phidgets.PhidgetException import PhidgetErrorCodes, PhidgetException
from Phidgets.Events.Events import AttachEventArgs, DetachEventArgs, ErrorEventArgs, TemperatureChangeEventArgs, InputChangeEventArgs, OutputChangeEventArgs, SensorChangeEventArgs
from Phidgets.Devices.TemperatureSensor import TemperatureSensor, ThermocoupleType
from Phidgets.Devices.InterfaceKit import InterfaceKit

from time import sleep
from datetime import *
import MySQLdb
import config

# Functions
def getTemp(type, max_tries=10):
    if max_tries < 1:
        logError("Phidget Exception on reading Temperature")
    try:
        if(type=='probe'):
            temp = temperatureSensor.getTemperature(0)
        elif (type=='ambient'):
            temp = temperatureSensor.getAmbientTemperature()
        return float(temp)
    except PhidgetException as e:
        sleep(40)
        return getTemp(type, max_tries=max_tries-1)

def getPhVal(max_tries=10):
    if max_tries < 1:
        logError("Phidget Exception on reading PH")
    try:
        ph = interfaceKit.getSensorValue(1)
        return float(ph)
    except PhidgetException as e:
        sleep(40)
        return getPhVal(max_tries=max_tries-1)

def logError(msg):
    global config
    appendFile = open(config.errorLog, 'a')
    appendFile.write(str(datetime.now()) + ": " + msg)
    appendFile.close()

def save(temp, ambient, ph):
    global MySQLdb, config
    try:
        db = MySQLdb.connect(host=config.db['host'], user=config.db['user'], passwd=config.db['passwd'], db=config.db['db'])
        cur = db.cursor() 
        sql = "INSERT INTO data SET ambient_temp=%.2f, aquarium_temp=%.2f, aquarium_ph=%.2f;" % (temp, ambient, ph)
        cur.execute(sql)
        db.commit()
        cur.close()
        db.close()
    except MySQLdb.Error, e:
        try:
            logError("MySQL Error [%d]: %s" % (e.args[0], e.args[1]))
        except IndexError:
            logError("MySQL Error: %s" % str(e))


# Get temp sensor object
try:
    temperatureSensor = TemperatureSensor()
except RuntimeError as e:
    logError("Runtime Exception: %s" % e.details)

# Open temp sensor object 
try:
    temperatureSensor.openPhidget() #295445
except PhidgetException as e:
    logError("Phidget Exception on Open")

# Connect to temp sensor 
try:
    temperatureSensor.waitForAttach(1000)
except PhidgetException as e:
    logError("Phidget Exception on Attach")

# Get temp
temp = getTemp('probe')
ambient = getTemp('ambient')


#Create an interfacekit object
try:
    interfaceKit = InterfaceKit()
except RuntimeError as e:
    logError("Runtime Exception on creating interface kit object: %s" % e.details)

#Opening phidget object
try:
    interfaceKit.openPhidget()
except PhidgetException as e:
    logError("Phidget Exception %i: %s" % (e.code, e.details))

# Wait for attach
try:
    interfaceKit.waitForAttach(10000)
except PhidgetException as e:
    logError("Phidget Exception %i: %s" % (e.code, e.details))
    try:
        interfaceKit.closePhidget()
    except PhidgetException as e:
        logError("Phidget Exception %i: %s" % (e.code, e.details))


phVal = getPhVal()

# Calibration... TODO: Use proper 2 point calibration instead of just 1 point
phVal = phVal - 24;
#print phVal

# Work out actual PH val
ph = 7 - (  (2.5 - (phVal / 200) )  /  (0.257179 + 0.000941468 * temp)  )

# Save values
save(temp, ambient, ph)

#print("Temp: %.2f, ambient: %.2f, ph: %.2f" % (temp, ambient, ph))
 
temperatureSensor.closePhidget()
interfaceKit.closePhidget()

exit(0)
