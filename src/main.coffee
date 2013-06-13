Point2D = require('../src/point2d').Point2D
DataPoint = require('../src/datapoint').DataPoint
PointCloud = require('../src/pointcloud').PointCloud

main = ()->
    # Draw area
    canvas = document.getElementById('canvas')
    # Canvas interface
    context = canvas.getContext('2d')

    # Make blog name array
    keys = []
    for key of blog_data
        keys.push(key)
    num_points = keys.length
    
    # Make data point's cloud
    data_points = []
    for i in [0..num_points-1]
        data_points.push(new DataPoint(blog_data[keys[i]], keys[i], column_name))
    realpc = new PointCloud(data_points)

    # Make 2d(for canvas) point's cloud
    points = []
    for i in [0..num_points-1]
        x = canvas.width /2 + Math.floor(Math.random() * 200) - 100
        y = canvas.height /2 + Math.floor(Math.random() * 200) - 100
        vx = 0.0
        vy = 0.0

        points.push new Point2D(x, y, 2, vx, vy, keys[i], canvas.width, canvas.height, context)
    fakepc = new PointCloud(points)
    fakepc.draw_points_with_scaling()

    # Calculate realdist
    realpc.calc_distance()
    
    # Calculate initial fakedist
    fakepc.calc_distance()

    # Error tmp
    lasterror = 0.0
    # Learning Rate
    rate = 0.0001
    # Done flg of calculation
    endflg = false

    mainloop = ()->
        context.save()
        context.beginPath()
        context.clearRect(0, 0, canvas.width, canvas.height)
        context.restore()
       
        if endflg
            fakepc.draw_points_with_scaling()
        else
            totalerror = 0

            # Calculate initial fakedist
            fakepc.calc_distance()

            # Calculate velocity of canvas point
            for i in [0..num_points-1]
                for j in [0..num_points-1]
                    if i==j
                        continue

                    errorterm = (fakepc.distances[j][i] - realpc.distances[j][i])/realpc.distances[j][i]

                    points[i].vx += ((points[i].x - points[j].x)/fakepc.distances[j][i])*errorterm
                    points[i].vy += ((points[i].y - points[j].y)/fakepc.distances[j][i])*errorterm

                    totalerror += Math.abs(errorterm)

            # Check local minimum
            console.log(totalerror)
            if lasterror > 1.0 and lasterror < totalerror
                endflg = true
            else
                # Save totalerror
                lasterror = totalerror
           
                # Update canvas point's position
                for i in [0..num_points-1]
                    points[i].x -= rate * points[i].vx
                    points[i].y -= rate * points[i].vy

                # Draw points
                fakepc.draw_points_with_scaling()

        # Do again after 30 millisecond
        setTimeout(mainloop, 30)

    mainloop()

window.onload = main
