# coding: utf-8
class HomeController < ApplicationController
  def index
    now_t = Time.now
    acc2d = Acclog.limit(50).pluck(:aq_time, :a_x, :a_y, :a_z).transpose
    tmp2d = Tmplog.limit(50).pluck(:aq_time, :temperature).transpose
    a_aq_times = acc2d[0]
    a_xs = acc2d[1]
    a_ys = acc2d[2]
    a_zs = acc2d[3]
    t_aq_times = tmp2d[0]
    tmps = tmp2d[1]
    @acc_graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(tickInterval: 10,
              title: {text: "Time"},
              type: 'datetime',
              dateTimeLabelFormats: {
                second: '%H:%M:%S',
                minute: '%H:%M',
                hour: '%m/%e %H:%M',
                day: '%y/%m/%e',
                month: '%Y/%m',
                year: '(%Y)'
            })
      f.series(name: 'x', data: [a_aq_times, a_xs].transpose, type: 'spline')
      f.series(name: 'y', data: [a_aq_times, a_ys].transpose, type: 'spline')
      f.series(name: 'z', data: [a_aq_times, a_zs].transpose, type: 'spline')
      f.yAxis({title: {text: "G", margin: 20}})
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.tooltip(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end

    @tmp_graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(tickInterval: 10,
              title: {text: "Time"},
              type: 'datetime',
              dateTimeLabelFormats: {
                second: '%H:%M:%S',
                minute: '%H:%M',
                hour: '%m/%e %H:%M',
                day: '%y/%m/%e',
                month: '%Y/%m',
                year: '(%Y)'
              })
      f.series(name: 'T', data: [t_aq_times, tmps].transpose, type: 'spline')
      f.yAxis({title: {text: "Degree", margin: 20}})
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.tooltip(enabled: false)
      f.chart({defaultSeriesType: "column"})
    end
  end
end
