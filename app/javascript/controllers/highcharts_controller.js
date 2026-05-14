// app/javascript/controllers/highcharts_controller.js
import { Controller } from "@hotwired/stimulus"
import Highcharts from "highcharts"

export default class extends Controller {
  static values = {
    series: Array,
    categories: Array,
    title: String,
    chartType: { type: String, default: 'column' },
    yMax: { type: Number, default: 100 },
    yTickInterval: { type: Number, default: 20 },  // Added yMax
    yTitle: { type: String, default: 'Score (%)' } // Added yTitle
  }

  connect() {
    const isPie = this.chartTypeValue === 'pie'

    const options = {
      accessibility: {
            enabled: false
      },
      chart: { type: this.chartTypeValue },
      title: { text: this.titleValue || 'Default Title' },
      series: this.seriesValue,
      colors: ["#7EFF5E", "#6E92FF", "#FFD700", "#FF6347"], // Expanded color array

      // Pie charts usually don't want axes
      xAxis: isPie ? {} : {
        categories: this.categoriesValue,
        labels: {
          style: { fontWeight: 'bold', color: '#000000', fontSize: '13px' }
        }
      },

      yAxis: isPie ? [] : [{
        min: 0,
        max: this.yMaxValue,
        tickInterval: 20,
        title: {
          text: this.yTitleValue,
          margin: this.yTickIntervalValue,
          style: { fontWeight: 'bold', color: '#000000', fontSize: '13px' }
        }
      }],

      plotOptions: {
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
