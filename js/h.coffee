class Helpers
  constructor:-> @vars()
  vars:-> @prefix = @getPrefix()

  getRadialPoint:(o={})->
    return if !o.radius? or !o.angle? or !o.center?
    radAngle = (o.angle-90)*(Math.PI/180)
    point =
      x: o.center.x + (Math.cos(radAngle)*o.radius)
      y: o.center.y + (Math.sin(radAngle)*o.radius)

  getPrefix:->
    styles = window.getComputedStyle(document.documentElement, "")
    v = Array::slice.call(styles).join("").match(/-(moz|webkit|ms)-/)
    pre = (v or (styles.OLink is "" and [
      ""
      "o"
    ]))[1]
    dom = ("WebKit|Moz|MS|O").match(new RegExp("(" + pre + ")", "i"))[1]
    
    dom: dom
    lowercase: pre
    css: "-" + pre + "-"
    js: pre[0].toUpperCase() + pre.substr(1)

  # stylePropsMap:
  #   # width:              1
  #   # height:             1
  #   fill:               1
  #   fillOpacity:        1
  #   opacity:            1
  #   stroke:             1
  #   strokeWidth:        1
  #   strokeDasharray:    1
  #   strokeOffset:       1
  #   strokeLinejoin:     1
  #   strokeLinecap:      1

### istanbul ignore next ###
if (typeof define is "function") and define.amd
  define "Helpers", [], -> new Helpers
if (typeof module is "object") and (typeof module.exports is "object")
  module.exports = new Helpers
### istanbul ignore next ###
window?.mojs ?= {}
window?.mojs.helpers = new Helpers

