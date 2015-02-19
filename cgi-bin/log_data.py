#! /usr/bin/python
 
from Phidgets.PhidgetException import PhidgetErrorCodes, PhidgetException
from Phidgets.Events.Events import AttachEventArgs, DetachEventArgs, ErrorEventArgs, TemperatureChangeEventArgs
from Phidgets.Devices.TemperatureSensor import TemperatureSensor, ThermocoupleType
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

def logError(msg):
    global config
    appendFile = open(config.errorLog, 'a')
    appendFile.write(str(datetime.now()) + ": " + msg)
    appendFile.close()

def save(temp, ambient):
    global MySQLdb, config
    try:
        db = MySQLdb.connect(host=config.db['host'], user=config.db['user'], passwd=config.db['passwd'], db=config.db['db'])
        cur = db.cursor() 
        sql = "INSERT INTO data SET ambient_temp=%.2f, aquarium_temp=%.2f;" % (temp, ambient)
        cur.execute(sql)
        db.commit()
        cur.close()
        db.close()
    except MySQLdb.Error, e:
        try:
            logError("MySQL Error [%d]: %s" % (e.args[0], e.args[1]))
        except IndexError:
            logError("MySQL Error: %s" % str(e))

try:
    temperatureSensor = TemperatureSensor()
except RuntimeError as e:
    logError("Runtime Exception: %s" % e.details)
 
try:
    temperatureSensor.openPhidget() #295445
except PhidgetException as e:
    logError("Phidget Exception on Open")
 
try:
    temperatureSensor.waitForAttach(1000)
except PhidgetException as e:
    logError("Phidget Exception on Attach")


temp = getTemp('probe')
ambient = getTemp('ambient')

save(temp, ambient)

#print("Temp: %.2f, ambient: %.2f" % (temp, ambient))
 
temperatureSensor.closePhidget()

exit(0)
