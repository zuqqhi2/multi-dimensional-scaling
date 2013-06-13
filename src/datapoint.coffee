class DataPoint
    constructor: (data, label, column_name) ->
        @data = data
        @label = label
        @column_name = column_name

    #
    # Calculate distance between two points
    # @param  dp : DataPoint's instance
    #
    calc_distance: (dp) ->
        sum = 0.0
        for i in [0..@data.length-1]
            sum += Math.pow(@data[i] - dp.data[i],2)

        return Math.sqrt(sum)

    get_data: ->
        return @data

    draw: ->
        return

    draw_with_scaling: ->
        return

exports.DataPoint = DataPoint
