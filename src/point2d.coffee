class Point2D
    constructor: (x, y, r, vx, vy, label, canvas, context) ->
        @x = x
        @y = y
        @r = r
        @vx = vx
        @vy = vy
        @label = label
        @canvas = canvas
        @context = context

    update_position: ->
        @x += @vx
        @y += @vy

    reflect: ->
        if @x - @r < 0
            @x = @r
            @vx *= -1.0

        if @x + @r > @canvas.width
            @x = @canvas.width - @r
            @vx *= -1

        if @y - @r < 0
            @y = @r
            @vy *= -1

        if @y + @r > @canvas.height
            @y = @canvas.height - @r
            @vy *= -1
        
    draw: ->
        @context.beginPath()
        @context.strokeStyle = '#00F'
        @context.fillStyle = '#00F'
        @context.arc(@x, @y, @r, 0, Math.PI * 2, false)
        @context.fill()
        @context.stroke()
        @context.restore()

        @context.beginPath()
        @context.font = "18px 'MS Pゴシック'"
        @context.fillStyle = "blue"
        @context.fillText(@label, @x, @y-@r)
        @context.restore()

exports.Point2D = Point2D
