Point2D = require('../src/point2d').Point2D

main = ()->
    canvas = document.getElementById('canvas')
    context = canvas.getContext('2d')

    num_points = 9
    labels = ["abc", "bcd", "cde", "def", "efg", "fgh", "ghi", "hij", "ijk", "jkl"]
    points = []
    for i in [0..num_points]
        x = canvas.width /2 + Math.floor(Math.random() * 200) - 100
        y = canvas.height /2 + Math.floor(Math.random() * 200) - 100
        vx = Math.random() * 5.0 - 2.5
        vy = Math.random() * 5.0 - 2.5

        points.push new Point2D(x, y, 10, vx, vy, labels[i], canvas, context)
        points[i].draw()

    mainloop = ()->
        context.save()
        context.beginPath()
        context.clearRect(0, 0, canvas.width, canvas.height)
        context.restore()
        
        for i in [0..num_points]
            points[i].update_position()
            points[i].reflect()
            points[i].draw()

        setTimeout(mainloop, 30)

    mainloop()

window.onload = main