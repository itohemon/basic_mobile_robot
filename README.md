# basic_mobile_robot
Tutorial from Automatic Addition using docker(ROS 2(foxy))

ところどころ躓いたのでまとめておく。

## 参考URL
[GNSS、IMUのをROS2で利用。自己位置推定（備忘録）](https://qiita.com/m2_labo/items/201836440cd846e754fa)

[How to Create a Simulated Mobile Robot in ROS 2 Using URDF](https://automaticaddison.com/how-to-create-a-simulated-mobile-robot-in-ros-2-using-urdf/)

[Set Up the Odometry for a Simulated Mobile Robot in ROS 2](https://automaticaddison.com/set-up-the-odometry-for-a-simulated-mobile-robot-in-ros-2/)

[Sensor Fusion Using the Robot Localization Package – ROS 2](https://automaticaddison.com/sensor-fusion-using-the-robot-localization-package-ros-2/)

[Set Up LIDAR for a Simulated Mobile Robot in ROS 2](https://automaticaddison.com/set-up-lidar-for-a-simulated-mobile-robot-in-ros-2/)

[Navigation and SLAM Using the ROS 2 Navigation Stack](https://automaticaddison.com/navigation-and-slam-using-the-ros-2-navigation-stack/)

[How to Use GPS With the Robot Localization Package – ROS 2](https://automaticaddison.com/how-to-use-gps-with-the-robot-localization-package-ros-2/)


### colcon_cd
よくわからないので使っていない

### URDFにおけるwheelのjoint typeがrevolute
continuousのほうが連続回転なのでは？

### gazebo smalltown.worldを実行しても何も表示されない
gazeboで引数なしだとウィンドウが出るのに、引数をつけるとウィンドウが出なくなった。
 - gazeboのモデルを読み込むのに非常に時間がかかる模様。Dockerfileで予めモデルを取得するようにした。
 - 環境変数を追加した。

### 緯度・経度・高度
smalltown.worldに記載がある。
```xml
    <!-- Define the latitude, longitude, and elevation -->
    <spherical_coordinates>
      <surface_model>EARTH_WGS84</surface_model>
      <latitude_deg>47.840640</latitude_deg>
      <longitude_deg>10.619944</longitude_deg>
      <elevation>740.0</elevation>
      <!-- currently gazebo has a bug: instead of outputing lat, long, altitude in ENU
      (x = East, y = North and z = Up) as the default configurations, it's outputting (-E)(-N)U,
      therefore we rotate the default frame 180 so that it would go back to ENU -->
      <heading_deg>180</heading_deg>
    </spherical_coordinates>
```

### NavigationとSLAM
ros-foxy-nav2-bringupパッケージが入ってない

