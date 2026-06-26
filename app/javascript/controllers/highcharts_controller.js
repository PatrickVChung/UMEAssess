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
    yTitle: { type: String, default: 'Score (%)' }
  }

  connect() {
    const isPie = this.chartTypeValue === 'pie'
    const isColumn = this.chartTypeValue === 'column'

    const baseColors = [
      '#7cb5ec', '#f7a35c', '#90ee7e', '#7798BF',
      '#aaeeee', '#ff0066', '#eeaaee', '#55BF3B',
      '#DF5353', '#000080'
    ]

    // Fix 1: Properly utilize the randomized array
    const randomizedColors = [...baseColors].sort(() => 0.5 - Math.random())

    // Fix 2: Explicitly inject colors into each series object for multi-series column charts
    // Color every single individual data point point-by-point
    let colorIndex = 0
    const processedSeries = this.seriesValue.map((seriesObj) => {
      if (isColumn && seriesObj.data) {
        const coloredData = seriesObj.data.map((value) => {
          const color = randomizedColors[colorIndex % randomizedColors.length]
          colorIndex++ // Move to next color for the next bar
          return { y: value, color: color }
        })
        return { ...seriesObj, data: coloredData }
      }
      return seriesObj
    })


    const options = {
      accessibility: { enabled: false },
      chart: { type: this.chartTypeValue },
      title: { text: this.titleValue || 'Default Title',
              style: {
                fontSize: '13px'
              }
             },

      // Fix 3: Use the newly processed series array
      series: processedSeries,
      colors: randomizedColors,

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
          colorByPoint: true
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
