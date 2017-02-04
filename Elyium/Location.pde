//location listener
class MyLocationListener implements LocationListener {
  //on new data reception, update gps data
  public void onLocationChanged(Location location) {
    currentLatitude  = (float)location.getLatitude();
    currentLongitude = (float)location.getLongitude();
    currentAccuracy  = (float)location.getAccuracy();
    currentProvider  = location.getProvider();
  }

  public void onProviderDisabled (String provider) {
    currentProvider = "";
  }

  public void onProviderEnabled (String provider) {
    currentProvider = provider;
  }

  public void onStatusChanged (String provider, int status, Bundle extras) {
    //clear
  }
}

//setup location sensor when permission is granted by user (and check if location can be read)
void onPermissionsGranted() {
  if (checkPermission(Manifest.permission.ACCESS_FINE_LOCATION) || checkPermission(Manifest.permission.ACCESS_COARSE_LOCATION)) {
    Context locContext = getActivity();
    locListener = new MyLocationListener();
    locManager = (LocationManager)locContext.getSystemService(Context.LOCATION_SERVICE); 
    locManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 0, 0, locListener);
    hasLocation = true;
  } else {
    hasLocation = false;
  }
}