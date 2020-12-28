# Weather_Station_QT
This is a QT weather station project, you can see location, temperature, wind, and weather on the screen, also you will hear the background music. I used Yocto to create a Qt-Linux image. As you know QT is cross-platform framework, so I can make it run both on computer and the board. For this project, I used QML to do the layout and interface, and using json to parse the information.

## Picture of project

<center>
    <img style="border-radius: 0.3125em;
    box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" 
    src="screenshot.jpg">
    <br>
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;
    display: inline-block;
    color: #999;
    padding: 2px;">running on computer</div>
</center>
<center>
    <img style="border-radius: 0.3125em;
    box-shadow: 0 2px 4px 0 rgba(34,36,38,.12),0 2px 10px 0 rgba(34,36,38,.08);" 
    src="board_picture.jpg">
    <br>
    <div style="color:orange; border-bottom: 1px solid #d9d9d9;
    display: inline-block;
    color: #999;
    padding: 2px;">running on STM32MP157C-DK2 </div>
</center>