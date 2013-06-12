Point2D = require('../src/point2d').Point2D

describe "Point2D", ->
    p1 = undefined
    p2 = undefined
    p3 = undefined
    p4 = undefined
    p5 = undefined
    p6 = undefined
    
    beforeEach ->
        p1 = new Point2D(0, 0, 0, 0, 0, "", 0, 0, undefined)
        p2 = new Point2D(100, 200, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p3 = new Point2D(5, 200, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p4 = new Point2D(630, 200, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p5 = new Point2D(100, 10, 30, 2.0, 2.0, "test", 640, 480, undefined)
        p6 = new Point2D(100, 470, 30, 2.0, 2.0, "test", 640, 480, undefined)

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

    it "should reflect with left side", ->
        p3.reflect()
        expect(p3.x).toEqual 30
        expect(p3.vx).toEqual -2.0

    it "should reflect with right side", ->
        p4.reflect()
        expect(p4.x).toEqual 610
        expect(p4.vx).toEqual -2.0
    
    it "should reflect with left side", ->
        p5.reflect()
        expect(p5.y).toEqual 30
        expect(p5.vy).toEqual -2.0
    
    it "should reflect with left side", ->
        p6.reflect()
        expect(p6.y).toEqual 450
        expect(p6.vy).toEqual -2.0
