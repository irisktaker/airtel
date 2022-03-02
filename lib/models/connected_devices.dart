class ConnectedDevices {
  String image;
  String deviceType;
  String deviceName;
  String deviceId;
  bool isConnect = false;

  ConnectedDevices({
    required this.image,
    required this.deviceType,
    required this.deviceName,
    required this.deviceId,
    isConnect,
  });
}