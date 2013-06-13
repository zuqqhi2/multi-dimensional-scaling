Point2D = require('../src/point2d').Point2D

describe "Point2D", ->
    p1 = undefined
    p2 = undefined
    p3 = undefined
    p4 = undefined
    p5 = undefined
    
    beforeEach ->
        p1 = new Point2D(0, 0, 0, 0, 0, "", 0, 0, undefined)
        p2 = new Point2D(100, 200, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p3 = new Point2D(100, 200, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p4 = new Point2D(1, 2, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p5 = new Point2D(2, 4, 30, 2.0, 2.0, "test", 640, 480, undefined)

    it "should be x and y axis value are 0", ->
        expect(p1.x).toEqual 0
        expect(p1.y).toEqual 0
        expect(p1.r).toEqual 0
        expect(p1.vx).toEqual 0
        expect(p1.vy).toEqual 0
        expect(p1.wnd_width).toEqual 0
        expect(p1.wnd_height).toEqual 0
        expect(p1.label).toEqual ""

    it "should be x and y axis value are 5, 10", ->
        expect(p2.x).toEqual 100
        expect(p2.y).toEqual 200
        expect(p2.r).toEqual 30
        expect(p2.vx).toEqual 2.0
        expect(p2.vy).toEqual 2.0
        expect(p2.wnd_width).toEqual 640
        expect(p2.wnd_height).toEqual 480
        expect(p2.label).toEqual "test"

    it "should add velocity for x and y to 102.0 and 202.0", ->
        p2.update_position()
        expect(p2.x).toEqual 102.0
        expect(p2.y).toEqual 202.0

    it "should get x and y value with array style", ->
        data = p3.get_data()
        expect(data[0]).toEqual 100.0
        expect(data[1]).toEqual 200.0
    
    it "should get 5 as distance", ->
        expect(p4.calc_distance(p5)).toEqual 5
