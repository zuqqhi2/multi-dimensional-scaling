Point2D = require('../src/point2d').Point2D

describe "Point2D", ->
    p1 = undefined
    p2 = undefined
    
    beforeEach ->
        p1 = new Point2D(0, 0, 0, 0, 0, "", undefined, undefined)
        p2 = new Point2D(5, 10, 30, 2.0, 2.0, "test", undefined, undefined)

    it "should be x and y axis value are 0", ->
        expect(p1.x).toEqual 0
        expect(p1.y).toEqual 0
        expect(p1.r).toEqual 0
        expect(p1.vx).toEqual 0
        expect(p1.vy).toEqual 0
        expect(p1.label).toEqual ""

    it "should be x and y axis value are 5, 10", ->
        expect(p2.x).toEqual 5
        expect(p2.y).toEqual 10
        expect(p2.r).toEqual 30
        expect(p2.vx).toEqual 2.0
        expect(p2.vy).toEqual 2.0
        expect(p2.label).toEqual "test"
