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
import Sailfish.Silica 1.0

Page {
    id: page

    property CompassSettings settings

    SilicaFlickable {
        id: flickable
        anchors.fill: parent
        contentHeight: pageColumn.height

        VerticalScrollDecorator { flickable: flickable }

        Column {
            id: pageColumn

            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - (2 * Theme.paddingLarge)
            spacing: Theme.paddingLarge
            property int column3width: (pageColumn.width - (2 * Theme.paddingSmall)) / 3

            PageHeader {
                title: "Settings"
            }

            SectionHeader {
                text: "Compass scale"
            }

            SwitchRow {
                id: scaleRow
                contentWidth: pageColumn.width
                name: "scale"
                valueList: [ "360", "400", "6000" ]
                labelList: [ "degree", "gradian", "mil" ]
                //currentIndex: settings.compassScaleIndex
                onCurrentValueChanged: {
                    settings.compassScaleStr = currentValue
                    //console.log("Scale: " + currentValue);
                }
            }

            SectionHeader {
                text: "Night mode"
            }

            SwitchRow {
                id: nightmodeRow
                contentWidth: pageColumn.width
                name: "nightmode"
                valueList: [ "auto", "day", "night" ]
                labelList: [ "auto", "day", "night" ]
                //currentIndex: settings.nightmodeIndex
                onCurrentValueChanged: {
                    settings.nightmodeSetting = currentValue
                }
            }

        } // Column
    }

    onStatusChanged: {
        if (page.status === PageStatus.Activating) {
            nightmodeRow.currentIndex = settings.nightmodeIndex;
            scaleRow.currentIndex = settings.compassScaleIndex;
        }
    }
}
