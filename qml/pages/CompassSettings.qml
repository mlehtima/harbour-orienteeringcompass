/*
  Copyright (c) 2011-2014, Jussi Vuorisalmi <jussi.vuorisalmi@iki.fi>
  All rights reserved.

  This file is part of the harbour-orienteeringcompass package.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
      * Neither the name of the <organization> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDER BE LIABLE FOR ANY
  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import CompassExtras 1.0

// Non-viaual item
Item {
    id: settings

    // TODO: default values now hardcoded.

    property variant scaleStrList: [ "360", "400", "6000" ]
    property variant scaleLabelList: [ "degree", "gradian", "mil" ]

    property string compassScaleStr: qSettingScale.value //: "360"  // Scale as string, set this
    property real compassScaleVal: 1 * compassScaleStr  // read-only
    property int compassScaleIndex: scaleStrList.indexOf(compassScaleStr)

    property variant nightmodeStrList: [ "auto", "day", "night" ]
    property variant nightmodeLabelList: [ "auto", "day", "night" ]

    property string nightmodeSetting: qSettingNightmode.value //: "auto"
    property bool sensorNigth: false  // Is it now night according to the light sensor
    property bool nightmodeActive: (nightmodeSetting === "night") || ((nightmodeSetting === "auto") && sensorNigth)
    property string currentNightmodeStr: nightmodeActive ? "night" : "day"
    property int nightmodeIndex: nightmodeStrList.indexOf(nightmodeSetting)

    //onCompassScaleStrChanged: { console.log("Compass scale: " + compassScaleStr); }
    //onCompassScaleIndexChanged: { console.log("Compass scale index: " + compassScaleIndex); }

    QSettingsItem {
        id: qSettingScale
        key: "compassScale"
        defaultValue: "360"
    }
    QSettingsItem {
        id: qSettingNightmode
        key: "nightmode"
        defaultValue: "auto"
    }

    property string testStr

    Component.onCompleted: {
        compassScaleStr = qSettingScale.value
        nightmodeSetting = qSettingNightmode.value
        console.log("CompassSettings: Component.onCompleted: scale value: " + compassScaleStr);
        console.log("CompassSettings: Component.onCompleted: nightmode value: " + nightmodeSetting);

    }
    Component.onDestruction: {
        console.log("Settings: writing settings...");
        qSettingScale.value = compassScaleStr;
        qSettingNightmode.value = nightmodeSetting;
    }
}
