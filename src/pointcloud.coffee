class PointCloud
    constructor: (points)->
        @points = points
        
        @distances = []
        for i in [0..points.length-1]
            @distances.push([])
            for j in [0..points.length-1]
                @distances[i].push(0.0)

    #
    # Calc distances between points and make distance matrix
    #
    calc_distance: ->
        for i in [0..@points.length-1]
            for j in [0..@points.length-1]
                @distances[i][j] = @points[i].calc_distance(@points[j])

    #
    # Draw points
    #
    draw_points: ->
        for i in [0..@points.length-1]
            @points[i].draw()

    #
    # Draw points with scaling
    #
    draw_points_with_scaling: ->
        max = @points[0].get_data()
        min = @points[0].get_data()

        for i in [0..@points.length-1]
            for j in [0..max.length-1]
                if max[j] > @points[i].get_data()[j]
                    max[j] = @points[i].get_data()[j]
                if min[j] < @points[i].get_data()[j]
                    min[j] = @points[i].get_data()[j]

        for i in [0..@points.length-1]
            @points[i].draw_with_scaling(max, min)

exports.PointCloud = PointCloud
