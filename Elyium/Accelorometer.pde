//accelorometer listener
class Accelerometer implements SensorEventListener {
  //accelorometer values
  float ax, ay, az;

  //update x y z when new sensor data is recieved
  public void onSensorChanged(SensorEvent event) {
    ax = event.values[0];
    ay = event.values[1];
    az = event.values[2];
  }

  //must implement abstract methods from SensorEventListener
  public void onAccuracyChanged(Sensor acc, int accuracy) {
    //clear
  }
}

//use sensor API to obtain context of activity containing the sketch (I literally copied this off Processing 4 Android's website, don't ask)
public void setupAccelorometer() {
  accContext = getActivity();
  accManager = (SensorManager)accContext.getSystemService(Context.SENSOR_SERVICE);
  acc = accManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  accelorometer = new Accelerometer();
  accManager.registerListener(accelorometer, acc, SensorManager.SENSOR_DELAY_GAME);
}