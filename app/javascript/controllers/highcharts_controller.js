import { Controller } from "@hotwired/stimulus"
import Highcharts from "highcharts"

export default class extends Controller {
  static values = {
    series: Array,
    categories: Array,
    title: String,
    chartType: { type: String, default: 'column' },
    yMax: { type: Number, default: 100 },
    yTickInterval: { type: Number, default: 20 },
    yTitle: { type: String, default: 'Score (%)' },
    colorByPoint: { type: Boolean, default: false }
  }

  connect() {
    const isPie = this.chartTypeValue === 'pie'
    const isColumn = this.chartTypeValue === 'column'

    const options = {
      accessibility: { enabled: false },
      chart: { type: this.chartTypeValue },
      title: { text: this.titleValue || 'Default Title',
              style: {
                fontSize: '13px'
              }
             },

      series: this.seriesValue, 

      xAxis: isPie ? {} : {
        categories: this.categoriesValue,
        labels: {
          style: { fontWeight: 'bold', color: '#000000', fontSize: '13px' }
        }
      },

      yAxis: isPie ? [] : [{
        min: 0,
        max: this.yMaxValue,
        tickInterval: this.yTickIntervalValue,
        title: {
          text: this.yTitleValue,
          style: { fontWeight: 'bold', color: '#000000', fontSize: '13px' }
        }
      }],

      plotOptions: {
        column: {
          dataLabels: {
              enabled: true,
              crop: false,
              overflow: 'none'
          },
          // Keep this true if you ever switch to a single series with multiple points
          colorByPoint: this.colorByPointValue
        },
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          depth: 25,
          dataLabels: {
            enabled: true,
            crop: false,
            format: '<b>{point.name}</b>:<br>{point.percentage:.1f} %<br>value: {point.y}'
          }
        }
      }
    }
    this.chart = Highcharts.chart(this.element, options)
  }

  disconnect() {
    if (this.chart) {
      this.chart.destroy()
    }
  }
}
