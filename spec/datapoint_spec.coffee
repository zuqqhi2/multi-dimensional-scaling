DataPoint = require('../src/datapoint').DataPoint

describe "DataPoint", ->
    p1 = undefined
    p2 = undefined
    p3 = undefined
    p4 = undefined
    
    beforeEach ->
        column_name = ["a","b","c","d","e"]
        p1 = new DataPoint([1, 2, 3, 4, 5], "test", column_name)
        p2 = new DataPoint([5, 4, 3, 2, 1], "test", column_name)
        p3 = new DataPoint([1, 3, 5, 7, 9], "test", column_name)
        p4 = new DataPoint([3, 5, 2, 4, 6], "test", column_name)

    it "should be x and y axis value are 5, 10", ->
        expect(p1.data[0]).toEqual 1
        expect(p1.data[1]).toEqual 2
        expect(p1.data[2]).toEqual 3
        expect(p1.data[3]).toEqual 4
        expect(p1.data[4]).toEqual 5
        expect(p1.label).toEqual "test"
        expect(p1.column_name[0]).toEqual "a"
        expect(p1.column_name[1]).toEqual "b"
        expect(p1.column_name[2]).toEqual "c"
        expect(p1.column_name[3]).toEqual "d"
        expect(p1.column_name[4]).toEqual "e"

    it "should get x and y value with array style", ->
        data = p2.get_data()
        expect(data[0]).toEqual 5
        expect(data[1]).toEqual 4
        expect(data[2]).toEqual 3
        expect(data[3]).toEqual 2
        expect(data[4]).toEqual 1
    
    it "should get sqrt(35) as distance", ->
        expect(p3.calc_distance(p4)).toEqual Math.sqrt(35)
