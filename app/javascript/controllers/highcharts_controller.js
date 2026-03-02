// app/javascript/controllers/highcharts_controller.js
import { Controller } from "@hotwired/stimulus"
import Highcharts from "highcharts"

export default class extends Controller {
  static values = {
    series: Array,
    categories: Array,
    title: String
  }

  connect() {
    this.chart = Highcharts.chart(this.element, {
      chart: { type: 'column' },
      title: { text: this.titleValue || 'Default Title' },
      series: this.seriesValue, // This is your @series_data from Rails
      xAxis: {
              categories: this.categoriesValue,
              labels: {
                        style:  {
                                    fontWeight: 'bold',
                                    color: '#000000',
                                    fontSize: '13px'
                                }
                          }
            },
      colors: ["#7EFF5E", "#6E92FF"],
      yAxis: [
               { min: 0,
                 max: 100,
                 tickInterval: 20,
                 title: { text: "Score (%)", margin: 20,
                          style: {
                                   fontWeight: 'bold',
                                   color: '#000000',
                                   fontSize: '13px'
                                }
                        }
               }
             ]
    })
  }

  // If you are using Turbo Frames, ensure you destroy the chart on disconnect
  disconnect() {
    this.chart.destroy()
  }
}
