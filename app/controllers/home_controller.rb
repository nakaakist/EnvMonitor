# coding: utf-8
class HomeController < ApplicationController
  def index
    now_t = Time.now
    env2d = Envlog.pluck(:aq_time, :a_x, :a_y, :a_z).transpose
    aq_times = env2d[0]
    a_xs = env2d[1]
    a_ys = env2d[2]
    a_zs = env2d[3]
    @graph_data = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Acceleration')
      f.xAxis(tickInterval: 10,
              type: 'datetime')
      f.series(name: 'x', data: [aq_times, a_xs].transpose, type: 'spline')
      f.series(name: 'y', data: [aq_times, a_ys].transpose, type: 'spline')
      f.series(name: 'z', data: [aq_times, a_zs].transpose, type: 'spline')
      f.yAxis({title: {text: "G", margin: 70}})
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end
  end
end
