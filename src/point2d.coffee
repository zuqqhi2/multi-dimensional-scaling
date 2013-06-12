class Point2D
    constructor: (x, y, r, vx, vy, label, wnd_width, wnd_height, context) ->
        @x = x
        @y = y
        @r = r
        @vx = vx
        @vy = vy
        @label = label
        @wnd_width = wnd_width
        @wnd_height = wnd_height
        @context = context

    update_position: ->
        @x += @vx
        @y += @vy

    reflect: ->
        if @x - @r < 0
            @x = @r
            @vx *= -1.0

        if @x + @r > @wnd_width
            @x = @wnd_width - @r
            @vx *= -1.0

        if @y - @r < 0
            @y = @r
            @vy *= -1.0

        if @y + @r > @wnd_height
            @y = @wnd_height - @r
            @vy *= -1.0
        
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
