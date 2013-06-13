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

    #
    # Update poistion with velocity
    #
    update_position: ->
        @x += @vx
        @y += @vy

    #
    # Return x and y with array style
    #
    get_data: ->
        return [@x, @y]

    #
    # Calculate distance between points
    # @param p : Point2D class's instance
    #
    calc_distance: (p)->
        return Math.pow(@x - p.x, 2)+ Math.pow(@y - p.y, 2)

    #
    # Draw point and label to canvas
    #
    draw: ->
        @context.beginPath()
        @context.strokeStyle = '#00F'
        @context.fillStyle = 'green'
        @context.arc(@x, @y, @r, 0, Math.PI * 2, false)
        @context.fill()
        @context.stroke()
        @context.restore()

        @context.beginPath()
        @context.font = "18px 'MS Pゴシック'"
        @context.fillStyle = "red"
        @context.fillText(@label, @x, @y-(@r*2))
        @context.restore()

    #
    # Draw point and label with scaling
    #
    draw_with_scaling: (max,min) ->
        prevX = @x
        prevY = @y

        @x = (@x - min[0]) / (max[0] - min[0]) * @wnd_width
        @y = (@y - min[1]) / (max[1] - min[1]) * @wnd_height

        @draw()

        @x = prevX
        @y = prevY

exports.Point2D = Point2D
