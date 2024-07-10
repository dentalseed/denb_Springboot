(function (window, document, $) {
  'use strict';

  /**
   * 人眼识别的理想状态为每秒60帧，但用户设备的性能会影响每秒绘制帧数，所以需要计算
   * 出一个比较匀速的帧数手动调用绘制函数，避免出现人眼观察的卡顿现象
   */
  window.requestAnimFrame = (function (callback) {
    return window.requestAnimationFrame ||
      window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.oRequestAnimationFrame ||
      window.msRequestAnimaitonFrame ||
      function (callback) {
        window.setTimeout(callback, 1000 / 60);
      };
  })();

  //插件默认配置
  var pluginName = 'jqSignature',
    defaults = {
      lineColor: '#222222',
      lineWidth: 1,
      border: '1px dashed #AAAAAA',
      background: '#FFFFFF',
      width: 300,
      height: 100,
      autoFit: false
    },
    canvasFixture = '<canvas></canvas>';

  function Signature(element, options) {
    // DOM 节点和对象
    this.element = element;
    this.$element = $(this.element);
    this.canvas = false;
    this.$canvas = false;
    this.ctx = false;
    this.drawing = false;
    this.currentPos = {
      x: 0,
      y: 0
    };
    this.lastPos = this.currentPos;
    // 传入插件配置
    this._data = this.$element.data();
    this.settings = $.extend({}, defaults, options, this._data);
    // 初始化插件
    this.init();
  }

  Signature.prototype = {
    // 初始化画布
    init: function () {
      // 设置画布基础参数
      this.$canvas = $(canvasFixture).appendTo(this.$element);
      this.$canvas.attr({
        width: this.settings.width,
        height: this.settings.height
      });
      this.$canvas.css({
        boxSizing: 'border-box',
        width: this.settings.width + 'px',
        height: this.settings.height + 'px',
        border: this.settings.border,
        background: this.settings.background,
        cursor: 'crosshair'
      });
      // 将画布的宽度填充至父容器宽度
      if (this.settings.autoFit === true) {
        this._resizeCanvas();
      }
      this.canvas = this.$canvas[0];
      this._resetCanvas();
      // 设置鼠标事件
      this.$canvas.on('mousedown touchstart', $.proxy(function (e) {
        this.drawing = true;
        this.lastPos = this.currentPos = this._getPosition(e);
      }, this));
      this.$canvas.on('mousemove touchmove', $.proxy(function (e) {
        this.currentPos = this._getPosition(e);
      }, this));
      this.$canvas.on('mouseup touchend', $.proxy(function (e) {
        this.drawing = false;
        // 触发change事件
        var changedEvent = $.Event('jq.signature.changed');
        this.$element.trigger(changedEvent);
      }, this));
      // 触摸画布时防止页面滚动
      $(document).on('touchstart touchmove touchend', $.proxy(function (e) {
        if (e.target === this.canvas) {
          e.preventDefault();
        }
      }, this));
      // 开始绘制
      var that = this;
      (function drawLoop() {
        window.requestAnimFrame(drawLoop);
        that._renderCanvas();
      })();
    },
    // 清空画布
    clearCanvas: function () {
      this.canvas.width = this.canvas.width;
      this._resetCanvas();
    },
    // 将画布绘制的图片转化为base64格式的图片地址
    getDataURL: function () {
      // return this.canvas.toDataURL();
      var imagestring = this.canvas.toDataURL();
      if (typeof imagestring === 'string' &&
        imagestring.length > 4 &&
        imagestring.slice(0, 5) === 'data:' &&
        imagestring.indexOf(',') !== -1) {
        var splitterpos = imagestring.indexOf(',');
        return [
          imagestring.slice(5, splitterpos)
          , imagestring.substr(splitterpos + 1)
        ];
      }
      return [];
    },
    // 获取鼠标或触摸的定位
    _getPosition: function (event) {
      var xPos, yPos, rect;
      rect = this.canvas.getBoundingClientRect();
      event = event.originalEvent;
      // 触摸事件
      if (event.type.indexOf('touch') !== -1) {
        xPos = event.touches[0].clientX - rect.left;
        yPos = event.touches[0].clientY - rect.top;
      }
      // 鼠标事件
      else {
        xPos = event.clientX - rect.left;
        yPos = event.clientY - rect.top;
      }
      return {
        x: xPos,
        y: yPos
      };
    },
    // 将签名渲染到画布上
    _renderCanvas: function () {
      if (this.drawing) {
        this.ctx.moveTo(this.lastPos.x, this.lastPos.y);
        this.ctx.lineTo(this.currentPos.x, this.currentPos.y);
        this.ctx.stroke();
        this.lastPos = this.currentPos;
      }
    },
    // 重置画布上下文
    _resetCanvas: function () {
      this.ctx = this.canvas.getContext("2d");
      this.ctx.strokeStyle = this.settings.lineColor;
      this.ctx.lineWidth = this.settings.lineWidth;
    },
    // 调整画布大小
    _resizeCanvas: function () {
      var width = this.$element.outerWidth();
      this.$canvas.attr('width', width);
      this.$canvas.css('width', width + 'px');
    }
  };

  /*
  * 封装插件并初始化
  */
  $.fn[pluginName] = function (options) {
    var args = arguments;
    if (options === undefined || typeof options === 'object') {
      return this.each(function () {
        if (!$.data(this, 'plugin_' + pluginName)) {
          $.data(this, 'plugin_' + pluginName, new Signature(this, options));
        }
      });
    }
    else if (typeof options === 'string' && options[0] !== '_' && options !== 'init') {
      var returns;
      this.each(function () {
        var instance = $.data(this, 'plugin_' + pluginName);
        if (instance instanceof Signature && typeof instance[options] === 'function') {
          returns = instance[options].apply(instance, Array.prototype.slice.call(args, 1));
        }
        if (options === 'destroy') {
          $.data(this, 'plugin_' + pluginName, null);
        }
      });
      return returns !== undefined ? returns : this;
    }
  };

})(window, document, jQuery);
