// Generated by CoffeeScript 1.6.3
(function() {
  var Point2D, main;

  Point2D = (function() {
    function Point2D(x, y, r, vx, vy, label, wnd_width, wnd_height, context) {
      this.x = x;
      this.y = y;
      this.r = r;
      this.vx = vx;
      this.vy = vy;
      this.label = label;
      this.wnd_width = wnd_width;
      this.wnd_height = wnd_height;
      this.context = context;
    }

    Point2D.prototype.update_position = function() {
      this.x += this.vx;
      return this.y += this.vy;
    };

    Point2D.prototype.reflect = function() {
      if (this.x - this.r < 0) {
        this.x = this.r;
        this.vx *= -1.0;
      }
      if (this.x + this.r > this.wnd_width) {
        this.x = this.wnd_width - this.r;
        this.vx *= -1;
      }
      if (this.y - this.r < 0) {
        this.y = this.r;
        this.vy *= -1;
      }
      if (this.y + this.r > this.wnd_height) {
        this.y = this.wnd_height - this.r;
        return this.vy *= -1;
      }
    };

    Point2D.prototype.draw = function() {
      this.context.beginPath();
      this.context.strokeStyle = '#00F';
      this.context.fillStyle = '#00F';
      this.context.arc(this.x, this.y, this.r, 0, Math.PI * 2, false);
      this.context.fill();
      this.context.stroke();
      this.context.restore();
      this.context.beginPath();
      this.context.font = "18px 'MS Pゴシック'";
      this.context.fillStyle = "blue";
      this.context.fillText(this.label, this.x, this.y - this.r);
      return this.context.restore();
    };

    return Point2D;

  })();

  exports.Point2D = Point2D;

  Point2D = require('../src/point2d').Point2D;

  main = function() {
    var canvas, context, i, labels, mainloop, num_points, points, vx, vy, x, y, _i;
    canvas = document.getElementById('canvas');
    context = canvas.getContext('2d');
    num_points = 9;
    labels = ["abc", "bcd", "cde", "def", "efg", "fgh", "ghi", "hij", "ijk", "jkl"];
    points = [];
    for (i = _i = 0; 0 <= num_points ? _i <= num_points : _i >= num_points; i = 0 <= num_points ? ++_i : --_i) {
      x = canvas.width / 2 + Math.floor(Math.random() * 200) - 100;
      y = canvas.height / 2 + Math.floor(Math.random() * 200) - 100;
      vx = Math.random() * 5.0 - 2.5;
      vy = Math.random() * 5.0 - 2.5;
      points.push(new Point2D(x, y, 10, vx, vy, labels[i], canvas.width, canvas.height, context));
      points[i].draw();
    }
    mainloop = function() {
      var _j;
      context.save();
      context.beginPath();
      context.clearRect(0, 0, canvas.width, canvas.height);
      context.restore();
      for (i = _j = 0; 0 <= num_points ? _j <= num_points : _j >= num_points; i = 0 <= num_points ? ++_j : --_j) {
        points[i].update_position();
        points[i].reflect();
        points[i].draw();
      }
      return setTimeout(mainloop, 30);
    };
    return mainloop();
  };

  window.onload = main;

}).call(this);
