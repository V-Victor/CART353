public void onResume() {
  super.onResume();
  //register listener on android only when in use to avoid unnecessary battery usage
  if (accManager != null) {
    accManager.registerListener(accelorometer, acc, SensorManager.SENSOR_DELAY_GAME);
  }
  
  //re-render visuals
  UI.setRendered(false);
}


public void onPause() {
  super.onPause();
  //unregister listener on android pause to avoid unnecessary battery usage
  if (accManager != null) {
    accManager.unregisterListener(accelorometer);
  }
}