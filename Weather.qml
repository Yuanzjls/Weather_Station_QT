import QtQuick 2.12
import QtQuick.Controls 2.1
import QtMultimedia 5.0
Rectangle {
    id: rectangle
    Component.onCompleted: query()

    Audio {
          id: playMusic
          source: "qrc:/渔舟唱晚.mp3"
          autoPlay: true
          loops: Audio.Infinite
      }
    Timer{
        interval: 1800000
        running:  true
        repeat: true
        onTriggered: query()
    }
    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: gettimetext()

    }
    Column{
        id: column
        anchors.fill: parent
        spacing: 2


    Label{
        id: location
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        fontSizeMode: Text.Fit
        minimumPixelSize: 9
        font.pointSize: 10

    }
    Label{
        id: temp
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        fontSizeMode: Text.Fit
        minimumPixelSize: 9
        font.pointSize: 10

    }
    Label{
        id: wind
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        //height: parent.height/4
        fontSizeMode: Text.Fit
        minimumPointSize: 9
        font.pointSize: 10

        }
    Label{
        id: weather_des
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        //height: parent.height
        fontSizeMode: Text.Fit
        minimumPointSize: 9
        font.pointSize: 10
        }
    Image {
        id: iconImg
        width: parent.width / 2
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit

    }

    Label{
        id: currenttime
        width: parent.width
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        //height: parent.height
        fontSizeMode: Text.Fit
        minimumPointSize: 9
        font.pointSize: 10
        }


    }
    Image{
        id: attrImg
        width: 100
        anchors.horizontalCenter: parent.horizontalCenter
        anchors {bottom: parent.bottom }
        fillMode: Image.PreserveAspectFit
        source: 'https://openweathermap.org/themes/openweathermap/assets/img/logo_white_cropped.png'
    }
    function query()
    {
        var url = "https://api.openweathermap.org/data/2.5/weather?id=6182962&appid=cd991a04f731dad3e2441ccb03c582ad&mode=json&units=metric";
        var res
        var doc = new XMLHttpRequest()
        doc.onreadystatechange = function()
        {
            if (doc.readyState === XMLHttpRequest.DONE)
            {
                res = doc.responseText
                parseJSON(res)
                //console.log(res);
            }

        }
        doc.open('GET', url, true)
        doc.send()
        console.log("update")
    }
    function parseJSON(data)
    {
        var obj = JSON.parse(data)
        //
        if (typeof(obj) == 'object')
        {
            location.text = obj.name + ", ON, Canada"
            wind.text = "Wind: " + obj.wind.speed + " m/s"
            temp.text = "temperature: " + obj.main.temp + "°C"
            weather_des.text = "Weather: " + obj.weather[0].description
            iconImg.source = "http://openweathermap.org/img/wn/" + obj.weather[0].icon +"@2x.png"
        }
    }
    function gettimetext()
    {

        var currentTime = new Date()
        var currenthour = currentTime.getHours()
        var currentMinute = currentTime.getMinutes()
        var currentSecond = currentTime.getSeconds()
        if (currentSecond % 2 == 0)
        {
            currenttime.text = padDigits(currenthour, 2) + ":" + padDigits(currentMinute, 2) + ":"+ padDigits(currentSecond, 2);
        }
        else
        {
            currenttime.text = padDigits(currenthour, 2) + " " + padDigits(currentMinute, 2) + " "+ padDigits(currentSecond, 2);
        }
    }
    function padDigits(number, digits) {
        return Array(Math.max(digits - String(number).length + 1, 0)).join(0) + number;
    }
}

