import 'package:flutter/material.dart';

import 'package:cddz_elevator_app/api/elevator_api.dart';
import 'package:cddz_elevator_app/page/elevator/config/config_run.dart';

class ElevatorConfigPage extends StatefulWidget {
  final String deviceNo;

  const ElevatorConfigPage({Key? key, required this.deviceNo}) : super(key: key);

  @override
  _ElevatorConfigPageState createState() => _ElevatorConfigPageState();
}

class _ElevatorConfigPageState extends State<ElevatorConfigPage>
    with SingleTickerProviderStateMixin {

  List<Map<String, dynamic>> navigationItems = [
    {'title': '电梯配置', 'icon': Icons.settings_suggest, 'expanded': false},
    {'title': 'MQTT配置', 'icon': Icons.insights, 'expanded': false},
    {'title': '对讲配置', 'icon': Icons.tty, 'expanded': true},
    {'title': '网络配置', 'icon': Icons.public, 'expanded': true},
    {'title': '4G配置', 'icon': Icons.four_g_mobiledata, 'expanded': true},
    {'title': 'IPC配置', 'icon': Icons.video_camera_front, 'expanded': true},
    {'title': 'GB28181', 'icon': Icons.widgets, 'expanded': true},
    {'title': 'AI配置', 'icon': Icons.hdr_auto, 'expanded': true},
    {'title': '系统配置', 'icon': Icons.settings, 'expanded': true},
  ];

  Map<String, dynamic> _allConfig = {};

  // 1、电梯配置
  Map<String, dynamic> _elmPara = {
    "serviceMode": 1,
    "floorNumber": 0,
    "startFloor": 0,
    "placement": 0,
    "deviceName": "",
    "phoneNumber": ""
  };
  TextEditingController floorNumberController = TextEditingController();
  TextEditingController startFloorController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  void setElmPara (Map<String, dynamic> _allConfig) {

    _elmPara = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["elmPara"]);
    floorNumberController = TextEditingController(text: "${_elmPara["floorNumber"]}");
    startFloorController = TextEditingController(text: "${_elmPara["startFloor"]}");
    deviceNameController = TextEditingController(text: _elmPara["deviceName"]);
    phoneNumberController = TextEditingController(text: _elmPara["phoneNumber"]);

  }

  //2、MQTT配置
  Map<String, dynamic> _mqttServer = {
    "servIp": "",
    "port": 0,
    "username": "",
    "passwd": "",
    "qos": 0,
    "subTopic": ""
  };
  TextEditingController servIpController = TextEditingController();
  TextEditingController portController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  TextEditingController qosController = TextEditingController();
  TextEditingController subTopicController = TextEditingController();
  void setMqttServer (Map<String, dynamic> _allConfig) {

    _mqttServer = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["mqttServer"]);
    servIpController = TextEditingController(text: "${_mqttServer["servIp"]}");
    portController = TextEditingController(text: "${_mqttServer["port"]}");
    usernameController = TextEditingController(text: "${_mqttServer["username"]}");
    passwdController = TextEditingController(text: "${_mqttServer["passwd"]}");
    qosController = TextEditingController(text: "${_mqttServer["qos"]}");
    subTopicController = TextEditingController(text: "${_mqttServer["subTopic"]}");

  }

  //3、对讲配置
  Map<String, dynamic> _talk = {
    "enable": 0,
    "appid": "",
    "frameRate": 0,
    "videoEnable": 0
  };
  TextEditingController appidController = TextEditingController();
  TextEditingController frameRateController = TextEditingController();
  void setTalk (Map<String, dynamic> _allConfig) {

    _talk = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["talk"]);
    appidController = TextEditingController(text: "${_talk["appid"]}");
    frameRateController = TextEditingController(text: "${_talk["frameRate"]}");

  }

  //4、网络配置
  Map<String, dynamic> _network = {
    "dhcp": 0,
    "dns1": "",
    "gatewayip": "",
    "ip": "",
    "name": "",
    "netmask": "",
    "mqttUrl": ""
  };
  TextEditingController dns1Controller = TextEditingController();
  TextEditingController gatewayipController = TextEditingController();
  TextEditingController ipController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController netmaskController = TextEditingController();
  TextEditingController mqttUrlController = TextEditingController();
  void setNetwork (Map<String, dynamic> _allConfig) {

    _network = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["network"]);
    dns1Controller = TextEditingController(text: "${_network["dns1"]}");
    gatewayipController = TextEditingController(text: "${_network["gatewayip"]}");
    ipController = TextEditingController(text: "${_network["ip"]}");
    nameController = TextEditingController(text: "${_network["name"]}");
    netmaskController = TextEditingController(text: "${_network["netmask"]}");
    mqttUrlController = TextEditingController(text: "${_network["mqttUrl"]}");

  }

  //5、4G配置
  Map<String, dynamic> _4G = {
    "enable": 0,
    "ime": "",
    "signal": 0,
    "ecm": 0
  };
  TextEditingController imeController = TextEditingController();
  TextEditingController signalController = TextEditingController();
  void set4G (Map<String, dynamic> _allConfig) {

    _4G = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["4G"]);
    imeController = TextEditingController(text: "${_4G["ime"]}");
    signalController = TextEditingController(text: "${_4G["signal"]}");

  }

  //6、IPC配置
  Map<String, dynamic> _IPC = {
    "factory": "",
    "username": "",
    "passwd": "",
    "ipAddr": "",
    "port": 0,
    "magic": "",
    "research": 0,
    "subStream": ""
  };
  TextEditingController factoryController = TextEditingController();
  TextEditingController usernameipcController = TextEditingController();
  TextEditingController passwdipcController = TextEditingController();
  TextEditingController ipAddrController = TextEditingController();
  TextEditingController portipcController = TextEditingController();
  TextEditingController magicController = TextEditingController();
  TextEditingController subStreamController = TextEditingController();
  void setIPC (Map<String, dynamic> _allConfig) {

    _IPC = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["IPC"]);
    factoryController = TextEditingController(text: "${_IPC["factory"]}");
    usernameipcController = TextEditingController(text: "${_IPC["username"]}");
    passwdipcController = TextEditingController(text: "${_IPC["passwd"]}");
    ipAddrController = TextEditingController(text: "${_IPC["ipAddr"]}");
    portipcController = TextEditingController(text: "${_IPC["port"]}");
    magicController = TextEditingController(text: "${_IPC["magic"]}");
    subStreamController = TextEditingController(text: "${_IPC["subStream"]}");

  }

  //7、GB28181
  Map<String, dynamic> _gb28181 = {
    "enable": 0,
    "expired": 0,
    "heartbeatCycle": 0,
    "LocalPort": 0,
    "Passwd": "",
    "passwdConfirm": "",
    "Platform": "",
    "sipId": "",
    "sipIp": "",
    "sipPort": 0,
    "sipRegion": "",
    "sipUser": "",
    "sipUsername": ""
  };
  TextEditingController expiredController = TextEditingController();
  TextEditingController heartbeatCycleController = TextEditingController();
  TextEditingController LocalPortController = TextEditingController();
  TextEditingController PasswdController = TextEditingController();
  TextEditingController passwdConfirmController = TextEditingController();
  TextEditingController PlatformController = TextEditingController();
  TextEditingController sipIdController = TextEditingController();
  TextEditingController sipIpController = TextEditingController();
  TextEditingController sipPortController = TextEditingController();
  TextEditingController sipRegionController = TextEditingController();
  TextEditingController sipUserController = TextEditingController();
  TextEditingController sipUsernameController = TextEditingController();
  void setGb28181 (Map<String, dynamic> _allConfig) {

    _gb28181 = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["gb28181"]);
    expiredController = TextEditingController(text: "${_gb28181["expired"]}");
    heartbeatCycleController = TextEditingController(text: "${_gb28181["heartbeatCycle"]}");
    LocalPortController = TextEditingController(text: "${_gb28181["LocalPort"]}");
    PasswdController = TextEditingController(text: "${_gb28181["Passwd"]}");
    passwdConfirmController = TextEditingController(text: "${_gb28181["passwdConfirm"]}");
    PlatformController = TextEditingController(text: "${_gb28181["Platform"]}");
    sipIdController = TextEditingController(text: "${_gb28181["sipId"]}");
    sipIpController = TextEditingController(text: "${_gb28181["sipIp"]}");
    sipPortController = TextEditingController(text: "${_gb28181["sipPort"]}");
    sipRegionController = TextEditingController(text: "${_gb28181["sipRegion"]}");
    sipUserController = TextEditingController(text: "${_gb28181["sipUser"]}");
    sipUsernameController = TextEditingController(text: "${_gb28181["sipUsername"]}");

  }

  //8、AI配置
  Map<String, dynamic> _AI = {
    "enable": 1,
    "personAppease": 0,
    "personKeep": 10,
    "ecycleAlarm": 0,
    "doorCheck": 1,
    "volume": 205
  };
  TextEditingController personKeepController = TextEditingController();
  TextEditingController volumeController = TextEditingController();
  void setAI (Map<String, dynamic> _allConfig) {

    _AI = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["AI"]);
    personKeepController = TextEditingController(text: "${_AI["personKeep"]}");
    volumeController = TextEditingController(text: "${_AI["volume"]}");

  }

  //9、系统配置
  Map<String, dynamic> _sysCtrl = {
    "rebootEnable": 1,
    "rebootTime": 4,
    "floorUseio": 0,
    "directCountFloor": 0,
    "pressCalibrateFloor": 0
  };
  TextEditingController rebootTimeController = TextEditingController();
  TextEditingController floorUseioController = TextEditingController();
  void setSysCtrl (Map<String, dynamic> _allConfig) {

    _sysCtrl = Map<String, dynamic>.from(_allConfig["d"]["getConfig"]["sysCtrl"]);
    rebootTimeController = TextEditingController(text: "${_sysCtrl["rebootTime"]}");
    floorUseioController = TextEditingController(text: "${_sysCtrl["floorUseio"]}");

  }

  bool isLoading = true;

  void _connect() async {
    Map<String, dynamic> params = {
      "deviceCode": widget.deviceNo,
    };
    final response = await ElevatorApi.getConfig(params);
    setState(() {
      _allConfig = response.data["data"];

      // 1、电梯配置
      if (_allConfig["d"]["getConfig"].containsKey("elmPara")){
        setElmPara(_allConfig);
      }else {
        navigationItems[0]['expanded'] = false;
      }

      //2、MQTT配置
      if (_allConfig["d"]["getConfig"].containsKey("mqttServer")) {
        setMqttServer(_allConfig);
      }else {
        navigationItems[1]['expanded'] = false;
      }

      //3、对讲配置
      if (_allConfig["d"]["getConfig"].containsKey("talk")) {
        setTalk(_allConfig);
      }else {
        navigationItems[2]['expanded'] = false;
      }

      //4、网络配置
      if (_allConfig["d"]["getConfig"].containsKey("network")) {
        setNetwork(_allConfig);
      }else {
        navigationItems[3]['expanded'] = false;
      }

      //5、4G配置
      if (_allConfig["d"]["getConfig"].containsKey("4G")) {
        set4G(_allConfig);
      }else {
        navigationItems[4]['expanded'] = false;
      }

      //6、IPC配置
      if (_allConfig["d"]["getConfig"].containsKey("IPC")) {
        setIPC(_allConfig);
      }else {
        navigationItems[5]['expanded'] = false;
      }

      //7、GB28181配置
      if (_allConfig["d"]["getConfig"].containsKey("gb28181")) {
        setGb28181(_allConfig);
      }else {
        navigationItems[6]['expanded'] = false;
      }

      //8、AI配置
      if (_allConfig["d"]["getConfig"].containsKey("AI")) {
        setAI(_allConfig);
      }else {
        navigationItems[7]['expanded'] = false;
      }

      //9、系统配置
      if (_allConfig["d"]["getConfig"].containsKey("sysCtrl")) {
        setSysCtrl(_allConfig);
      }else {
        navigationItems[8]['expanded'] = false;
      }

      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _connect();
  }

  @override
  void dispose() {
    // 电梯配置
    floorNumberController.dispose();
    startFloorController.dispose();
    deviceNameController.dispose();
    phoneNumberController.dispose();

    servIpController.dispose();
    portController.dispose();
    usernameController.dispose();
    passwdController.dispose();
    qosController.dispose();
    subTopicController.dispose();

    appidController.dispose();
    frameRateController.dispose();

    dns1Controller.dispose();
    gatewayipController.dispose();
    ipController.dispose();
    nameController.dispose();
    netmaskController.dispose();
    mqttUrlController.dispose();

    imeController.dispose();
    signalController.dispose();


    factoryController.dispose();
    usernameipcController.dispose();
    passwdipcController.dispose();
    ipAddrController.dispose();
    portipcController.dispose();
    magicController.dispose();
    subStreamController.dispose();

    expiredController.dispose();
    heartbeatCycleController.dispose();
    LocalPortController.dispose();
    PasswdController.dispose();
    passwdConfirmController.dispose();
    PlatformController.dispose();
    sipIdController.dispose();
    sipIpController.dispose();
    sipPortController.dispose();
    sipRegionController.dispose();
    sipUserController.dispose();
    sipUsernameController.dispose();

    personKeepController.dispose();
    volumeController.dispose();

    rebootTimeController.dispose();
    floorUseioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('电梯配置'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                navigationItems[index]['expanded']= !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(navigationItems[0]['title']),
                  );
                },
                body: _buildRunConfigPage(),
                isExpanded: navigationItems[0]['expanded'],
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text("电梯采集参数配置"),
                  );
                },
                body: _buildRunConfigPage(),
                // isExpanded: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 构建电梯配置页面
  Widget _buildRunConfigPage() {
    return Stack(
      children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('服务模式'),
                      DropdownButton<int>(
                        value: _elmPara["serviceMode"],
                        items: [
                          DropdownMenuItem(child: Text('1'), value: 1),
                          DropdownMenuItem(child: Text('2'), value: 2),
                          DropdownMenuItem(child: Text('3'), value: 3),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _elmPara["serviceMode"] = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text('电梯楼层'),
                      ),
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: floorNumberController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "${_elmPara["floorNumber"]}",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text('电梯基站'),
                      ),
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: startFloorController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "${_elmPara["startFloor"]}",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('安装方式'),
                      DropdownButton<int>(
                        value: _elmPara["placement"],
                        items: [
                          DropdownMenuItem(child: Text('竖放'), value: 0),
                          DropdownMenuItem(child: Text('平放'), value: 1),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _elmPara["placement"] = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text('设备名称'),
                      ),
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: deviceNameController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "${_elmPara["deviceName"]}",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Text('联系号码'),
                      ),
                      SizedBox(
                        width: 160,
                        child: TextField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "${_elmPara["phoneNumber"]}",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ]
            )
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[0]['expanded'] ? () {
                  setState(() {
                    setElmPara(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[0]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建MQTT配置页面
  Widget _buildMQTTConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('服务器IP'),
                  ),
                  SizedBox(
                    width: 160, // 设置宽度为200像素，可以根据具体需求进行调整
                    child: TextField(
                      controller: servIpController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["servIp"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('端口'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: portController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["port"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('用户名'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["username"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('密码'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: passwdController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["passwd"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('qos'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: qosController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["qos"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('订阅主题'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: subTopicController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_mqttServer["subTopic"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[1]['expanded'] ? () {
                  setState(() {
                    setMqttServer(_allConfig);
                  });
                }:null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[1]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建对讲配置页面
  Widget _buildTalkConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('是否开启对讲'),
                value: _talk["enable"] == 1 ? true:false,
                onChanged: (value) {
                  _talk["enable"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('appid'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: appidController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_talk["appid"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('帧率'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: frameRateController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_talk["frameRate"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('是否开启视频'),
                value: _talk["videoEnable"] == 1 ? true:false,
                onChanged: (value) {
                  _talk["videoEnable"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[2]['expanded'] ? () {
                  setState(() {
                    setTalk(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[2]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建网络配置页面
  Widget _buildNetworkConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('DHCP'),
                value: _network["dhcp"] == 1 ? true:false,
                onChanged: (value) {
                  _network["dhcp"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('DNS1'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: dns1Controller,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["dns1"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('默认网关'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: gatewayipController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["gatewayip"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('IP'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: ipController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["ip"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('网卡'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["name"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('子网掩码'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: netmaskController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["netmask"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('MQTT服务'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: mqttUrlController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_network["mqttUrl"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[3]['expanded'] ? () {
                  setState(() {
                    setNetwork(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[3]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建4G配置页面
  Widget _build4GConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('是否启用'),
                value: _4G["enable"] == 1 ? true:false,
                onChanged: (value) {
                  _4G["enable"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('ime'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      enabled: false,
                      controller: imeController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_4G["ime"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('信号值'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      enabled: false,
                      controller: imeController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_4G["signal"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('启用ECM'),
                value: _4G["ecm"] == 1 ? true:false,
                onChanged: (value) {
                  _4G["ecm"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[4]['expanded'] ? () {
                  setState(() {
                    set4G(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[4]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建IPC配置页面
  Widget _buildIPCConfigPage() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SwitchListTile(
                        title: Text('自动搜索'),
                        value: _IPC["research"] == 1 ? true:false,
                        onChanged: (value) {
                          _IPC["research"] = value ? 1:0;
                        },
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('factory'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: factoryController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["factory"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('用户名'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: usernameipcController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_4G["username"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('密码'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: passwdipcController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["passwd"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('IP地址'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: ipAddrController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["ipAddr"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('端口'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: portipcController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["port"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('RTSP'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: magicController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["magic"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text('副码流'),
                          ),
                          SizedBox(
                            width: 160,
                            child: TextField(
                              controller: subStreamController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: "${_IPC["subStream"]}",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ]
          )
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[5]['expanded'] ? () {
                  setState(() {
                    setIPC(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[5]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ]
    );

  }

  //构建GB28181页面
  Widget _buildGB28181ConfigPage() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SwitchListTile(
                      title: Text('是否启用'),
                      value: _gb28181["enbale"] == 1 ? true:false,
                      onChanged: (value) {
                        _gb28181["enable"] = value ? 1:0;
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('超时'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: expiredController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["expired"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('心跳周期'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: heartbeatCycleController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["heartbeatCycle"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('本地端口'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: LocalPortController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["LocalPort"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('密码'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: PasswdController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["Passwd"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('确认密码'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: passwdConfirmController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["passwdConfirm"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('协议'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: PlatformController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["Platform"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipId'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipIdController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipId"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipIp'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipIpController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipIp"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipPort'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipPortController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipPort"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipRegion'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipRegionController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipRegion"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipUser'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipUserController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipUser"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text('sipUsername'),
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: sipUsernameController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: "${_gb28181["sipUsername"]}",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 64),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[6]['expanded'] ? () {
                  setState(() {
                    setGb28181(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[6]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ]
    );
  }

  //构建AI配置页面
  Widget _buildAIConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('是否启用'),
                value: _AI["enable"] == 1 ? true:false,
                onChanged: (value) {
                  _AI["enable"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('人员识别'),
                value: _AI["personAppease"] == 1 ? true:false,
                onChanged: (value) {
                  _AI["personAppease"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('人员保持'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: personKeepController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_AI["personKeep"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('电动车'),
                value: _AI["ecycleAlarm"] == 1 ? true:false,
                onChanged: (value) {
                  _AI["ecycleAlarm"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('开关门'),
                value: _AI["doorCheck"] == 1 ? true:false,
                onChanged: (value) {
                  _AI["doorCheck"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('安抚音量'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: volumeController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_AI["volume"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[7]['expanded'] ? () {
                  setState(() {
                    set4G(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[7]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建系统配置页面
  Widget _buildSysCtrlConfigPage() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                title: Text('是否重启'),
                value: _sysCtrl["rebootEnable"] == 1 ? true:false,
                onChanged: (value) {
                  _sysCtrl["rebootEnable"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('重启延时'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: rebootTimeController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_sysCtrl["rebootTime"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text('楼层IO'),
                  ),
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: floorUseioController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: "${_sysCtrl["floorUseio"]}",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('计算楼层'),
                value: _AI["directCountFloor"] == 1 ? true:false,
                onChanged: (value) {
                  _AI["directCountFloor"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
              SwitchListTile(
                title: Text('基准层'),
                value: _sysCtrl["pressCalibrateFloor"] == 1 ? true:false,
                onChanged: (value) {
                  _sysCtrl["pressCalibrateFloor"] = value ? 1:0;
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: navigationItems[8]['expanded'] ? () {
                  setState(() {
                    set4G(_allConfig);
                  });
                } : null,
                child: Text('重置'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              ElevatedButton(
                onPressed: navigationItems[8]['expanded'] ? () {
                  // TODO: Handle reset button press
                } : null,
                child: Text('保存'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
