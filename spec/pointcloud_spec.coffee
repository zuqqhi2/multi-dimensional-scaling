PointCloud = require('../src/pointcloud').PointCloud
Point2D = require('../src/point2d').Point2D

describe "PointCloud", ->
    pc = undefined
    points = []

    beforeEach ->
        p1 = new Point2D(1, 2, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p2 = new Point2D(2, 4, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p3 = new Point2D(5, 3, 30, 2.0, 2.0, "test", 640, 480, undefined)
        points.push(p1)
        points.push(p2)
        points.push(p3)
        pc = new PointCloud(points)

    it "should calculate distances", ->
        pc.calc_distance()
        expect(pc.distances[0][0]).toEqual 0
        expect(pc.distances[1][1]).toEqual 0
        expect(pc.distances[2][2]).toEqual 0

        expect(pc.distances[0][1]).toEqual 5
        expect(pc.distances[0][2]).toEqual 17
        
        expect(pc.distances[1][0]).toEqual 5
        expect(pc.distances[1][2]).toEqual 10
        
        expect(pc.distances[2][0]).toEqual 17
        expect(pc.distances[2][1]).toEqual 10

