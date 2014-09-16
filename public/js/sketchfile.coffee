BAR_COUNT = 200
BAR_ANGLE = Math.PI * 2 / BAR_COUNT

INNER_RADIUS = 80
OUTER_RADIUS = 90

INNER_OFFSET = -10
OUTER_OFFSET = 60

sketch = Sketch.create container:document.getElementById 'container'
center = x:0, y:0

sketch.setup = () ->
  sketch.resize()

sketch.resize = () ->
  center.x = sketch.width / 2
  center.y = sketch.height / 2

sketch.draw = () ->
  sketch.clear()

  BAR_STEP = sketch.millis * 0.005
  ROTATION = sketch.millis * 0.0002

  for index in [0...BAR_COUNT]

    ratio = 1 - index / BAR_COUNT * 2
    length = (1 + Math.cos ratio * BAR_STEP) / 2

    alphaRatio = ease length, 1, 1, -0.8
    innerRatio = ease length, 1, 1, -1
    outerRatio = ease length, 1, 1, -1

    innerRadius = INNER_RADIUS + innerRatio * INNER_OFFSET
    outerRadius = OUTER_RADIUS + outerRatio * OUTER_OFFSET

    x = Math.cos index * BAR_ANGLE - HALF_PI + ROTATION
    y = Math.sin index * BAR_ANGLE - HALF_PI + ROTATION

    sketch.beginPath()
    sketch.moveTo center.x + x * innerRadius, center.y + y * innerRadius
    sketch.lineTo center.x + x * outerRadius, center.y + y * outerRadius
    sketch.strokeStyle = "rgba(255, 235, 175, #{alphaRatio})"
    sketch.lineWidth = 0.5
    sketch.stroke()

ease = (t, d, b, c) -> -c * (t /= d) * (t - 2) + b