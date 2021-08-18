xsetwacom --set "Wacom Intuos5 touch M Finger touch" Touch off          # disable touch  (关闭手指触控)

## 屏幕映射
xinput map-to-output 20 DP-0
xinput map-to-output 21 DP-0

## Turn Wacom Ring off.
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'AbsWheelUp' 'button 0'
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'AbsWheelDown' 'button 0'
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'AbsWheel2Up' 'button 0'
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'AbsWheel2Down' 'button 0'
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'RelWheelUp' 'button 0'
xsetwacom --set 'Wacom Intuos5 touch M Pad pad' 'RelWheelDown' 'button 0'

