// Gizmo parameters
gizmoPosition = [0, 0, 0]
axisLength = 1
axisWidth = pi/100
tickWidth = 0.1
tickHeight = 0.1
numberOfTicks = 10
cylinderNamePrefix = "Cylinder"
tickNamePrefix = "wCylinder"

// Axis setup
createAxis = function(axisNumber, position, rotation)
    moveObject(cylinderNamePrefix + "(" + axisNumber + ")", position[0], position[1], position[2])
    scaleObject(cylinderNamePrefix + "(" + axisNumber + ")", axisWidth, axisLength * 2, axisWidth)
    rotateObject(cylinderNamePrefix + "(" + axisNumber + ")", rotation[0], rotation[1], rotation[2])
end function

createAxis(1, gizmoPosition, [0, 0, 0])   // X-axis
createAxis(2, gizmoPosition, [90, 0, 0])   // Y-axis
createAxis(3, gizmoPosition, [90, 0, 90])  // Z-axis


// Gizmo parameters
gizmoPosition = [15, 2, 4]
axisLength = 1
axisWidth = pi/100
tickWidth = 0.1
tickHeight = 0.1
numberOfTicks = 10
cylinderNamePrefix = "Cylinder"
tickNamePrefix = "wCylinder"

// Axis setup
createAxis = function(axisNumber, position, rotation)
    moveObject(cylinderNamePrefix + "(" + axisNumber + ")", position[0], position[1], position[2])
    scaleObject(cylinderNamePrefix + "(" + axisNumber + ")", axisWidth, axisLength * 2, axisWidth)
    rotateObject(cylinderNamePrefix + "(" + axisNumber + ")", rotation[0], rotation[1], rotation[2])
end function

createAxis(1, gizmoPosition, [0, 0, 0])   // X-axis
createAxis(2, gizmoPosition, [90, 0, 0])   // Y-axis
createAxis(3, gizmoPosition, [90, 0, 90])  // Z-axis

// Ticks setup
createTicks = function(axisNumber, axisDirection, otherDirections)
    for i in range(1, numberOfTicks + 1)
        tickPosition = [
            gizmoPosition[0] + axisDirection[0] * (axisLength * i / numberOfTicks),
            gizmoPosition[1] + axisDirection[1] * (axisLength * i / numberOfTicks),
            gizmoPosition[2] + axisDirection[2] * (axisLength * i / numberOfTicks)
        ]
        moveObject(
            tickNamePrefix + "(" + axisNumber + i + ")",
            tickPosition[0] + otherDirections[0] * tickHeight / 2,
            tickPosition[1] + otherDirections[1] * tickHeight / 2,
            tickPosition[2] + otherDirections[2] * tickHeight / 2
        )
        scaleObject(tickNamePrefix + "(" + axisNumber + "_" + i + ")", tickWidth, tickHeight, tickWidth)

        moveObject(
            tickNamePrefix + "(" + axisNumber + (i) + ")",
            tickPosition[0] - otherDirections[0] * tickHeight / 2,
            tickPosition[1] - otherDirections[1] * tickHeight / 2,
            tickPosition[2] - otherDirections[2] * tickHeight / 2
        )
        scaleObject(tickNamePrefix + "(" + axisNumber + (i) + ")", tickWidth, tickHeight, tickWidth)
    end for
end function

createTicks(1, [1, 0, 0], [0, 1, 0]) // X-axis ticks
createTicks(2, [0, 1, 0], [1, 0, 0]) // Y-axis ticks
createTicks(3, [0, 0, 1], [0, 1, 0]) // Z-axis ticks