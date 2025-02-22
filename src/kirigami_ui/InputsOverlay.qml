/****************************************************************************
 **
 ** QPrompt
 ** Copyright (C) 2021-2022 Javier O. Cordero Pérez
 **
 ** This file is part of QPrompt.
 **
 ** This program is free software: you can redistribute it and/or modify
 ** it under the terms of the GNU General Public License as published by
 ** the Free Software Foundation, version 3 of the License.
 **
 ** This program is distributed in the hope that it will be useful,
 ** but WITHOUT ANY WARRANTY; without even the implied warranty of
 ** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 ** GNU General Public License for more details.
 **
 ** You should have received a copy of the GNU General Public License
 ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
 **
 ****************************************************************************/

import QtQuick 2.12
import org.kde.kirigami 2.11 as Kirigami
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

import com.cuperino.qprompt.qmlutil 1.0

Kirigami.OverlaySheet {
    id: key_configuration_overlay

    background: Rectangle {
        color: appTheme.__backgroundColor
        anchors.fill: parent
    }
    header: Kirigami.Heading {
        text: i18n("Key Bindings")
        level: 1
    }

    onSheetOpenChanged: prompterPage.actions.main.checked = sheetOpen

    GridLayout {
        id: buttonGrid

        width: parent.width
        columns: 2

        // Toggle all buttons off
        function toggleButtonsOff() {
            for (let i=1; i<children.length; i+=2)
                children[i].item.checked = false;
        }

        Component.onCompleted: {
            keyInputTogglePrompter.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.toggle, prompter.keys.toggleModifiers) });
            keyInputDecreaseVelocity.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.increaseVelocity, prompter.keys.increaseVelocityModifiers) });
            keyInputIncreaseVelocity.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.decreaseVelocity, prompter.keys.decreaseVelocityModifiers) });
            keyInputPlayPause.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.pause, prompter.keys.pauseModifiers) });
            keyInputMoveBackwards.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.skipBackwards, prompter.keys.skipBackwardsModifiers) });
            keyInputMoveForward.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.skipForward, prompter.keys.skipForwardModifiers) });
            keyInputPreviousMarker.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.previousMarker, prompter.keys.previousMarkerModifiers) });
            keyInputNextMarker.setSource("KeyInputButton.qml", { "text": qmlutil.keyToString(prompter.keys.nextMarker, prompter.keys.nextMarkerModifiers) });
        }
        Connections {
            target: keyInputTogglePrompter.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.toggle = key;
                prompter.keys.toggleModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputDecreaseVelocity.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.decreaseVelocity = key;
                prompter.keys.decreaseVelocityModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputIncreaseVelocity.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.increaseVelocity = key;
                prompter.keys.increaseVelocityModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputPlayPause.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.pause = key;
                prompter.keys.pauseModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputMoveBackwards.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.skipBackwards = key;
                prompter.keys.skipBackwardsModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputMoveForward.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.skipForward = key;
                prompter.keys.skipForwardModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputPreviousMarker.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.previousMarker = key;
                prompter.keys.previousMarkerModifiers = modifiers;
            }
        }
        Connections {
            target: keyInputNextMarker.item
            function onToggleButtonsOff() { buttonGrid.toggleButtonsOff(); }
            function onSetKey(key, modifiers) {
                prompter.keys.nextMarker = key;
                prompter.keys.nextMarkerModifiers = modifiers;
            }
        }

        Label {
            text: i18n("Toggle Prompter State")
        }
        Loader {
            id: keyInputTogglePrompter
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Decrease Velocity")
        }
        Loader {
            id: keyInputDecreaseVelocity
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Increase Velocity")
        }
        Loader {
            id: keyInputIncreaseVelocity
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Play/Pause")
        }
        Loader {
            id: keyInputPlayPause
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Move Backwards")
        }
        Loader {
            id: keyInputMoveBackwards
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Move Forward")
        }
        Loader {
            id: keyInputMoveForward
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Go to Previous Marker")
        }
        Loader {
            id: keyInputPreviousMarker
            asynchronous: true
            Layout.fillWidth: true
        }
        Label {
            text: i18n("Go to Next Marker")
        }
        Loader {
            id: keyInputNextMarker
            asynchronous: true
            Layout.fillWidth: true
        }

        QmlUtil {
            id: qmlutil
        }
    }
}
